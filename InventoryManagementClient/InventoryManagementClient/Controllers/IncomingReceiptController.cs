using InventoryManagementClient.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    public class IncomingReceiptController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
