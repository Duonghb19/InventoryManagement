using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class SupplierController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
