namespace InventoryManagement.Models.DTO
{

    public class IncomingReceiptDetailDTO
    {
        public int DetailId { get; set; }
        public int? ProductId { get; set; }
        public int? Quantity { get; set; }
        public decimal? PurchasePrice { get; set; }
        public string? ProductName { get; set; }
    }
}
