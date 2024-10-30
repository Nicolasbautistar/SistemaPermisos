using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class Company
    {
        public Company()
        {
            BranchOffices = new HashSet<BranchOffice>();
            CostCenters = new HashSet<CostCenter>();
            Roles = new HashSet<Role>();
            UserCompanies = new HashSet<UserCompany>();
        }

        public long IdCompa { get; set; }
        public string CompaName { get; set; } = null!;
        public string CompaTradename { get; set; } = null!;
        public string CompaDoctype { get; set; } = null!;
        public string CompaDocnum { get; set; } = null!;
        public string CompaAddress { get; set; } = null!;
        public string CompaCity { get; set; } = null!;
        public string CompaState { get; set; } = null!;
        public string CompaCountry { get; set; } = null!;
        public string CompaIndustry { get; set; } = null!;
        public string CompaPhone { get; set; } = null!;
        public string CompaEmail { get; set; } = null!;
        public string? CompaWebsite { get; set; }
        public string? CompaLogo { get; set; }
        public bool? CompaActive { get; set; }

        public virtual ICollection<BranchOffice> BranchOffices { get; set; }
        public virtual ICollection<CostCenter> CostCenters { get; set; }
        public virtual ICollection<Role> Roles { get; set; }
        public virtual ICollection<UserCompany> UserCompanies { get; set; }
    }
}
