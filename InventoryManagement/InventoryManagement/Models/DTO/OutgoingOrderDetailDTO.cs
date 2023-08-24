namespace InventoryManagement.Models.DTO
{
    public class OutgoingOrderDetailDTO
    {
        public int ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? SalePrice { get; set; }
    }
}
