using AutoMapper;
using InventoryManagement.Utils;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseControllerCustom : ControllerBase
    {
        public readonly IHttpContextAccessor _httpContext;
        public readonly IConfiguration _configuration;
        public readonly IMapper _mapper;
        public readonly IAuthService _authService;

        public BaseControllerCustom(IHttpContextAccessor httpContext,
            IConfiguration configuration,
            IMapper mapper,
            IAuthService authService)
        {
            _httpContext = httpContext;
            _configuration = configuration;
            _mapper = mapper;
            _authService = authService;
        }
    }
}
