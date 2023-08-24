using AutoMapper;
using InventoryManagement.Models;
using InventoryManagement.Utils;
using JqueryDataTables;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventoryManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class CategoriesController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;
        public CategoriesController(InventoryManagementContext context,
        IHttpContextAccessor httpContext,
        IConfiguration configuration,
        IMapper mapper, IAuthService authService) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
        }

        [HttpPost("[action]")]
        public IActionResult GetCategories([FromForm] DataRequest request)
        {
            if (_context.Categories == null)
            {
                return NotFound();
            }
            return Ok(_context.Categories.ToDataResult(request));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<CategoryDTO>> GetCategory(int id)
        {
            if (_context.Categories == null)
            {
                return NotFound();
            }
            var category = await _context.Categories.FindAsync(id);

            if (category == null)
            {
                return NotFound();
            }
            return _mapper.Map<CategoryDTO>(category);
        }

        [HttpPost]
        [CustomAuthorize("admin")]
        public async Task<ActionResult<Category>> PostCategory(CategoryDTO category)
        {
            if (_context.Categories == null)
            {
                return Problem("Entity set 'InventoryManagementContext.Categories'  is null.");
            }
            category.CreatedDate = DateTime.Now;
            category.CreatedBy = _authService.GetUserId();
            _context.Categories.Add(_mapper.Map<Category>(category));
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetCategory", new { id = category.CategoryId }, category);
        }

        [HttpPut("{id}")]
        [CustomAuthorize("admin")]
        public async Task<IActionResult> PutCategory(int id, CategoryDTO category)
        {
            if (id != category.CategoryId)
            {
                return BadRequest();
            }

            category.ModifiedDate = DateTime.Now;
            category.ModifiedBy = _authService.GetUserId();
            _context.Entry(_mapper.Map<Category>(category)).State = EntityState.Modified;

            try
            {
                return Ok(await _context.SaveChangesAsync());
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CategoryExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
        }

        [HttpDelete("{id}")]
        [CustomAuthorize("admin")]
        public async Task<IActionResult> DeleteCategory(int id)
        {
            try
            {
                if (_context.Categories == null)
                {
                    return NotFound();
                }
                var category = await _context.Categories.FindAsync(id);
                if (category == null)
                {
                    return NotFound();
                }
                _context.Categories.Remove(category);
                return Ok(await _context.SaveChangesAsync());
            }
            catch (Exception ex)
            {
                return Problem(ex.Message);
            }
        }

        private bool CategoryExists(int id)
        {
            return (_context.Categories?.Any(e => e.CategoryId == id)).GetValueOrDefault();
        }
    }
}
