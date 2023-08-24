using InventoryManagement.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InventoryManagement.Models.DTO;
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
        [HttpPost("create-order")]
        public async Task<IActionResult> CreateOutgoingOrder([FromBody] CreateOutgoingOrderDTO outgoingOrderDTO)
        {
            using var transaction = _context.Database.BeginTransaction();

            try
            {
                if (outgoingOrderDTO == null || outgoingOrderDTO.Details == null || outgoingOrderDTO.Details.Count == 0)
                {
                    return BadRequest("Invalid data");
                }

                var customer = await _context.Customers.FindAsync(outgoingOrderDTO.CustomerId);
                if (customer == null)
                {
                    return BadRequest("Invalid customer");
                }

                var warehouse = await _context.Warehouses.FindAsync(outgoingOrderDTO.WarehouseId);
                if (warehouse == null)
                {
                    return BadRequest("Invalid warehouse");
                }

                // Calculate total amount
                var totalAmount = outgoingOrderDTO.Details.Sum(detailDTO => (detailDTO.Quantity ?? 0) * (detailDTO.SalePrice ?? 0));

                var outgoingOrder = new OutgoingOrder
                {
                    Customer = customer,
                    Warehouse = warehouse,
                    OrderDate = DateTime.Now,
                    CreatedDate = DateTime.Now,
                    CreatedBy = outgoingOrderDTO.CreatedBy,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = outgoingOrderDTO.ModifiedBy,
                    TotalAmount = totalAmount,
                    OutgoingOrderDetails = outgoingOrderDTO.Details.Select(detailDTO =>
                    {
                        var product = _context.Products.Find(detailDTO.ProductId);
                        if (product == null)
                        {
                            throw new ArgumentException($"Invalid product ID: {detailDTO.ProductId}");
                        }

                        if (detailDTO.Quantity == null)
                        {
                            throw new ArgumentException("Quantity is required");
                        }

                        if (detailDTO.SalePrice == null)
                        {
                            throw new ArgumentException("Sale price is required");
                        }

                        if (product.QuantityInStock < detailDTO.Quantity)
                        {
                            throw new ArgumentException($"Insufficient quantity in stock for product ID: {detailDTO.ProductId}");
                        }

                        // Create outgoing order detail
                        var outgoingOrderDetail = new OutgoingOrderDetail
                        {
                            Product = product,
                            Quantity = detailDTO.Quantity,
                            SalePrice = detailDTO.SalePrice,
                            Warehouse = warehouse,
                            CreatedDate = DateTime.Now
                        };

                        // Update QuantityInStock in Product
                        product.QuantityInStock -= detailDTO.Quantity.Value;

                        return outgoingOrderDetail;
                    }).ToList()
                };

                _context.OutgoingOrders.Add(outgoingOrder);
                await _context.SaveChangesAsync();

                transaction.Commit();

                return Ok("Outgoing order created successfully.");
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
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

        [HttpGet("list")]
        public IActionResult GetOutgoingOrders()
        {
            try
            {
                var outgoingOrders = _context.OutgoingOrders
                    .Include(o => o.Customer)
                    .Include(o => o.Warehouse)
                    .Include(o => o.OutgoingOrderDetails)
                        .ThenInclude(detail => detail.Product)
                    .ToList();

                var outgoingOrderDTOs = outgoingOrders.Select(order => new LIstOutgoingOrderDTO
                {
                    OrderId = order.OrderId,
                    CustomerId = order.CustomerId,
                    CustomerName = order.Customer?.CustomerName,
                    WarehouseId = order.WarehouseId,
                    CreatedBy = order.CreatedBy,
                    WarehouseName = order.Warehouse?.WarehouseName,
                    OrderDate = order.OrderDate,
                    TotalAmount = order.TotalAmount,
                    Details = order.OutgoingOrderDetails.Select(detail => new ListOutgoingOrderDetailDTO
                    {
                        DetailId = detail.DetailId,
                        ProductId = detail.ProductId,
                        ProductName = detail.Product?.ProductName,
                        Quantity = detail.Quantity,
                        SalePrice = detail.SalePrice
                    }).ToList()
                }).ToList();

                return Ok(outgoingOrderDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
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
