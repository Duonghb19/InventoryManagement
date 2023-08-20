using InventoryManagementClient.Attributes;
using InventoryManagementClient.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace InventoryManagementClient.Controllers
{
    [RoleCheck("admin")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }
    }
}