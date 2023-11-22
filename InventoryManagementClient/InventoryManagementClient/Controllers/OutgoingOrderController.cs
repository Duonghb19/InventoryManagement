using InventoryManagementClient.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class OutgoingOrderController : Controller
    {
        [RoleCheck("all")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
