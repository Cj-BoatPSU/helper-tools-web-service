using System;
using System.Collections.Generic;

namespace cj_web_service.Models.DBModels
{
    public partial class FinancialType
    {
        public int TypeId { get; set; }
        public string? Type { get; set; }
        public int? Percent { get; set; }
        public int? Value { get; set; }
        public int? FinancialInfoId { get; set; }
        public double? Use { get; set; }
        public double? Balance { get; set; }
    }
}
