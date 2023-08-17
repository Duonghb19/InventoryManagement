namespace InventoryManagement.Models
{
    public class UserInfo
    {
        public int UserId { get; set; }
        public string? Username { get; set; }
        public string? Role { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string? Token { get; set; }
    }
}
