using Microsoft.AspNetCore.Mvc;
using System.Net.Http.Headers;

namespace PROGradingProjectClient.Controllers
{
    /// <summary>
    /// Base dùng chung cho các controller
    /// </summary>
    public class BaseNewController : Controller
    {
        protected readonly HttpClient _httpClient;
        protected readonly ILogger _logger;
        public BaseNewController(IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor, ILogger logger)
        {
            _httpClient = httpClientFactory.CreateClient();
            _logger = logger;
            _httpClient.BaseAddress = new Uri("https://localhost:7161/api/");
            var token = httpContextAccessor?.HttpContext?.Items["AccessToken"];
            if (token != null)
            {
                _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token.ToString());
            }
        }
    }
}
