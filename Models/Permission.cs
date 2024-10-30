using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class Permission
    {
        public Permission()
        {
            PermiRoleRecords = new HashSet<PermiRoleRecord>();
            PermiRoles = new HashSet<PermiRole>();
            PermiUserRecords = new HashSet<PermiUserRecord>();
            PermiUsers = new HashSet<PermiUser>();
        }

        public long IdPermi { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public bool CanCreate { get; set; }
        public bool CanRead { get; set; }
        public bool CanUpdate { get; set; }
        public bool CanDelete { get; set; }
        public bool CanImport { get; set; }
        public bool CanExport { get; set; }

        public virtual ICollection<PermiRoleRecord> PermiRoleRecords { get; set; }
        public virtual ICollection<PermiRole> PermiRoles { get; set; }
        public virtual ICollection<PermiUserRecord> PermiUserRecords { get; set; }
        public virtual ICollection<PermiUser> PermiUsers { get; set; }
    }
}
