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
    public class CustomersController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;

        public CustomersController(InventoryManagementContext context,
        IHttpContextAccessor httpContext,
        IConfiguration configuration,
        IMapper mapper, IAuthService authService) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
        }

        [HttpPost("[action]")]
        public IActionResult GetCustomers([FromForm] DataRequest request)
        {
            if (_context.Customers == null)
            {
                return NotFound();
            }
            return Ok(_context.Customers.ToDataResult(request));
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<CustomerDTO>> GetCustomer(int id)
        {
            if (_context.Customers == null)
            {
                return NotFound();
            }
            var customer = await _context.Customers.FindAsync(id);

            if (customer == null)
            {
                return NotFound();
            }

            return _mapper.Map<CustomerDTO>(customer);
        }

        [HttpPut("{id}")]
        [CustomAuthorize("admin")]
        public async Task<IActionResult> PutCustomer(int id, CustomerDTO customer)
        {
            if (id != customer.CustomerId)
            {
                return BadRequest();
            }
            customer.ModifiedDate = DateTime.Now;
            customer.ModifiedBy = _authService.GetUserId();
            _context.Entry(_mapper.Map<Customer>(customer)).State = EntityState.Modified;
            try
            {
                return Ok(await _context.SaveChangesAsync());
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CustomerExists(id))
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
        [CustomAuthorize("admin")]
        public async Task<ActionResult<CustomerDTO>> PostCustomer(CustomerDTO customer)
        {
            if (_context.Customers == null)
            {
                return Problem("Entity set 'InventoryManagementContext.Customers'  is null.");
            }
            customer.CreatedDate = DateTime.Now;
            customer.CreatedBy = _authService.GetUserId();
            _context.Customers.Add(_mapper.Map<Customer>(customer));
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetCustomer", new { id = customer.CustomerId }, customer);
        }

        [HttpDelete("{id}")]
        [CustomAuthorize("admin")]
        public async Task<IActionResult> DeleteCustomer(int id)
        {
            if (_context.Customers == null)
            {
                return NotFound();
            }
            var customer = await _context.Customers.FindAsync(id);
            if (customer == null)
            {
                return NotFound();
            }
            _context.Customers.Remove(customer);
            return Ok(await _context.SaveChangesAsync());
        }

        private bool CustomerExists(int id)
        {
            return (_context.Customers?.Any(e => e.CustomerId == id)).GetValueOrDefault();
        }
    }
}
