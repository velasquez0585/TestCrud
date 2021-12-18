using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TestCrud.EntityModel.Models
{
    public partial class BDTestCrudContext : DbContext
    {
        public BDTestCrudContext()
            : base()
        {
        }

        public BDTestCrudContext(DbContextOptions<BDTestCrudContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Usuarios> Usuarios { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Usuarios>(entity =>
            {
                entity.HasKey(e => e.Cod_Usario);

                entity.ToTable("tUsers");

                entity.Property(e => e.Cod_Usario).HasColumnName("cod_usuario");

                entity.Property(e => e.Txt_User)
                    .IsRequired()
                    .HasColumnName("txt_user")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Txt_Password)
                    .IsRequired()
                    .HasColumnName("txt_password")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Txt_Nombre)
                    .HasColumnName("txt_nombre")
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Txt_Apellido)
                    .HasColumnName("txt_apellido")
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.Nro_Doc)
                    .IsRequired()
                    .HasColumnName("nro_doc")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Cod_Rol)
                    .HasColumnName("cod_rol");

                entity.Property(e => e.Sn_Activo)
                    .HasColumnName("sn_activo");


                entity.HasOne(d => d.CodRolNavigation)
                 .WithOne(p => p.UsuariosNavigation)
                 .HasForeignKey<Usuarios>(d => d.Cod_Rol)
                 .OnDelete(DeleteBehavior.ClientSetNull)
                 .HasConstraintName("fk_user_rol");
                
            });

            modelBuilder.Entity<Roles>(entity =>
            {
                entity.HasKey(e => e.Cod_Rol);

                entity.ToTable("trol");

                entity.Property(e => e.Cod_Rol).HasColumnName("Cod_Rol");

                entity.Property(e => e.Txt_Desc)
                    .IsRequired()
                    .HasColumnName("txt_desc")
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Sn_Activo)
                    .HasColumnName("sn_activo");

            });

        }
    }
}