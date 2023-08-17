using InventoryManagement.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InventoryManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IncomingReceiptsController : ControllerBase
    {
        private readonly InventoryManagementContext _context;

        public IncomingReceiptsController(InventoryManagementContext context)
        {
            _context = context;
        }

        // GET: api/IncomingReceipts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<IncomingReceipt>>> GetIncomingReceipts()
        {
            if (_context.IncomingReceipts == null)
            {
                return NotFound();
            }
            return await _context.IncomingReceipts.ToListAsync();
        }

        // GET: api/IncomingReceipts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<IncomingReceipt>> GetIncomingReceipt(int id)
        {
            if (_context.IncomingReceipts == null)
            {
                return NotFound();
            }
            var incomingReceipt = await _context.IncomingReceipts.FindAsync(id);

            if (incomingReceipt == null)
            {
                return NotFound();
            }

            return incomingReceipt;
        }

        // PUT: api/IncomingReceipts/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutIncomingReceipt(int id, IncomingReceipt incomingReceipt)
        {
            if (id != incomingReceipt.ReceiptId)
            {
                return BadRequest();
            }

            _context.Entry(incomingReceipt).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!IncomingReceiptExists(id))
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

        // POST: api/IncomingReceipts
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<IncomingReceipt>> PostIncomingReceipt(IncomingReceipt incomingReceipt)
        {
            if (_context.IncomingReceipts == null)
            {
                return Problem("Entity set 'InventoryManagementContext.IncomingReceipts'  is null.");
            }
            _context.IncomingReceipts.Add(incomingReceipt);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetIncomingReceipt", new { id = incomingReceipt.ReceiptId }, incomingReceipt);
        }

        // DELETE: api/IncomingReceipts/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteIncomingReceipt(int id)
        {
            if (_context.IncomingReceipts == null)
            {
                return NotFound();
            }
            var incomingReceipt = await _context.IncomingReceipts.FindAsync(id);
            if (incomingReceipt == null)
            {
                return NotFound();
            }

            _context.IncomingReceipts.Remove(incomingReceipt);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool IncomingReceiptExists(int id)
        {
            return (_context.IncomingReceipts?.Any(e => e.ReceiptId == id)).GetValueOrDefault();
        }
    }
}
