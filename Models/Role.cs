using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class Role
    {
        public Role()
        {
            PermiRoleRecords = new HashSet<PermiRoleRecord>();
            PermiRoles = new HashSet<PermiRole>();
        }

        public long IdRole { get; set; }
        public long CompanyId { get; set; }
        public string RoleName { get; set; } = null!;
        public string RoleCode { get; set; } = null!;
        public string? RoleDescription { get; set; }
        public bool? RoleActive { get; set; }

        public virtual Company Company { get; set; } = null!;
        public virtual ICollection<PermiRoleRecord> PermiRoleRecords { get; set; }
        public virtual ICollection<PermiRole> PermiRoles { get; set; }
    }
}
