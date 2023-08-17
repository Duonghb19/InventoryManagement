using AutoMapper;
using InventoryManagement.Models;
using InventoryManagement.Utils;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventoryManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class WarehousesController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;

        public WarehousesController(InventoryManagementContext context, IHttpContextAccessor httpContext, IConfiguration configuration, IMapper mapper, IAuthService authService) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<WarehouseDTO>>> GetWarehouses()
        {
            if (_context.Warehouses == null)
            {
                return NotFound();
            }
            return _mapper.Map<List<WarehouseDTO>>(await _context.Warehouses.ToListAsync());
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<WarehouseDTO>> GetWarehouse(int id)
        {
            if (_context.Warehouses == null)
            {
                return NotFound();
            }
            var warehouse = await _context.Warehouses.FindAsync(id);
            if (warehouse == null)
            {
                return NotFound();
            }
            return _mapper.Map<WarehouseDTO>(warehouse);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutWarehouse(int id, WarehouseDTO warehouse)
        {
            if (id != warehouse.WarehouseId)
            {
                return BadRequest();
            }
            warehouse.ModifiedDate = DateTime.Now;
            warehouse.ModifiedBy = _authService.GetUserId();
            _context.Entry(_mapper.Map<Warehouse>(warehouse)).State = EntityState.Modified;
            try
            {
                return Ok(await _context.SaveChangesAsync());
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!WarehouseExists(id))
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
        public async Task<ActionResult<Warehouse>> PostWarehouse(WarehouseDTO warehouse)
        {
            if (_context.Warehouses == null)
            {
                return Problem("Entity set 'InventoryManagementContext.Warehouses'  is null.");
            }
            warehouse.ModifiedDate = DateTime.Now;
            warehouse.ModifiedBy = _authService.GetUserId();
            _context.Warehouses.Add(_mapper.Map<Warehouse>(warehouse));
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetWarehouse", new { id = warehouse.WarehouseId }, warehouse);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteWarehouse(int id)
        {
            if (_context.Warehouses == null)
            {
                return NotFound();
            }
            var warehouse = await _context.Warehouses.FindAsync(id);
            if (warehouse == null)
            {
                return NotFound();
            }

            _context.Warehouses.Remove(warehouse);
            return Ok(await _context.SaveChangesAsync());
        }

        private bool WarehouseExists(int id)
        {
            return (_context.Warehouses?.Any(e => e.WarehouseId == id)).GetValueOrDefault();
        }
    }
}
