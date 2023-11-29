using System;
using System.Collections.Generic;

namespace cj_web_service.Models.DBModels
{
    public partial class FinancialInfo
    {
        public int FinancialInfoId { get; set; }
        public string? InfoTopic { get; set; }
        public int? Salary { get; set; }
        public double? Use { get; set; }
        public double? Balance { get; set; }
    }
}
