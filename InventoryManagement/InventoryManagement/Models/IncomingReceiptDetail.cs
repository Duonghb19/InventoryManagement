using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class IncomingReceiptDetail
    {
        public int DetailId { get; set; }
        public int? ReceiptId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? PurchasePrice { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual Product? Product { get; set; }
        public virtual IncomingReceipt? Receipt { get; set; }
        public virtual Warehouse? Warehouse { get; set; }
    }
}
