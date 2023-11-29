using cj_web_service.Models.DBModels;

namespace cj_web_service.Models
{
    public class FinancialDetailScreenModel
    {
        public int? FinancialInfoId { get; set; }
        public string? InfoTopic { get; set; }
        public int? Salary { get; set; }
        public double? Use { get; set; }
        public double? Balance { get; set; }
        public List<FinancialType> FinancialTypeList { get; set; }
        public List<FinancialDetail> FinancialDetailList { get; set; }

        public FinancialDetailScreenModel() 
        {
            FinancialTypeList = new List<FinancialType>();
            FinancialDetailList = new List<FinancialDetail>();
        }
    }
}
