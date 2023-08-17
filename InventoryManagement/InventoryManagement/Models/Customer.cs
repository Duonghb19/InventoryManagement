using System;
using System.Collections.Generic;

namespace InventoryManagement.Models
{
    public partial class Customer
    {
        public Customer()
        {
            OutgoingOrders = new HashSet<OutgoingOrder>();
        }

        public int CustomerId { get; set; }
        public string? CustomerName { get; set; }
        public string? ContactPerson { get; set; }
        public string? ContactEmail { get; set; }
        public string? ContactPhone { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }

        public virtual ICollection<OutgoingOrder> OutgoingOrders { get; set; }
    }
}
