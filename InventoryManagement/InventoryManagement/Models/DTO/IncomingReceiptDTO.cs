namespace InventoryManagement.Models.DTO
{
    public class IncomingReceiptDTO
    {
        public int ReceiptId { get; set; }
        public DateTime? ReceiptDate { get; set; }
        public decimal? TotalAmount { get; set; }
        public int? SupplierId { get; set; }
        public int? WarehouseId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public string? SupplierName { get; set; }
        public string? WarehouseName { get; set; }
        public List<IncomingReceiptDetailDTO> Details { get; set; }
    }

}
