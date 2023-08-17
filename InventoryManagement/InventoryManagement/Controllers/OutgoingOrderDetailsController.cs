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
    public class OutgoingOrderDetailsController : ControllerBase
    {
        private readonly InventoryManagementContext _context;

        public OutgoingOrderDetailsController(InventoryManagementContext context)
        {
            _context = context;
        }

        // GET: api/OutgoingOrderDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OutgoingOrderDetail>>> GetOutgoingOrderDetails()
        {
          if (_context.OutgoingOrderDetails == null)
          {
              return NotFound();
          }
            return await _context.OutgoingOrderDetails.ToListAsync();
        }

        // GET: api/OutgoingOrderDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OutgoingOrderDetail>> GetOutgoingOrderDetail(int id)
        {
          if (_context.OutgoingOrderDetails == null)
          {
              return NotFound();
          }
            var outgoingOrderDetail = await _context.OutgoingOrderDetails.FindAsync(id);

            if (outgoingOrderDetail == null)
            {
                return NotFound();
            }

            return outgoingOrderDetail;
        }

        // PUT: api/OutgoingOrderDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOutgoingOrderDetail(int id, OutgoingOrderDetail outgoingOrderDetail)
        {
            if (id != outgoingOrderDetail.DetailId)
            {
                return BadRequest();
            }

            _context.Entry(outgoingOrderDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OutgoingOrderDetailExists(id))
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

        // POST: api/OutgoingOrderDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<OutgoingOrderDetail>> PostOutgoingOrderDetail(OutgoingOrderDetail outgoingOrderDetail)
        {
          if (_context.OutgoingOrderDetails == null)
          {
              return Problem("Entity set 'InventoryManagementContext.OutgoingOrderDetails'  is null.");
          }
            _context.OutgoingOrderDetails.Add(outgoingOrderDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOutgoingOrderDetail", new { id = outgoingOrderDetail.DetailId }, outgoingOrderDetail);
        }

        // DELETE: api/OutgoingOrderDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOutgoingOrderDetail(int id)
        {
            if (_context.OutgoingOrderDetails == null)
            {
                return NotFound();
            }
            var outgoingOrderDetail = await _context.OutgoingOrderDetails.FindAsync(id);
            if (outgoingOrderDetail == null)
            {
                return NotFound();
            }

            _context.OutgoingOrderDetails.Remove(outgoingOrderDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool OutgoingOrderDetailExists(int id)
        {
            return (_context.OutgoingOrderDetails?.Any(e => e.DetailId == id)).GetValueOrDefault();
        }
    }
}
