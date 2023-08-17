using AutoMapper;
using InventoryManagement.Models;
using InventoryManagement.Utils;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventoryManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SuppliersController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;
        public SuppliersController(InventoryManagementContext context,
       IHttpContextAccessor httpContext,
       IConfiguration configuration,
       IMapper mapper, IAuthService authService) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<SupplierDTO>>> GetSuppliers()
        {
            if (_context.Suppliers == null)
            {
                return NotFound();
            }
            return _mapper.Map<List<SupplierDTO>>(await _context.Suppliers.ToListAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<SupplierDTO>> GetSupplier(int id)
        {
            if (_context.Suppliers == null)
            {
                return NotFound();
            }
            var supplier = await _context.Suppliers.FindAsync(id);

            if (supplier == null)
            {
                return NotFound();
            }
            return _mapper.Map<SupplierDTO>(supplier);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutSupplier(int id, SupplierDTO supplier)
        {
            if (id != supplier.SupplierId)
            {
                return BadRequest();
            }
            supplier.ModifiedDate = DateTime.Now;
            supplier.ModifiedBy = _authService.GetUserId();
            _context.Entry(_mapper.Map<Supplier>(supplier)).State = EntityState.Modified;
            try
            {
                return Ok(await _context.SaveChangesAsync());
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SupplierExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
        }

        [HttpPost]
        public async Task<ActionResult<Supplier>> PostSupplier(SupplierDTO supplier)
        {
            if (_context.Suppliers == null)
            {
                return Problem("Entity set 'InventoryManagementContext.Suppliers'  is null.");
            }
            supplier.CreatedDate = DateTime.Now;
            supplier.CreatedBy = _authService.GetUserId();
            _context.Suppliers.Add(_mapper.Map<Supplier>(supplier));
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetSupplier", new { id = supplier.SupplierId }, supplier);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSupplier(int id)
        {
            if (_context.Suppliers == null)
            {
                return NotFound();
            }
            var supplier = await _context.Suppliers.FindAsync(id);
            if (supplier == null)
            {
                return NotFound();
            }
            _context.Suppliers.Remove(supplier);
            return Ok(await _context.SaveChangesAsync());
        }

        private bool SupplierExists(int id)
        {
            return (_context.Suppliers?.Any(e => e.SupplierId == id)).GetValueOrDefault();
        }
    }
}
