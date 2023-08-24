using InventoryManagementClient.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    [RoleCheck("all")]
    public class CustomerController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
