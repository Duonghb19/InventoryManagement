using InventoryManagementClient.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PROGradingProjectClient.Controllers;
using System.Net.Http;

namespace InventoryManagementClient.Controllers
{
    public class AccountController : BaseNewController
    {
        public AccountController(IHttpClientFactory httpClientFactory, IHttpContextAccessor httpContextAccessor, ILogger logger) : base(httpClientFactory, httpContextAccessor, logger)
        {
        }

        //GET: Login
        [AllowAnonymous]
        public ActionResult Login(string? returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel model, string? returnUrl = null)
        {
            try
            {
                if (!ModelState.IsValid) return View(model);
                var response = await _httpClient.PostAsJsonAsync("Auth/Login", model);
                if (response.IsSuccessStatusCode)
                {
                    var result = await response.Content.ReadFromJsonAsync<ServiceResponse>();
                    if (result != null && result.Success)
                    {
                        if (result.Data != null)
                        {
                            var user = JsonConvert.DeserializeObject<UserInfo>(result.Data.ToString());
                            var cookieOptions = new CookieOptions
                            {
                                HttpOnly = true,
                                Expires = DateTimeOffset.UtcNow.AddHours(24)
                            };
                            Response.Cookies.Append("InventoryManagement-AccessToken", user.Token, cookieOptions);
                            HttpContext.Session.SetString("InventoryManagement-User", result.Data.ToString());
                            if (returnUrl != null)
                            {
                                return Redirect(returnUrl);
                            }
                            return RedirectToAction("Index", "Home");
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("ErrorMessage", result.Message);
                        return View();
                    }
                }
                else
                {
                    ModelState.AddModelError("ErrorMessage", "Invalid login attempt.");
                }
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "Error", new { errorCode = 500 });
            }
            return View();
        }
    }
}
