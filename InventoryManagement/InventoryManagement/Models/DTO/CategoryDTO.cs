using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;

namespace InventoryManagement.Models
{
    public partial class CategoryDTO
    {
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
