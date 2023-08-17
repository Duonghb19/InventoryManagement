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
    public class IncomingReceiptDetailsController : ControllerBase
    {
        private readonly InventoryManagementContext _context;

        public IncomingReceiptDetailsController(InventoryManagementContext context)
        {
            _context = context;
        }

        // GET: api/IncomingReceiptDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IncomingReceiptDetail>>> GetIncomingReceiptDetails()
        {
          if (_context.IncomingReceiptDetails == null)
          {
              return NotFound();
          }
            return await _context.IncomingReceiptDetails.ToListAsync();
        }

        // GET: api/IncomingReceiptDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<IncomingReceiptDetail>> GetIncomingReceiptDetail(int id)
        {
          if (_context.IncomingReceiptDetails == null)
          {
              return NotFound();
          }
            var incomingReceiptDetail = await _context.IncomingReceiptDetails.FindAsync(id);

            if (incomingReceiptDetail == null)
            {
                return NotFound();
            }

            return incomingReceiptDetail;
        }

        // PUT: api/IncomingReceiptDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutIncomingReceiptDetail(int id, IncomingReceiptDetail incomingReceiptDetail)
        {
            if (id != incomingReceiptDetail.DetailId)
            {
                return BadRequest();
            }

            _context.Entry(incomingReceiptDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!IncomingReceiptDetailExists(id))
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

        // POST: api/IncomingReceiptDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<IncomingReceiptDetail>> PostIncomingReceiptDetail(IncomingReceiptDetail incomingReceiptDetail)
        {
          if (_context.IncomingReceiptDetails == null)
          {
              return Problem("Entity set 'InventoryManagementContext.IncomingReceiptDetails'  is null.");
          }
            _context.IncomingReceiptDetails.Add(incomingReceiptDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetIncomingReceiptDetail", new { id = incomingReceiptDetail.DetailId }, incomingReceiptDetail);
        }

        // DELETE: api/IncomingReceiptDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteIncomingReceiptDetail(int id)
        {
            if (_context.IncomingReceiptDetails == null)
            {
                return NotFound();
            }
            var incomingReceiptDetail = await _context.IncomingReceiptDetails.FindAsync(id);
            if (incomingReceiptDetail == null)
            {
                return NotFound();
            }

            _context.IncomingReceiptDetails.Remove(incomingReceiptDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool IncomingReceiptDetailExists(int id)
        {
            return (_context.IncomingReceiptDetails?.Any(e => e.DetailId == id)).GetValueOrDefault();
        }
    }
}
