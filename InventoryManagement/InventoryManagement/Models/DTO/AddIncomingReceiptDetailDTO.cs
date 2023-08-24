namespace InventoryManagement.Models.DTO
{
    public class AddIncomingReceiptDetailDTO
    {
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal PurchasePrice { get; set; }
    }
}
