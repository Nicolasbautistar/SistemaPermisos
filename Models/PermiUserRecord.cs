using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class PermiUserRecord
    {
        public long IdPeusr { get; set; }
        public long UsercompanyId { get; set; }
        public long PermissionId { get; set; }
        public int EntitycatalogId { get; set; }
        public long PeusrRecord { get; set; }
        public bool? PeusrInclude { get; set; }

        public virtual EntityCatalog Entitycatalog { get; set; } = null!;
        public virtual Permission Permission { get; set; } = null!;
        public virtual UserCompany Usercompany { get; set; } = null!;
    }
}
