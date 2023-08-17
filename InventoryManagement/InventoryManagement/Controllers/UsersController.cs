using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InventoryManagement.Models;
using AutoMapper;
using InventoryManagement.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.OData.Query;

namespace InventoryManagement.Controllers
{
    [Authorize]
    public class UsersController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;

        public UsersController(IHttpContextAccessor httpContext,
            IConfiguration configuration,
            IMapper mapper,
            IAuthService authService, InventoryManagementContext context) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
        }

        [HttpGet("[action]")]
        [CustomAuthorize("admin")]
        [EnableQuery(PageSize = 20)]
        public async Task<ActionResult<IQueryable<User>>> GetAllUser()
        {
            if (_context.Users == null)
            {
                return NotFound();
            }
            return Ok(await _context.Users.ToListAsync());
        }

        [HttpGet("[action]")]
        public async Task<ActionResult<User>> GetUserById()
        {
            if (_context.Users == null)
            {
                return NotFound();
            }
            return Ok(await _context.Users.FirstOrDefaultAsync(x => x.UserId == _authService.GetUserId()));
        }

        [HttpPost]
        [CustomAuthorize("admin")]
        public async Task<ActionResult<User>> CreateUser(User user)
        {
            user.Password = BCrypt.Net.BCrypt.HashPassword(user.Password);
            user.CreatedDate = DateTime.Now;
            user.ModifiedDate = DateTime.Now;
            _context.Users.Add(user);
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetUser", new { id = user.UserId }, user);
        }

        [HttpPut("[action]")]
        public async Task<IActionResult> UpdateUser(User user)
        {
            if (_authService.GetUserId() != user.UserId)
            {
                return BadRequest();
            }
            var userInDb = await _context.Users.FirstOrDefaultAsync(x => x.UserId == user.UserId);
            user.Role = userInDb?.Role;
            user.Password = userInDb?.Password;
            user.CreatedDate = userInDb?.CreatedDate;
            user.ModifiedDate = DateTime.Now;
            _context.Entry(user).State = EntityState.Modified;
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(user.UserId))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        private bool UserExists(int id)
        {
            return (_context.Users?.Any(e => e.UserId == id)).GetValueOrDefault();
        }
    }
}
