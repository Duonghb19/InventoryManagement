using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class IncomingReceipt
    {
        public IncomingReceipt()
        {
            IncomingReceiptDetails = new HashSet<IncomingReceiptDetail>();
        }

        public int ReceiptId { get; set; }
        public DateTime? ReceiptDate { get; set; }
        public decimal? TotalAmount { get; set; }
        public int? SupplierId { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual Supplier? Supplier { get; set; }
        public virtual Warehouse? Warehouse { get; set; }
        public virtual ICollection<IncomingReceiptDetail> IncomingReceiptDetails { get; set; }
    }
}
