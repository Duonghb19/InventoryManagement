using InventoryManagementClient.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class ProductController : Controller
    {
        [RoleCheck("admin")]
        public IActionResult Categories()
        {
            return View();
        }

        public IActionResult Index()
        {
            return View();
        }
    }
}
