using AutoMapper;
using InventoryManagement.JWT;
using InventoryManagement.Models;
using InventoryManagement.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace InventoryManagement.Controllers
{
    public class AuthController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;
        private readonly IJwtHelper _jwt;

        public AuthController(IHttpContextAccessor httpContext, IConfiguration configuration, IMapper mapper, IAuthService authService, InventoryManagementContext context, IJwtHelper jwt) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
            _jwt = jwt;
        }

        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginRequest loginRequest)
        {
            ServiceResponse res = new ServiceResponse();
            if (!ModelState.IsValid)
            {
                res.OnError("Username or password is incorrect");
                return Ok(res);
            }
            var user = _context.Users.FirstOrDefault(x => x.Username == loginRequest.Username);
            if (user == null)
            {
                res.OnError("Username or password is incorrect");
                return Ok(res);
            }
            if (!BCrypt.Net.BCrypt.Verify(loginRequest.Password, user.Password))
            {
                res.OnError("Username or password is incorrect");
                return Ok(res);
            }
            var userInfo = _mapper.Map<UserInfo>(user);
            userInfo.Token = _jwt.GenerateToken(userInfo);
            res.OnSuccess(userInfo);
            return Ok(res);
        }

        [AllowAnonymous]
        [HttpPost("createpasswordhash")]
        public IActionResult CreatePasswordHash(string password)
        {
            ServiceResponse res = new ServiceResponse();
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            string passwordHash = BCrypt.Net.BCrypt.HashPassword(password);
            res.OnSuccess(passwordHash);
            return Ok(res);
        }

        [Authorize]
        [HttpPost("[action]")]
        public IActionResult ValidateToken(string token)
        {
            ServiceResponse res = new ServiceResponse();
            res.OnSuccess(_jwt.ValidateToken(token));
            return Ok(res);
        }
    }
}
