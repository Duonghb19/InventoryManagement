namespace InventoryManagement.Models.DTO
{
    public class LIstOutgoingOrderDTO
    {
        public int OrderId { get; set; }
        public DateTime? OrderDate { get; set; }
        public decimal? TotalAmount { get; set; }
        public int? CustomerId { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public string? CustomerName { get; set; }
        public string? WarehouseName { get; set; }
        public List<ListOutgoingOrderDetailDTO> Details { get; set; }
    }
}
