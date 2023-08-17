using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace InventoryManagement.Models
{
    public partial class InventoryManagementContext : DbContext
    {
        public InventoryManagementContext()
        {
        }

        public InventoryManagementContext(DbContextOptions<InventoryManagementContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<IncomingReceipt> IncomingReceipts { get; set; } = null!;
        public virtual DbSet<IncomingReceiptDetail> IncomingReceiptDetails { get; set; } = null!;
        public virtual DbSet<OutgoingOrder> OutgoingOrders { get; set; } = null!;
        public virtual DbSet<OutgoingOrderDetail> OutgoingOrderDetails { get; set; } = null!;
        public virtual DbSet<Product> Products { get; set; } = null!;
        public virtual DbSet<Supplier> Suppliers { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<Warehouse> Warehouses { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=localhost;Database=InventoryManagement;user=sa;password=12345678");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CategoryName).HasMaxLength(255);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.Property(e => e.CustomerId).HasColumnName("CustomerID");

                entity.Property(e => e.ContactEmail).HasMaxLength(255);

                entity.Property(e => e.ContactPerson).HasMaxLength(255);

                entity.Property(e => e.ContactPhone).HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerName).HasMaxLength(255);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<IncomingReceipt>(entity =>
            {
                entity.HasKey(e => e.ReceiptId)
                    .HasName("PK__Incoming__CC08C400793F8F3F");

                entity.Property(e => e.ReceiptId).HasColumnName("ReceiptID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ReceiptDate).HasColumnType("date");

                entity.Property(e => e.SupplierId).HasColumnName("SupplierID");

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.WarehouseId).HasColumnName("WarehouseID");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.IncomingReceipts)
                    .HasForeignKey(d => d.SupplierId)
                    .HasConstraintName("FK__IncomingR__Suppl__4316F928");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.IncomingReceipts)
                    .HasForeignKey(d => d.WarehouseId)
                    .HasConstraintName("FK__IncomingR__Wareh__440B1D61");
            });

            modelBuilder.Entity<IncomingReceiptDetail>(entity =>
            {
                entity.HasKey(e => e.DetailId)
                    .HasName("PK__Incoming__135C314D8209DB5E");

                entity.Property(e => e.DetailId).HasColumnName("DetailID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.PurchasePrice).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.ReceiptId).HasColumnName("ReceiptID");

                entity.Property(e => e.WarehouseId).HasColumnName("WarehouseID");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.IncomingReceiptDetails)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK__IncomingR__Produ__47DBAE45");

                entity.HasOne(d => d.Receipt)
                    .WithMany(p => p.IncomingReceiptDetails)
                    .HasForeignKey(d => d.ReceiptId)
                    .HasConstraintName("FK__IncomingR__Recei__46E78A0C");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.IncomingReceiptDetails)
                    .HasForeignKey(d => d.WarehouseId)
                    .HasConstraintName("FK__IncomingR__Wareh__48CFD27E");
            });

            modelBuilder.Entity<OutgoingOrder>(entity =>
            {
                entity.HasKey(e => e.OrderId)
                    .HasName("PK__Outgoing__C3905BAF7BC29181");

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("CustomerID");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OrderDate).HasColumnType("date");

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.WarehouseId).HasColumnName("WarehouseID");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.OutgoingOrders)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__OutgoingO__Custo__4BAC3F29");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.OutgoingOrders)
                    .HasForeignKey(d => d.WarehouseId)
                    .HasConstraintName("FK__OutgoingO__Wareh__4CA06362");
            });

            modelBuilder.Entity<OutgoingOrderDetail>(entity =>
            {
                entity.HasKey(e => e.DetailId)
                    .HasName("PK__Outgoing__135C314D2262D771");

                entity.Property(e => e.DetailId).HasColumnName("DetailID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OrderId).HasColumnName("OrderID");

                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.SalePrice).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.WarehouseId).HasColumnName("WarehouseID");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OutgoingOrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK__OutgoingO__Order__4F7CD00D");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OutgoingOrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK__OutgoingO__Produ__5070F446");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.OutgoingOrderDetails)
                    .HasForeignKey(d => d.WarehouseId)
                    .HasConstraintName("FK__OutgoingO__Wareh__5165187F");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.ProductId).HasColumnName("ProductID");

                entity.Property(e => e.CategoryId).HasColumnName("CategoryID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ProductName).HasMaxLength(255);

                entity.Property(e => e.PurchasePrice).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.SalePrice).HasColumnType("decimal(10, 2)");

                entity.Property(e => e.WarehouseId).HasColumnName("WarehouseID");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK__Products__Catego__3F466844");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.WarehouseId)
                    .HasConstraintName("FK__Products__Wareho__403A8C7D");
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.Property(e => e.SupplierId).HasColumnName("SupplierID");

                entity.Property(e => e.ContactEmail).HasMaxLength(255);

                entity.Property(e => e.ContactPerson).HasMaxLength(255);

                entity.Property(e => e.ContactPhone).HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SupplierName).HasMaxLength(255);
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Password).HasMaxLength(100);

                entity.Property(e => e.Role).HasMaxLength(50);

                entity.Property(e => e.Username).HasMaxLength(50);
            });

            modelBuilder.Entity<Warehouse>(entity =>
            {
                entity.Property(e => e.WarehouseId).HasColumnName("WarehouseID");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Location).HasMaxLength(255);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.WarehouseName).HasMaxLength(255);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
