using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InventoryManagement.Models;

namespace InventoryManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OutgoingOrdersController : ControllerBase
    {
        private readonly InventoryManagementContext _context;

        public OutgoingOrdersController(InventoryManagementContext context)
        {
            _context = context;
        }

        // GET: api/OutgoingOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OutgoingOrder>>> GetOutgoingOrders()
        {
          if (_context.OutgoingOrders == null)
          {
              return NotFound();
          }
            return await _context.OutgoingOrders.ToListAsync();
        }

        // GET: api/OutgoingOrders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OutgoingOrder>> GetOutgoingOrder(int id)
        {
          if (_context.OutgoingOrders == null)
          {
              return NotFound();
          }
            var outgoingOrder = await _context.OutgoingOrders.FindAsync(id);

            if (outgoingOrder == null)
            {
                return NotFound();
            }

            return outgoingOrder;
        }

        // PUT: api/OutgoingOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOutgoingOrder(int id, OutgoingOrder outgoingOrder)
        {
            if (id != outgoingOrder.OrderId)
            {
                return BadRequest();
            }

            _context.Entry(outgoingOrder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OutgoingOrderExists(id))
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

        // POST: api/OutgoingOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<OutgoingOrder>> PostOutgoingOrder(OutgoingOrder outgoingOrder)
        {
          if (_context.OutgoingOrders == null)
          {
              return Problem("Entity set 'InventoryManagementContext.OutgoingOrders'  is null.");
          }
            _context.OutgoingOrders.Add(outgoingOrder);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOutgoingOrder", new { id = outgoingOrder.OrderId }, outgoingOrder);
        }

        // DELETE: api/OutgoingOrders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOutgoingOrder(int id)
        {
            if (_context.OutgoingOrders == null)
            {
                return NotFound();
            }
            var outgoingOrder = await _context.OutgoingOrders.FindAsync(id);
            if (outgoingOrder == null)
            {
                return NotFound();
            }

            _context.OutgoingOrders.Remove(outgoingOrder);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OutgoingOrderExists(int id)
        {
            return (_context.OutgoingOrders?.Any(e => e.OrderId == id)).GetValueOrDefault();
        }
    }
}
