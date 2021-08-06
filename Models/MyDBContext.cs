using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ShopGiayHHL.Models
{
    public partial class MyDBContext : DbContext
    {
        public MyDBContext()
            : base("name=ChuoiKN")
        {
        }

        public virtual DbSet<Categorys> Categorys { get; set; }
        public virtual DbSet<Contacts> Contacts { get; set; }
        public virtual DbSet<Links> Links { get; set; }
        public virtual DbSet<Menus> Menus { get; set; }
        public virtual DbSet<Orderdetails> Orderdetails { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<Posts> Posts { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<ProductSales> ProductSales { get; set; }
        public virtual DbSet<Sliders> Sliders { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Topics> Topics { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Categorys>()
                .Property(e => e.Slug)
                .IsUnicode(false);

            modelBuilder.Entity<Contacts>()
                .Property(e => e.Detail)
                .IsUnicode(false);

            modelBuilder.Entity<Contacts>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Menus>()
                .Property(e => e.MenuType)
                .IsUnicode(false);

            modelBuilder.Entity<Menus>()
                .Property(e => e.Position)
                .IsUnicode(false);

            modelBuilder.Entity<Products>()
                .Property(e => e.Slug)
                .IsUnicode(false);

            modelBuilder.Entity<Products>()
                .Property(e => e.Detail)
                .IsUnicode(false);

            modelBuilder.Entity<Products>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<Sliders>()
                .Property(e => e.Link)
                .IsUnicode(false);

            modelBuilder.Entity<Sliders>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<Sliders>()
                .Property(e => e.Position)
                .IsUnicode(false);

            modelBuilder.Entity<Topics>()
                .Property(e => e.Slug)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.Img)
                .IsUnicode(false);
        }
    }
}
