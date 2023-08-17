
using System.Text.Json.Serialization;

namespace InventoryManagement.Models
{
    public class SupplierDTO
    {
        public int SupplierId { get; set; }
        public string? SupplierName { get; set; }
        public string? ContactPerson { get; set; }
        public string? ContactEmail { get; set; }
        public string? ContactPhone { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
