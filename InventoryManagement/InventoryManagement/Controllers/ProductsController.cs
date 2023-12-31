﻿using AutoMapper;
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
    public class ProductsController : BaseControllerCustom
    {
        private readonly InventoryManagementContext _context;

        public ProductsController(InventoryManagementContext context, IHttpContextAccessor httpContext, IConfiguration configuration, IMapper mapper, IAuthService authService) : base(httpContext, configuration, mapper, authService)
        {
            _context = context;
        }

        [HttpPost("[action]")]
        public IActionResult GetProducts([FromForm] DataRequest request)
        {
            if (_context.Products == null)
            {
                return NotFound();
            }
            var productsWithDetails = _context.Products.Select(product => new
            {
                product.ProductId,
                product.ProductName,
                product.CategoryId,
                product.QuantityInStock,
                product.PurchasePrice,
                product.SalePrice,
                product.WarehouseId,
                product.CreatedDate,
                product.CreatedBy,
                product.ModifiedDate,
                product.ModifiedBy,
                CategoryName = product.Category.CategoryName,
                WarehouseName = product.Warehouse.WarehouseName
            }).ToDataResult(request);
            return Ok(productsWithDetails);
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            if (_context.Products == null)
            {
                return NotFound();
            }
            var product = _context.Products.Select(product => new
            {
                product.ProductId,
                product.ProductName,
                product.CategoryId,
                product.QuantityInStock,
                product.PurchasePrice,
                product.SalePrice,
                product.WarehouseId,
                product.CreatedDate,
                product.CreatedBy,
                product.ModifiedDate,
                product.ModifiedBy,
                CategoryName = product.Category.CategoryName, // Include CategoryName
                WarehouseName = product.Warehouse.WarehouseName // Include WarehouseName
            }).Where(product => product.ProductId == id).FirstOrDefault();
            if (product == null)
            {
                return NotFound();
            }
            return Ok(product);
        }

        // PUT: api/Products/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        [CustomAuthorize("admin")]
        public async Task<IActionResult> PutProduct(int id, Product product)
        {
            if (id != product.ProductId)
            {
                return BadRequest();
            }

            _context.Entry(product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
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

        // POST: api/Products
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        [CustomAuthorize("admin")]
        public async Task<ActionResult<Product>> PostProduct(Product product)
        {
            if (_context.Products == null)
            {
                return Problem("Entity set 'InventoryManagementContext.Products'  is null.");
            }
            _context.Products.Add(product);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProduct", new { id = product.ProductId }, product);
        }

        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        [CustomAuthorize("admin")]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            if (_context.Products == null)
            {
                return NotFound();
            }
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }

            _context.Products.Remove(product);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductExists(int id)
        {
            return (_context.Products?.Any(e => e.ProductId == id)).GetValueOrDefault();
        }
    }
}
