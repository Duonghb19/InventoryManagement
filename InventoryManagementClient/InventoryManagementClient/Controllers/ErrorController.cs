using InventoryManagementClient.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace InventoryManagementClient.Controllers
{
    public class ErrorController : Controller
    {
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Index(int? errorCode)
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier, ErrorCode = errorCode });
        }
    }
}
