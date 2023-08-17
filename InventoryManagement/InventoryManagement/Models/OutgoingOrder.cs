using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class OutgoingOrder
    {
        public OutgoingOrder()
        {
            OutgoingOrderDetails = new HashSet<OutgoingOrderDetail>();
        }

        public int OrderId { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal? TotalAmount { get; set; }
        public int? CustomerId { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual Customer? Customer { get; set; }
        public virtual Warehouse? Warehouse { get; set; }
        public virtual ICollection<OutgoingOrderDetail> OutgoingOrderDetails { get; set; }
    }
}
