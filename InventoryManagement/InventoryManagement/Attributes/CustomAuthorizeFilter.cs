using InventoryManagement.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Data;
using System.Net;
using System.Security.Claims;

namespace InventoryManagement
{
    public class CustomAuthorizeAttribute : TypeFilterAttribute
    {
        public CustomAuthorizeAttribute(string role) : base(typeof(CustomAuthorizeFilter))
        {
            Arguments = new object[] { role };
        }
    }
    public class CustomAuthorizeFilter : IAsyncAuthorizationFilter
    {
        private readonly string _role;
        public CustomAuthorizeFilter(string role)
        {
            _role = role;
        }
        private static IActionResult Unauthorized()
        {
            ServiceResponse serviceResponse = new ServiceResponse();
            serviceResponse.OnError(message: "Unauthorized");
            serviceResponse.ErrorCode = (int)HttpStatusCode.Unauthorized;
            return new JsonResult(serviceResponse)
            {
                StatusCode = (int)HttpStatusCode.Unauthorized
            };
        }

        public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {

            var userId = context.HttpContext.User.Claims.FirstOrDefault(claim => claim.Type == ClaimTypes.NameIdentifier)?.Value;
            if (string.IsNullOrEmpty(userId))
            {
                context.Result = Unauthorized();
                return;
            }

            var userRole = context.HttpContext.User.Claims.FirstOrDefault(claim => claim.Type == ClaimTypes.Role)?.Value;
            if (_role.ToLower().Trim() != userRole?.ToLower().Trim())
            {
                context.Result = Unauthorized();
                return;
            }
        }
    }
}
