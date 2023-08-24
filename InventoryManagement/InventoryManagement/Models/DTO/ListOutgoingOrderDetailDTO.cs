namespace InventoryManagement.Models.DTO
{
    public class ListOutgoingOrderDetailDTO
    {
        public int DetailId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? SalePrice { get; set; }
        public string? ProductName { get; set; }
    }
}
