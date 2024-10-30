using System;
using System.Collections.Generic;

namespace Sistema_de_Permisos.Models
{
    public partial class User
    {
        public User()
        {
            UserCompanies = new HashSet<UserCompany>();
        }

        public long IdUser { get; set; }
        public string UserUsername { get; set; } = null!;
        public string UserPassword { get; set; } = null!;
        public string UserEmail { get; set; } = null!;
        public string? UserPhone { get; set; }
        public bool UserIsAdmin { get; set; }
        public bool? UserIsActive { get; set; }

        public virtual ICollection<UserCompany> UserCompanies { get; set; }
    }
}
