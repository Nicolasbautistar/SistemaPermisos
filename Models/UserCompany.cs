using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class UserCompany
    {
        public UserCompany()
        {
            PermiUserRecords = new HashSet<PermiUserRecord>();
            PermiUsers = new HashSet<PermiUser>();
        }

        public long IdUseco { get; set; }
        public long UserId { get; set; }
        public long CompanyId { get; set; }
        public bool? UsecoActive { get; set; }

        public virtual Company Company { get; set; } = null!;
        public virtual User User { get; set; } = null!;
        public virtual ICollection<PermiUserRecord> PermiUserRecords { get; set; }
        public virtual ICollection<PermiUser> PermiUsers { get; set; }
    }
}
