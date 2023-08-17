using InventoryManagement.Models;

namespace InventoryManagement.Utils
{
    /// <summary>
    /// Các hàm Ultility liên quan tới Authencation
    /// </summary>
    public interface IAuthService
    {
        bool IsAuthenticated();
        string GetUsername();
        int GetUserId();
        bool IsAdmin();
        UserInfo GetUserInfo();

    }
}
