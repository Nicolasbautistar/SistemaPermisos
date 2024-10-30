using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class CostCenter
    {
        public CostCenter()
        {
            InverseCosceParent = new HashSet<CostCenter>();
        }

        public long IdCosce { get; set; }
        public long CompanyId { get; set; }
        public long? CosceParentId { get; set; }
        public string CosceCode { get; set; } = null!;
        public string CosceName { get; set; } = null!;
        public string? CosceDescription { get; set; }
        public decimal CosceBudget { get; set; }
        public short CosceLevel { get; set; }
        public bool? CosceActive { get; set; }

        public virtual Company Company { get; set; } = null!;
        public virtual CostCenter? CosceParent { get; set; }
        public virtual ICollection<CostCenter> InverseCosceParent { get; set; }
    }
}
