using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class BranchOffice
    {
        public long IdBroff { get; set; }
        public long CompanyId { get; set; }
        public string BroffName { get; set; } = null!;
        public string BroffCode { get; set; } = null!;
        public string BroffAddress { get; set; } = null!;
        public string BroffCity { get; set; } = null!;
        public string BroffState { get; set; } = null!;
        public string BroffCountry { get; set; } = null!;
        public string BroffPhone { get; set; } = null!;
        public string BroffEmail { get; set; } = null!;
        public bool? BroffActive { get; set; }

        public virtual Company Company { get; set; } = null!;
    }
}
