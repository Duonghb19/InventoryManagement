using InventoryManagementClient.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace InventoryManagementClient.Attributes
{
    public class RoleCheckAttribute : Attribute, IAuthorizationFilter
    {
        private string[] allowedRoles;
        public RoleCheckAttribute(params string[] roles)
        {
            allowedRoles = roles;
        }
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            // Kiểm tra vai trò của người dùng hiện tại
            bool hasValidRole = false;

            context.HttpContext.Items.TryGetValue("UserInfo", out object? user);

            if (user == null)
            {
                context.Result = new RedirectResult("~/Account/Login?returnUrl=" + context.HttpContext.Request.Path + context.HttpContext.Request.QueryString);
                return;
            }

            var userInfo = (UserInfo)user;

            // Kiểm tra xem vai trò của người dùng có trong danh sách cho phép không
            foreach (var allowedRole in allowedRoles)
            {
                if(allowedRole.ToLower().Trim() == "all" || (userInfo.Role.ToLower().Trim() == allowedRole.ToLower().Trim()))
                {
                    hasValidRole = true;
                    break;
                }
            }

            // Nếu vai trò không hợp lệ, chuyển hướng đến trang lỗi
            if (!hasValidRole)
            {
                context.Result = new RedirectResult("~/Error?errorCode=403");
            }
        }

    }
}
