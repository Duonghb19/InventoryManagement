using InventoryManagement.JWT;
using Newtonsoft.Json;
using System.Text;

namespace InventoryManagement.Middleware
{
    public class AuthHandlerMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IJwtHelper _jwtUtils;
        public AuthHandlerMiddleware(RequestDelegate next, IJwtHelper jwtUtils)
        {
            _next = next;
            _jwtUtils = jwtUtils;
        }
        public async Task Invoke(HttpContext context)
        {
            bool endRequest = false;
            try
            {
                endRequest = await SetHeaders(context);
            }
            catch (Exception ex)
            {
                endRequest = true;
                byte[] data = UTF8Encoding.UTF8.GetBytes($"Internal Server Error. {ex.Message}");
                context.Response.StatusCode = 500;
                context.Response.ContentLength = data.Length;
                context.Response.ContentType = "text/plain";
                await context.Response.Body.WriteAsync(data, 0, data.Length);
            }
            if (!endRequest)
            {
                try
                {
                    await _next(context);
                }
                catch (UnauthorizedAccessException ex)
                {
                    if (ex != null)
                    {
                        await context.Response.WriteAsync(JsonConvert.SerializeObject(ex.Data), Encoding.UTF8);
                    }
                }
            }
        }

        /// <summary>
        /// Xử lý lấy token parse to object để check trong httpContext 
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private async Task<bool> SetHeaders(HttpContext context)
        {
            var httpContext = context;
            var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            if (!string.IsNullOrEmpty(token))
            {
                var acc = _jwtUtils.ValidateToken(token);
                if (acc != null)
                {
                    httpContext.Items["User"] = acc;
                }
            }
            return false;
        }
    }
}
