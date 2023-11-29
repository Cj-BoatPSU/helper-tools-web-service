using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using cj_web_service.Models.DBModels;

namespace cj_web_service.Context
{
    public partial class CoreContext : DbContext
    {
        public CoreContext()
        {
        }

        public CoreContext(DbContextOptions<CoreContext> options)
            : base(options)
        {
        }

        public virtual DbSet<FinancialDetail> FinancialDetails { get; set; } = null!;
        public virtual DbSet<FinancialInfo> FinancialInfos { get; set; } = null!;
        public virtual DbSet<FinancialType> FinancialTypes { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=(localdb)\\Local;Initial Catalog=Helper_Tools_DB;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<FinancialDetail>(entity =>
            {
                entity.HasKey(e => e.FinancialDetailId);
                entity.ToTable("FinancialDetail");

                entity.Property(e => e.FinancialDetailId).HasColumnName("FinancialDetailID");

                entity.Property(e => e.FinancialInfoId).HasColumnName("FinancialInfoID");

                entity.Property(e => e.Topic).HasMaxLength(100);

                entity.Property(e => e.TypeId).HasColumnName("TypeID");
            });

            modelBuilder.Entity<FinancialInfo>(entity =>
            {
                entity.HasKey(e => e.FinancialInfoId);
                entity.ToTable("FinancialInfo");

                entity.Property(e => e.FinancialInfoId).HasColumnName("FinancialInfoID");

                entity.Property(e => e.InfoTopic).HasMaxLength(100);
            });

            modelBuilder.Entity<FinancialType>(entity =>
            {
                entity.HasKey(e => e.TypeId);

                entity.ToTable("FinancialType");

                entity.Property(e => e.TypeId).HasColumnName("TypeID");

                entity.Property(e => e.FinancialInfoId).HasColumnName("FinancialInfoID");

                entity.Property(e => e.Type).HasMaxLength(100);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
