namespace InventoryManagement.Models.DTO
{
    public class AddIncomingReceiptDTO
    {
        public int SupplierId { get; set; }
        public int WarehouseId { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public int? ModifiedBy { get; set; }
        public List<AddIncomingReceiptDetailDTO> Details { get; set; }
    }

}
