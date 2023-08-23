using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class WarehouseController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
