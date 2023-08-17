namespace InventoryManagement.Models
{
    public class WarehouseDTO
    {
        public int WarehouseId { get; set; }
        public string? WarehouseName { get; set; }
        public string? Location { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
    }
}
