namespace InventoryManagement.Models.DTO
{
    public class CreateOutgoingOrderDTO
    {
        public int CustomerId { get; set; }
        public int WarehouseId { get; set; }
        public int CreatedBy { get; set; }
        public int ModifiedBy { get; set; }
        public List<OutgoingOrderDetailDTO> Details { get; set; }
    }
}
