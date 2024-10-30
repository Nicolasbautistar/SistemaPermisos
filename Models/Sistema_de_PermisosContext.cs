using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Sistema_de_Permisos.Models
{
    public partial class Sistema_de_PermisosContext : DbContext
    {
        public Sistema_de_PermisosContext()
        {
        }

        public Sistema_de_PermisosContext(DbContextOptions<Sistema_de_PermisosContext> options)
            : base(options)
        {
        }
        
        public virtual DbSet<BranchOffice> BranchOffices { get; set; } = null!;
        public virtual DbSet<Company> Companies { get; set; } = null!;
        public virtual DbSet<CostCenter> CostCenters { get; set; } = null!;
        public virtual DbSet<EntityCatalog> EntityCatalogs { get; set; } = null!;
        public virtual DbSet<PermiRole> PermiRoles { get; set; } = null!;
        public virtual DbSet<PermiRoleRecord> PermiRoleRecords { get; set; } = null!;
        public virtual DbSet<PermiUser> PermiUsers { get; set; } = null!;
        public virtual DbSet<PermiUserRecord> PermiUserRecords { get; set; } = null!;
        public virtual DbSet<Permission> Permissions { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserCompany> UserCompanies { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {           
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BranchOffice>(entity =>
            {
                entity.HasKey(e => e.IdBroff)
                    .HasName("PK__BranchOf__79FE3C8F8622A6D1");

                entity.ToTable("BranchOffice");

                entity.HasIndex(e => new { e.CompanyId, e.BroffCode }, "UQ_Company_BranchCode")
                    .IsUnique();

                entity.Property(e => e.IdBroff).HasColumnName("id_broff");

                entity.Property(e => e.BroffActive)
                    .IsRequired()
                    .HasColumnName("broff_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.BroffAddress)
                    .HasMaxLength(255)
                    .HasColumnName("broff_address");

                entity.Property(e => e.BroffCity)
                    .HasMaxLength(255)
                    .HasColumnName("broff_city");

                entity.Property(e => e.BroffCode)
                    .HasMaxLength(255)
                    .HasColumnName("broff_code");

                entity.Property(e => e.BroffCountry)
                    .HasMaxLength(255)
                    .HasColumnName("broff_country");

                entity.Property(e => e.BroffEmail)
                    .HasMaxLength(255)
                    .HasColumnName("broff_email");

                entity.Property(e => e.BroffName)
                    .HasMaxLength(255)
                    .HasColumnName("broff_name");

                entity.Property(e => e.BroffPhone)
                    .HasMaxLength(255)
                    .HasColumnName("broff_phone");

                entity.Property(e => e.BroffState)
                    .HasMaxLength(255)
                    .HasColumnName("broff_state");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.BranchOffices)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BranchOffice_Company");
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.HasKey(e => e.IdCompa)
                    .HasName("PK__Company__7F369D6D583C5396");

                entity.ToTable("Company");

                entity.Property(e => e.IdCompa).HasColumnName("id_compa");

                entity.Property(e => e.CompaActive)
                    .IsRequired()
                    .HasColumnName("compa_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.CompaAddress)
                    .HasMaxLength(255)
                    .HasColumnName("compa_address");

                entity.Property(e => e.CompaCity)
                    .HasMaxLength(255)
                    .HasColumnName("compa_city");

                entity.Property(e => e.CompaCountry)
                    .HasMaxLength(255)
                    .HasColumnName("compa_country");

                entity.Property(e => e.CompaDocnum)
                    .HasMaxLength(255)
                    .HasColumnName("compa_docnum");

                entity.Property(e => e.CompaDoctype)
                    .HasMaxLength(2)
                    .HasColumnName("compa_doctype");

                entity.Property(e => e.CompaEmail)
                    .HasMaxLength(255)
                    .HasColumnName("compa_email");

                entity.Property(e => e.CompaIndustry)
                    .HasMaxLength(255)
                    .HasColumnName("compa_industry");

                entity.Property(e => e.CompaLogo).HasColumnName("compa_logo");

                entity.Property(e => e.CompaName)
                    .HasMaxLength(255)
                    .HasColumnName("compa_name");

                entity.Property(e => e.CompaPhone)
                    .HasMaxLength(255)
                    .HasColumnName("compa_phone");

                entity.Property(e => e.CompaState)
                    .HasMaxLength(255)
                    .HasColumnName("compa_state");

                entity.Property(e => e.CompaTradename)
                    .HasMaxLength(255)
                    .HasColumnName("compa_tradename");

                entity.Property(e => e.CompaWebsite)
                    .HasMaxLength(255)
                    .HasColumnName("compa_website");
            });

            modelBuilder.Entity<CostCenter>(entity =>
            {
                entity.HasKey(e => e.IdCosce)
                    .HasName("PK__CostCent__7EA54DFCA140458B");

                entity.ToTable("CostCenter");

                entity.HasIndex(e => new { e.CompanyId, e.CosceCode }, "UQ_Company_CostCenterCode")
                    .IsUnique();

                entity.Property(e => e.IdCosce).HasColumnName("id_cosce");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.CosceActive)
                    .IsRequired()
                    .HasColumnName("cosce_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.CosceBudget)
                    .HasColumnType("decimal(15, 2)")
                    .HasColumnName("cosce_budget");

                entity.Property(e => e.CosceCode)
                    .HasMaxLength(255)
                    .HasColumnName("cosce_code");

                entity.Property(e => e.CosceDescription).HasColumnName("cosce_description");

                entity.Property(e => e.CosceLevel)
                    .HasColumnName("cosce_level")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.CosceName)
                    .HasMaxLength(255)
                    .HasColumnName("cosce_name");

                entity.Property(e => e.CosceParentId).HasColumnName("cosce_parent_id");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CostCenters)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CostCenter_Company");

                entity.HasOne(d => d.CosceParent)
                    .WithMany(p => p.InverseCosceParent)
                    .HasForeignKey(d => d.CosceParentId)
                    .HasConstraintName("FK_CostCenter_Parent");
            });

            modelBuilder.Entity<EntityCatalog>(entity =>
            {
                entity.HasKey(e => e.IdEntit)
                    .HasName("PK__EntityCa__8FC4D523E85AB78B");

                entity.ToTable("EntityCatalog");

                entity.HasIndex(e => e.EntitName, "UQ__EntityCa__BBABA3FC70E53CA7")
                    .IsUnique();

                entity.Property(e => e.IdEntit).HasColumnName("id_entit");

                entity.Property(e => e.EntitActive)
                    .IsRequired()
                    .HasColumnName("entit_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.EntitConfig).HasColumnName("entit_config");

                entity.Property(e => e.EntitDescrip)
                    .HasMaxLength(255)
                    .HasColumnName("entit_descrip");

                entity.Property(e => e.EntitName)
                    .HasMaxLength(255)
                    .HasColumnName("entit_name");
            });

            modelBuilder.Entity<PermiRole>(entity =>
            {
                entity.HasKey(e => e.IdPerol)
                    .HasName("PK__PermiRol__93FA98DE13CC12E4");

                entity.ToTable("PermiRole");

                entity.HasIndex(e => new { e.RoleId, e.PermissionId, e.EntitycatalogId, e.PerolRecord }, "UQ_Role_Permission_Entity")
                    .IsUnique();

                entity.Property(e => e.IdPerol).HasColumnName("id_perol");

                entity.Property(e => e.EntitycatalogId).HasColumnName("entitycatalog_id");

                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.PerolInclude)
                    .IsRequired()
                    .HasColumnName("perol_include")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.PerolRecord).HasColumnName("perol_record");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Entitycatalog)
                    .WithMany(p => p.PermiRoles)
                    .HasForeignKey(d => d.EntitycatalogId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiRole_EntityCatalog");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.PermiRoles)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiRole_Permission");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.PermiRoles)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiRole_Role");
            });

            modelBuilder.Entity<PermiRoleRecord>(entity =>
            {
                entity.HasKey(e => e.IdPerrc)
                    .HasName("PK__PermiRol__93FAA0B32B62842C");

                entity.ToTable("PermiRoleRecord");

                entity.HasIndex(e => new { e.RoleId, e.PermissionId, e.EntitycatalogId, e.PerrcRecord }, "UQ_Role_Permission_Entity_Record")
                    .IsUnique();

                entity.Property(e => e.IdPerrc).HasColumnName("id_perrc");

                entity.Property(e => e.EntitycatalogId).HasColumnName("entitycatalog_id");

                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.PerrcInclude)
                    .IsRequired()
                    .HasColumnName("perrc_include")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.PerrcRecord).HasColumnName("perrc_record");

                entity.Property(e => e.RoleId).HasColumnName("role_id");

                entity.HasOne(d => d.Entitycatalog)
                    .WithMany(p => p.PermiRoleRecords)
                    .HasForeignKey(d => d.EntitycatalogId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiRoleRecord_EntityCatalog");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.PermiRoleRecords)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiRoleRecord_Permission");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.PermiRoleRecords)
                    .HasForeignKey(d => d.RoleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiRoleRecord_Role");
            });

            modelBuilder.Entity<PermiUser>(entity =>
            {
                entity.HasKey(e => e.IdPeusr)
                    .HasName("PK__PermiUse__9E884AAE2583BAB0");

                entity.ToTable("PermiUser");

                entity.HasIndex(e => new { e.UsercompanyId, e.PermissionId, e.EntitycatalogId }, "UQ_UserCompany_Permission_Entity")
                    .IsUnique();

                entity.Property(e => e.IdPeusr).HasColumnName("id_peusr");

                entity.Property(e => e.EntitycatalogId).HasColumnName("entitycatalog_id");

                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.PeusrInclude)
                    .IsRequired()
                    .HasColumnName("peusr_include")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.UsercompanyId).HasColumnName("usercompany_id");

                entity.HasOne(d => d.Entitycatalog)
                    .WithMany(p => p.PermiUsers)
                    .HasForeignKey(d => d.EntitycatalogId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiUser_EntityCatalog");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.PermiUsers)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiUser_Permission");

                entity.HasOne(d => d.Usercompany)
                    .WithMany(p => p.PermiUsers)
                    .HasForeignKey(d => d.UsercompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiUser_UserCompany");
            });

            modelBuilder.Entity<PermiUserRecord>(entity =>
            {
                entity.HasKey(e => e.IdPeusr)
                    .HasName("PK__PermiUse__9E884AAE3A54F2B7");

                entity.ToTable("PermiUserRecord");

                entity.HasIndex(e => new { e.UsercompanyId, e.PermissionId, e.EntitycatalogId, e.PeusrRecord }, "UQ_UserCompany_Permission_Entity_Record")
                    .IsUnique();

                entity.Property(e => e.IdPeusr).HasColumnName("id_peusr");

                entity.Property(e => e.EntitycatalogId).HasColumnName("entitycatalog_id");

                entity.Property(e => e.PermissionId).HasColumnName("permission_id");

                entity.Property(e => e.PeusrInclude)
                    .IsRequired()
                    .HasColumnName("peusr_include")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.PeusrRecord).HasColumnName("peusr_record");

                entity.Property(e => e.UsercompanyId).HasColumnName("usercompany_id");

                entity.HasOne(d => d.Entitycatalog)
                    .WithMany(p => p.PermiUserRecords)
                    .HasForeignKey(d => d.EntitycatalogId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiUserRecord_EntityCatalog");

                entity.HasOne(d => d.Permission)
                    .WithMany(p => p.PermiUserRecords)
                    .HasForeignKey(d => d.PermissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiUserRecord_Permission");

                entity.HasOne(d => d.Usercompany)
                    .WithMany(p => p.PermiUserRecords)
                    .HasForeignKey(d => d.UsercompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PermiUserRecord_UserCompany");
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.HasKey(e => e.IdPermi)
                    .HasName("PK__Permissi__93FD6F90AF237F09");

                entity.ToTable("Permission");

                entity.Property(e => e.IdPermi).HasColumnName("id_permi");

                entity.Property(e => e.CanCreate).HasColumnName("can_create");

                entity.Property(e => e.CanDelete).HasColumnName("can_delete");

                entity.Property(e => e.CanExport).HasColumnName("can_export");

                entity.Property(e => e.CanImport).HasColumnName("can_import");

                entity.Property(e => e.CanRead).HasColumnName("can_read");

                entity.Property(e => e.CanUpdate).HasColumnName("can_update");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .HasColumnName("name");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.IdRole)
                    .HasName("PK__Role__3D48441D49CE58E7");

                entity.ToTable("Role");

                entity.HasIndex(e => new { e.CompanyId, e.RoleCode }, "UQ_Company_RoleCode")
                    .IsUnique();

                entity.Property(e => e.IdRole).HasColumnName("id_role");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.RoleActive)
                    .IsRequired()
                    .HasColumnName("role_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.RoleCode)
                    .HasMaxLength(255)
                    .HasColumnName("role_code");

                entity.Property(e => e.RoleDescription).HasColumnName("role_description");

                entity.Property(e => e.RoleName)
                    .HasMaxLength(255)
                    .HasColumnName("role_name");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Roles)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Role_Company");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.IdUser)
                    .HasName("PK__User__D2D146378A86698F");

                entity.ToTable("User");

                entity.HasIndex(e => e.UserEmail, "UQ_User_Email")
                    .IsUnique();

                entity.HasIndex(e => e.UserUsername, "UQ_User_Username")
                    .IsUnique();

                entity.Property(e => e.IdUser).HasColumnName("id_user");

                entity.Property(e => e.UserEmail)
                    .HasMaxLength(255)
                    .HasColumnName("user_email");

                entity.Property(e => e.UserIsActive)
                    .IsRequired()
                    .HasColumnName("user_is_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.UserIsAdmin).HasColumnName("user_is_admin");

                entity.Property(e => e.UserPassword)
                    .HasMaxLength(255)
                    .HasColumnName("user_password");

                entity.Property(e => e.UserPhone)
                    .HasMaxLength(255)
                    .HasColumnName("user_phone");

                entity.Property(e => e.UserUsername)
                    .HasMaxLength(255)
                    .HasColumnName("user_username");
            });

            modelBuilder.Entity<UserCompany>(entity =>
            {
                entity.HasKey(e => e.IdUseco)
                    .HasName("PK__UserComp__CBDF08FE67BEE0A5");

                entity.ToTable("UserCompany");

                entity.HasIndex(e => new { e.UserId, e.CompanyId }, "UQ_User_Company")
                    .IsUnique();

                entity.Property(e => e.IdUseco).HasColumnName("id_useco");

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.UsecoActive)
                    .IsRequired()
                    .HasColumnName("useco_active")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.UserCompanies)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserCompany_Company");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserCompanies)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserCompany_User");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
