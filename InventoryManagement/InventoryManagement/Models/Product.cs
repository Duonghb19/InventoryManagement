using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class Product
    {
        public Product()
        {
            IncomingReceiptDetails = new HashSet<IncomingReceiptDetail>();
            OutgoingOrderDetails = new HashSet<OutgoingOrderDetail>();
        }

        public int ProductId { get; set; }
        public string? ProductName { get; set; }
        public int? CategoryId { get; set; }
        public int QuantityInStock { get; set; }
        public decimal PurchasePrice { get; set; }
        public decimal SalePrice { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual Category? Category { get; set; }
        public virtual Warehouse? Warehouse { get; set; }
        public virtual ICollection<IncomingReceiptDetail> IncomingReceiptDetails { get; set; }
        public virtual ICollection<OutgoingOrderDetail> OutgoingOrderDetails { get; set; }
    }
}
