
using InventoryManagementClient.Models;
using Newtonsoft.Json;
using System.Net;
using System.Net.Http.Headers;
using System.Text;

namespace InventoryManagementClient.Middleware
{
    /// <summary>
    /// Middleware xử lý thông tin đăng nhập
    /// </summary>
    public class AuthHandlerMiddleware
    {
        private readonly RequestDelegate _next;
        protected readonly HttpClient _httpClient;
        public AuthHandlerMiddleware(RequestDelegate next, IHttpClientFactory httpClientFactory)
        {
            _next = next;
            _httpClient = httpClientFactory.CreateClient();
            _httpClient.BaseAddress = new Uri("https://localhost:7161/api/");
        }
        public async Task Invoke(HttpContext context)
        {
            // cờ check xem có đã xử lý xong request chưa
            bool endRequest = false;
            try
            {
                var token = context.Request.Cookies["InventoryManagement-AccessToken"];
                if (token != null)
                {
                    var user = context.Session.GetString("InventoryManagement-User");
                    if (user == null)
                    {
                        // nếu có token thì kiểm tra token có hợp lệ không
                        _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                        var response = await _httpClient.GetAsync("Auth/ValidateToken");
                        if (response.StatusCode == HttpStatusCode.Unauthorized)
                        {
                            context.Response.Cookies.Delete("InventoryManagement-AccessToken");
                        }
                        else if (response.IsSuccessStatusCode)
                        {
                            var result = await response.Content.ReadFromJsonAsync<ServiceResponse>();
                            if (result != null && result.Success)
                            {
                                if (result.Data != null)
                                {
                                    context.Session.SetString("InventoryManagement-User", result.Data.ToString());
                                    context.Items["UserInfo"] = JsonConvert.DeserializeObject<UserInfo>(result.Data.ToString());
                                }
                            }
                        }
                    }
                    else
                    {
                        context.Items["UserInfo"] = JsonConvert.DeserializeObject<UserInfo>(user);
                    }
                    context.Items["AccessToken"] = token;
                    context.Items["APIService"] = "https://localhost:7161/api/";
                }
            }
            catch (Exception)
            {
                endRequest = true;
                context.Response.Redirect("/Error?errorCode=500");
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
                        context.Response.Redirect("/Error?errorCode=401");
                    }
                }
            }
        }
    }
}
