using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class PermiRole
    {
        public long IdPerol { get; set; }
        public long RoleId { get; set; }
        public long PermissionId { get; set; }
        public int EntitycatalogId { get; set; }
        public bool? PerolInclude { get; set; }
        public long? PerolRecord { get; set; }

        public virtual EntityCatalog Entitycatalog { get; set; } = null!;
        public virtual Permission Permission { get; set; } = null!;
        public virtual Role Role { get; set; } = null!;
    }
}
