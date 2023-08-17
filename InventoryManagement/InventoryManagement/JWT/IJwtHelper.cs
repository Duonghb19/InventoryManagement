using InventoryManagement.Models;

namespace InventoryManagement.JWT
{
    public interface IJwtHelper
    {
        public string GenerateToken(UserInfo account);
        public UserInfo? ValidateToken(string token);
    }
}
