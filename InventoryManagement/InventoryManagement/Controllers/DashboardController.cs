using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using InventoryManagement.Models;

namespace InventoryManagement.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DashboardController : ControllerBase
    {
        private readonly InventoryManagementContext _context;

        public DashboardController(InventoryManagementContext context)
        {
            _context = context;
        }

        [HttpGet("revenue")]
        public IActionResult GetRevenue([FromQuery] DateTime? date = null, [FromQuery] int? month = null, [FromQuery] int? year = null)
        {
            // Calculate total incoming amount for the specified date, month, or year
            decimal totalIncomingAmount = _context.IncomingReceipts
                .Where(receipt =>
                    (!date.HasValue || receipt.ReceiptDate.Value.Date == date.Value.Date) &&
                    (!month.HasValue || receipt.ReceiptDate.Value.Month == month.Value) &&
                    (!year.HasValue || receipt.ReceiptDate.Value.Year == year.Value)
                )
                .Sum(receipt => receipt.TotalAmount) ?? 0;

            // Calculate total outgoing amount for the specified date, month, or year
            decimal totalOutgoingAmount = _context.OutgoingOrders
                .Where(order =>
                    (!date.HasValue || order.OrderDate.Value.Date == date.Value.Date) &&
                    (!month.HasValue || order.OrderDate.Value.Month == month.Value) &&
                    (!year.HasValue || order.OrderDate.Value.Year == year.Value)
                )
                .Sum(order => order.TotalAmount) ?? 0;

            // Calculate revenue by subtracting outgoing amount from incoming amount
            decimal revenue = totalIncomingAmount - totalOutgoingAmount;

            return Ok(new
            {
                TotalIncomingAmount = totalIncomingAmount,
                TotalOutgoingAmount = totalOutgoingAmount,
                Revenue = revenue
            });
        }
    }
}
