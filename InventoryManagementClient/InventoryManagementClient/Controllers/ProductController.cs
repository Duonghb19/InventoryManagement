using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Categories()
        {
            return View();
        }
    }
}
