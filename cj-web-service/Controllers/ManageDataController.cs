using cj_web_service.Models;
using cj_web_service.Models.DBModels;
using cj_web_service.Service;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;

namespace cj_web_service.Controllers
{
    [Area("api")]
    public class ManageDataController :ControllerBase
    {
        private readonly ILogger<ManageDataController> _logger;
        private IManageData_Service _manageData_Service;
        public ManageDataController(ILogger<ManageDataController> logger, IManageData_Service manageData_Service)
        {
            _logger = logger;
            _manageData_Service = manageData_Service;
        }

        [HttpGet]
        public async Task<IActionResult> GetFinancialInfoList()
        {
            try
            {
                List<FinancialInfo> res = _manageData_Service.GetFinancialInfoList();

                return StatusCode(200, new ResponseModel() { status = 200, data = res });
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }

        [HttpGet]
        public async Task<IActionResult> GetFinancialDetail(int? financialInfoID)
        {
            try
            {
                if (!financialInfoID.HasValue) throw new Exception("FinancialInfoID must have value");

                FinancialDetailScreenModel res = _manageData_Service.GetFinancialDetail(financialInfoID);

                return StatusCode(200, new ResponseModel() { status = 200, data = res });
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> SaveFinancialDetail([FromBody] FinancialDetailScreenModel data)
        {
            try
            {
                FinancialDetailScreenModel res = await _manageData_Service.SaveFinancialDetail(data);

                return StatusCode(200, res);
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }

        [HttpPost]
        public async Task<IActionResult> CreateFinancialInfo([FromBody] FinancialDetailScreenModel data)
        {
            try
            {
                FinancialDetailScreenModel res = await _manageData_Service.CreateFinancialInfo(data);

                return StatusCode(200, res);
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }

        [HttpGet]
        public async Task<IActionResult> DuplicateFinancialInfo(int? financialInfoID)
        {
            try
            {
                if (!financialInfoID.HasValue) throw new Exception("FinancialInfoID must have value");

                bool res = await _manageData_Service.DuplicateFinancialInfo(financialInfoID);

                return StatusCode(200, new ResponseModel() { status = 200, data = res });
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }

        [HttpGet]
        public async Task<IActionResult> RemoveFinancialInfo(int? financialInfoID)
        {
            try
            {
                if (!financialInfoID.HasValue) throw new Exception("FinancialInfoID must have value");

                bool res = await _manageData_Service.RemoveFinancialInfo(financialInfoID);

                return StatusCode(200, new ResponseModel() { status = 200, data = res });
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }

        [HttpGet]
        public async Task<IActionResult> ResetAutoIncreament()
        {
            try
            {

                bool res = await _manageData_Service.ResetAutoIncreament();

                return StatusCode(200, new ResponseModel() { status = 200, data = res });
            }
            catch (Exception ex)
            {

                return StatusCode(500, new ResponseModel()
                {
                    status = 500,
                    errors = new ExceptionModel()
                    {
                        message = ex.Message,
                    }
                });
            }
        }
    }
}
