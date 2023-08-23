using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class OutgoingOrderController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
