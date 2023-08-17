using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class Warehouse
    {
        public Warehouse()
        {
            IncomingReceiptDetails = new HashSet<IncomingReceiptDetail>();
            IncomingReceipts = new HashSet<IncomingReceipt>();
            OutgoingOrderDetails = new HashSet<OutgoingOrderDetail>();
            OutgoingOrders = new HashSet<OutgoingOrder>();
            Products = new HashSet<Product>();
        }

        public int WarehouseId { get; set; }
        public string? WarehouseName { get; set; }
        public string? Location { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<IncomingReceiptDetail> IncomingReceiptDetails { get; set; }
        public virtual ICollection<IncomingReceipt> IncomingReceipts { get; set; }
        public virtual ICollection<OutgoingOrderDetail> OutgoingOrderDetails { get; set; }
        public virtual ICollection<OutgoingOrder> OutgoingOrders { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
