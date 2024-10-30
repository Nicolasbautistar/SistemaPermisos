using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class EntityCatalog
    {
        public EntityCatalog()
        {
            PermiRoleRecords = new HashSet<PermiRoleRecord>();
            PermiRoles = new HashSet<PermiRole>();
            PermiUserRecords = new HashSet<PermiUserRecord>();
            PermiUsers = new HashSet<PermiUser>();
        }

        public int IdEntit { get; set; }
        public string EntitName { get; set; } = null!;
        public string EntitDescrip { get; set; } = null!;
        public bool? EntitActive { get; set; }
        public string? EntitConfig { get; set; }

        public virtual ICollection<PermiRoleRecord> PermiRoleRecords { get; set; }
        public virtual ICollection<PermiRole> PermiRoles { get; set; }
        public virtual ICollection<PermiUserRecord> PermiUserRecords { get; set; }
        public virtual ICollection<PermiUser> PermiUsers { get; set; }
    }
}
