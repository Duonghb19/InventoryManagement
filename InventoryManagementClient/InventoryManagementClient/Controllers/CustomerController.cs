using InventoryManagementClient.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace InventoryManagementClient.Controllers
{
    [RoleCheck("all")]
    public class CustomerController : Controller
    {
        [RoleCheck("all")]
        public IActionResult Index()
        {
            return View();
        }
    }
}
