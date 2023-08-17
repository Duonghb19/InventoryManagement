using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class OutgoingOrderDetail
    {
        public int DetailId { get; set; }
        public int? OrderId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? SalePrice { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual OutgoingOrder? Order { get; set; }
        public virtual Product? Product { get; set; }
        public virtual Warehouse? Warehouse { get; set; }
    }
}
