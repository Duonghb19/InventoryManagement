using InventoryManagement.Models;

namespace InventoryManagement.Utils
{
    public class AuthService : IAuthService
    {
        private readonly IHttpContextAccessor _httpContext;
        private UserInfo _userInfo = null;
        public AuthService(IHttpContextAccessor httpContext)
        {
            _httpContext = httpContext;
        }

        public int GetUserId()
        {
            var userInfo = GetUserInfo();
            if (userInfo != null)
            {
                return userInfo.UserId;
            }
            return 0;
        }

        public UserInfo GetUserInfo()
        {
            UserInfo? userInfo = null;
            if (_userInfo != null)
            {
                userInfo = _userInfo;
            }
            else
            {
                if (_httpContext != null && _httpContext.HttpContext != null)
                {
                    var context = _httpContext.HttpContext.Items["User"];
                    if (context != null && context is UserInfo)
                    {
                        userInfo = context as UserInfo;
                    }
                }
            }
            return userInfo;
        }

        public string GetUsername()
        {
            var userInfo = GetUserInfo();
            if (userInfo != null)
            {
                return userInfo.Username;
            }
            return string.Empty;
        }

        public bool IsAdmin()
        {
            var userInfo = GetUserInfo();
            if (userInfo != null)
            {
                return userInfo.Role == "ADMIN";
            }
            return false;
        }

        public bool IsAuthenticated()
        {
            var authenticated = _httpContext?.HttpContext?.Request?.Headers?.ContainsKey("Authorization");
            return authenticated.GetValueOrDefault();
        }
    }
}
