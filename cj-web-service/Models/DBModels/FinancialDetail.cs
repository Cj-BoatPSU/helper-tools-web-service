using System;
using System.Collections.Generic;

namespace cj_web_service.Models.DBModels
{
    public partial class FinancialDetail
    {
        public int? FinancialDetailId { get; set; }
        public int? FinancialInfoId { get; set; }
        public int? TypeId { get; set; }
        public string? Topic { get; set; }
        public double? Amount { get; set; }
    }
}
