using InventoryManagement.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using InventoryManagement.Models.DTO;

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

        [HttpPost("add-products")]
        public async Task<IActionResult> AddProductsToIncomingReceipt([FromBody] AddIncomingReceiptDTO incomingReceiptDTO)
        {
            try
            {
                if (incomingReceiptDTO == null || incomingReceiptDTO.Details == null || incomingReceiptDTO.Details.Count == 0)
                {
                    return BadRequest("Invalid data");
                }

                var supplier = await _context.Suppliers.FindAsync(incomingReceiptDTO.SupplierId);
                if (supplier == null)
                {
                    return BadRequest("Invalid supplier");
                }

                var warehouse = await _context.Warehouses.FindAsync(incomingReceiptDTO.WarehouseId);
                if (warehouse == null)
                {
                    return BadRequest("Invalid warehouse");
                }

                var totalAmount = incomingReceiptDTO.Details.Sum(detailDTO => (detailDTO.Quantity) * (detailDTO.PurchasePrice));

                var incomingReceipt = new IncomingReceipt
                {
                    Supplier = supplier,
                    Warehouse = warehouse,
                    ReceiptDate = DateTime.Now,
                    CreatedDate = DateTime.Now,
                    CreatedBy = incomingReceiptDTO.CreatedBy,
                    ModifiedDate = DateTime.Now,
                    ModifiedBy = incomingReceiptDTO.ModifiedBy,
                    TotalAmount = totalAmount,
                    IncomingReceiptDetails = incomingReceiptDTO.Details.Select(detailDTO =>
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

                        if (detailDTO.PurchasePrice == null)
                        {
                            throw new ArgumentException("Purchase price is required");
                        }

                        return new IncomingReceiptDetail
                        {
                            Product = product,
                            Quantity = detailDTO.Quantity,
                            PurchasePrice = detailDTO.PurchasePrice,
                            CreatedDate = DateTime.Now
                        };
                    }).ToList()
                };

                _context.IncomingReceipts.Add(incomingReceipt);
                await _context.SaveChangesAsync();

                return Ok("Products added to incoming receipt successfully.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }




        [CustomAuthorize("admin")]
        [HttpGet("list")]
        public IActionResult GetIncomingReceipts()
        {
            try
            {
                var incomingReceipts = _context.IncomingReceipts
                    .Include(r => r.Supplier)
                    .Include(r => r.Warehouse)
                    .Include(r => r.IncomingReceiptDetails)
                        .ThenInclude(detail => detail.Product)
                    .ToList();

                var incomingReceiptDTOs = incomingReceipts.Select(receipt => new IncomingReceiptDTO
                {
                    ReceiptId = receipt.ReceiptId,
                    SupplierId = receipt.SupplierId,
                    SupplierName = receipt.Supplier?.SupplierName ?? "Unknown Supplier",
                    WarehouseId = receipt.WarehouseId,
                    WarehouseName = receipt.Warehouse?.WarehouseName ?? "Unknown Warehouse",
                    ReceiptDate = receipt.ReceiptDate,
                    CreatedBy = receipt.CreatedBy,
                    TotalAmount = receipt.TotalAmount,
                    Details = receipt.IncomingReceiptDetails.Select(detail => new IncomingReceiptDetailDTO
                    {
                        DetailId = detail.DetailId,
                        ProductId = detail.ProductId,
                        ProductName = detail.Product?.ProductName ?? "Unknown Product",
                        Quantity = detail.Quantity ?? 0,
                        PurchasePrice = detail.PurchasePrice ?? 0
                    }).ToList()
                }).ToList();

                return Ok(incomingReceiptDTOs);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"An error occurred: {ex.Message}");
            }
        }
        [CustomAuthorize("admin")]
        [HttpGet("listSuppliers")]
        public IActionResult listSuppliers()
        {
            var suppliers = _context.Suppliers.ToList(); // Lấy danh sách Suppliers từ database

            if (suppliers == null || suppliers.Count == 0)
            {
                return NotFound("No suppliers available");
            }

            return Ok(suppliers);
        }
        [CustomAuthorize("admin")]
        [HttpGet("listWarehouse")]
        public IActionResult ListWarehouse()
        {
            var warehouses = _context.Warehouses.ToList(); // Lấy danh sách Warehouses từ database

            if (warehouses == null || warehouses.Count == 0)
            {
                return NotFound("No warehouses available");
            }

            return Ok(warehouses);
        }
        [CustomAuthorize("admin")]
        [HttpGet("listUser")]
        public IActionResult ListUser()
        {
            var users = _context.Users.ToList(); // Retrieve list of users from the database

            if (users == null || users.Count == 0)
            {
                return NotFound("No users available");
            }

            return Ok(users);
        }

        [CustomAuthorize("admin")]
        [HttpGet("listProduct")]
        public IActionResult ListProduct()
        {
            var products = _context.Products.ToList(); // Retrieve list of products from the database

            if (products == null || products.Count == 0)
            {
                return NotFound("No products available");
            }

            return Ok(products);
        }
        [CustomAuthorize("admin")]
        [HttpGet("listCustomers")]
        public IActionResult ListCustomers()
        {
            var customers = _context.Customers.ToList();
            var customerDTOs = customers.Select(customer => new CustomerDTO
            {
                CustomerId = customer.CustomerId,
                CustomerName = customer.CustomerName,
                ContactPerson = customer.ContactPerson,
                ContactEmail = customer.ContactEmail,
                ContactPhone = customer.ContactPhone,
                CreatedDate = customer.CreatedDate,
                CreatedBy = customer.CreatedBy,
                ModifiedDate = customer.ModifiedDate,
                ModifiedBy = customer.ModifiedBy
            }).ToList();

            return Ok(customerDTOs);
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
