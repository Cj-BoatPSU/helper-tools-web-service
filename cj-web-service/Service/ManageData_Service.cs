using cj_web_service.Context;
using cj_web_service.Models;
using cj_web_service.Models.DBModels;
using Microsoft.AspNetCore.Http;
using Microsoft.Data.SqlClient;

namespace cj_web_service.Service
{
    public interface IManageData_Service
    {
        public List<FinancialInfo> GetFinancialInfoList();
        public FinancialDetailScreenModel GetFinancialDetail(int? financialInfoID);
        public Task<FinancialDetailScreenModel> SaveFinancialDetail(FinancialDetailScreenModel data);
        public Task<FinancialDetailScreenModel> CreateFinancialInfo(FinancialDetailScreenModel data);
        public Task<bool> DuplicateFinancialInfo(int? financialInfoID);
        public Task<bool> RemoveFinancialInfo(int? financialInfoID);
        public Task<bool> ResetAutoIncreament();
    }
    public class ManageData_Service : IManageData_Service
    {
        public ManageData_Service() { }

        public List<FinancialInfo> GetFinancialInfoList()
        {
            List<FinancialInfo> result = new List<FinancialInfo>();

            using (var _coreContext = new CoreContext())
            {
                result = _coreContext.FinancialInfos.ToList();
            }
            return result.ToList();
        }

        public FinancialDetailScreenModel GetFinancialDetail(int? financialInfoID)
        {
            FinancialDetailScreenModel result = new FinancialDetailScreenModel();
            using (var _coreContext = new CoreContext())
            {
                FinancialInfo info = _coreContext.FinancialInfos.Where(x => x.FinancialInfoId.Equals(financialInfoID)).FirstOrDefault();
                result.FinancialInfoId = info.FinancialInfoId;
                result.InfoTopic = info.InfoTopic;
                result.Salary = info.Salary;
                result.Use = info.Use;
                result.Balance = info.Balance;

                result.FinancialTypeList = _coreContext.FinancialTypes.Where(x => x.FinancialInfoId.Equals(financialInfoID)).ToList();
                result.FinancialDetailList = _coreContext.FinancialDetails.Where(x => x.FinancialInfoId.Equals(financialInfoID)).OrderBy(x => x.TypeId).ThenBy(x => x.FinancialDetailId).ToList();
            }

            return result;
        }

        public async Task<FinancialDetailScreenModel> SaveFinancialDetail(FinancialDetailScreenModel data)
        {
            using (var _coreContext = new CoreContext())
            {
                FinancialInfo info = _coreContext.FinancialInfos.Where(x => x.FinancialInfoId.Equals(data.FinancialInfoId)).FirstOrDefault();
                info.InfoTopic = data.InfoTopic;
                info.Salary = data.Salary;
                info.Use = data.Use;
                info.Balance = data.Balance;
                await _coreContext.SaveChangesAsync();

                List<FinancialType> typeList = _coreContext.FinancialTypes.Where(x => x.FinancialInfoId.Equals(data.FinancialInfoId)).ToList();

                foreach (FinancialType type in typeList)
                {
                    FinancialType item_type = data.FinancialTypeList.Where(x => x.TypeId.Equals(type.TypeId)).FirstOrDefault();
                    type.Type = item_type.Type;
                    type.Percent = item_type.Percent;
                    type.Value = item_type.Value;
                    type.Use = item_type.Use;
                    type.Balance = item_type.Balance;
                    await _coreContext.SaveChangesAsync();
                }

                List<FinancialDetail> detailList = _coreContext.FinancialDetails.Where(x => x.FinancialInfoId.Equals(data.FinancialInfoId)).ToList();

                foreach (FinancialDetail detail in data.FinancialDetailList)
                {
                    FinancialDetail item_detail = detailList.Where(x => x.FinancialDetailId.Equals(detail.FinancialDetailId)).FirstOrDefault();
                    if (item_detail == null) //Add
                    {
                        FinancialDetail new_detail_item = new FinancialDetail();
                        new_detail_item.FinancialInfoId = data.FinancialInfoId;
                        new_detail_item.TypeId = detail.TypeId;
                        new_detail_item.Topic = detail.Topic;
                        new_detail_item.Amount = detail.Amount;
                        new_detail_item.AlreadyPaid = detail.AlreadyPaid;

                        await _coreContext.FinancialDetails.AddAsync(new_detail_item);
                    }
                    else //Update
                    {
                        item_detail.TypeId = detail.TypeId;
                        item_detail.Topic = detail.Topic;
                        item_detail.Amount = detail.Amount;
                        item_detail.AlreadyPaid = detail.AlreadyPaid;
                    }

                    await _coreContext.SaveChangesAsync();
                }

                foreach (FinancialDetail detail in detailList)
                {
                    FinancialDetail item_detail = data.FinancialDetailList.FirstOrDefault(x => x.FinancialDetailId.Equals(detail.FinancialDetailId));
                    if (item_detail == null) //Remove
                    {
                        _coreContext.FinancialDetails.Remove(detail);
                        await _coreContext.SaveChangesAsync();
                    }
                }

                if (detailList.All(x => x.AlreadyPaid == true))
                {
                    info.IsCompleted = true;
                    await _coreContext.SaveChangesAsync();
                }

            }

            return data;
        }

        public async Task<FinancialDetailScreenModel> CreateFinancialInfo(FinancialDetailScreenModel data)
        {
            using (var _coreContext = new CoreContext())
            {
                FinancialInfo new_info = new FinancialInfo();
                new_info.InfoTopic = data.InfoTopic;
                new_info.Salary = data.Salary;
                new_info.Use = data.Use;
                new_info.Balance = data.Balance;
                await _coreContext.FinancialInfos.AddAsync(new_info);
                await _coreContext.SaveChangesAsync();

                List<FinancialType> typeList = new List<FinancialType>();
                foreach (FinancialType type in data.FinancialTypeList)
                {
                    FinancialType new_type_item = new FinancialType();
                    new_type_item.FinancialInfoId = new_info.FinancialInfoId;
                    new_type_item.Type = type.Type;
                    new_type_item.Percent = type.Percent;
                    new_type_item.Value = type.Value;
                    new_type_item.Use = type.Use;
                    new_type_item.Balance = type.Balance;
                    await _coreContext.FinancialTypes.AddAsync(new_type_item);
                    await _coreContext.SaveChangesAsync();

                    typeList.Add(new_type_item);
                }

                foreach (FinancialDetail detail in data.FinancialDetailList)
                {
                    FinancialDetail new_detail_item = new FinancialDetail();
                    new_detail_item.FinancialInfoId = new_info.FinancialInfoId;
                    new_detail_item.Topic = detail.Topic;
                    new_detail_item.Amount = detail.Amount;

                    FinancialType type_item = data.FinancialTypeList.FirstOrDefault(x => x.TypeId.Equals(detail.TypeId));
                    FinancialType new_type_item = typeList.FirstOrDefault(x => x.Type.Equals(type_item.Type));
                    new_detail_item.TypeId = new_type_item.TypeId;

                    await _coreContext.FinancialDetails.AddAsync(new_detail_item);
                    await _coreContext.SaveChangesAsync();
                }
            }

            return data;
        }

        public async Task<bool> DuplicateFinancialInfo(int? financialInfoID)
        {
            bool IsSuccess = false;

            FinancialDetailScreenModel detail = GetFinancialDetail(financialInfoID);
            detail.InfoTopic += " (Duplicate)";

            FinancialDetailScreenModel result = await CreateFinancialInfo(detail);
            IsSuccess = true;

            return IsSuccess;
        }

        public async Task<bool> RemoveFinancialInfo(int? financialInfoID)
        {
            bool IsSuccess = false;

            using (var _coreContext = new CoreContext())
            {
                FinancialInfo info = _coreContext.FinancialInfos.FirstOrDefault(x => x.FinancialInfoId.Equals(financialInfoID));
                _coreContext.FinancialInfos.Remove(info);
                _coreContext.SaveChanges();

                List<FinancialType> typeList = _coreContext.FinancialTypes.Where(x => x.FinancialInfoId.Equals(financialInfoID)).ToList();
                _coreContext.FinancialTypes.RemoveRange(typeList);
                _coreContext.SaveChanges();

                List<FinancialDetail> detailList = _coreContext.FinancialDetails.Where(x => x.FinancialInfoId.Equals(financialInfoID)).ToList();
                _coreContext.FinancialDetails.RemoveRange(detailList);
                _coreContext.SaveChanges();

                IsSuccess = true;
            }

            return IsSuccess;
        }

        public async Task<bool> ResetAutoIncreament()
        {
            bool IsSuccess = false;
            string connectionString = "Server=(localdb)\\Local;Initial Catalog=Helper_Tools_DB;Trusted_Connection=True;";

            using (var _coreContext = new CoreContext())
            {
                FinancialInfo info = _coreContext.FinancialInfos.OrderBy(x => x.FinancialInfoId).LastOrDefault();
                FinancialType type = _coreContext.FinancialTypes.OrderBy(x => x.TypeId).LastOrDefault();
                FinancialDetail detail = _coreContext.FinancialDetails.OrderBy(x => x.FinancialDetailId).LastOrDefault();

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command_info = new SqlCommand($"DBCC CHECKIDENT (FinancialInfo, RESEED, {info.FinancialInfoId})", connection);
                    command_info.ExecuteNonQuery();

                    SqlCommand command_type = new SqlCommand($"DBCC CHECKIDENT (FinancialType, RESEED, {type.TypeId})", connection);
                    command_type.ExecuteNonQuery();

                    SqlCommand command_detail = new SqlCommand($"DBCC CHECKIDENT (FinancialDetail, RESEED, {detail.FinancialDetailId})", connection);
                    command_detail.ExecuteNonQuery();

                    IsSuccess = true;
                }
            }


            return IsSuccess;
        }
    }
}
