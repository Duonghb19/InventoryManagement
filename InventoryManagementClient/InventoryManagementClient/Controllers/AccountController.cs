using InventoryManagementClient.Attributes;
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

        [HttpGet]
        [RoleCheck("all")]
        public async Task<ActionResult> ChangePassword()
        {
            return View();
        }

        [HttpPost]
        [RoleCheck("all")]
        public async Task<ActionResult> ChangePassword(ChangePasswordViewModel model)
        {
            if (!ModelState.IsValid) return View(model);
            var response = await _httpClient.PutAsJsonAsync("users/changepassword", model);
            if (!response.IsSuccessStatusCode)
            {
                ModelState.AddModelError("OldPassword", "Wrong old password.");
                return View(model);
            }

            return RedirectToAction("ChangePassword", "Account", new { Message = "Change password successfully." });
        }

        [HttpGet]
        [RoleCheck("all")]
        public ActionResult Profile()
        {
            return View();
        }


        public IActionResult Logout()
        {
            Response.Cookies.Delete("InventoryManagement-AccessToken");
            HttpContext.Session.Remove("InventoryManagement-User");
            return RedirectToAction("Login", "Account");
        }

        [HttpPost]
        public IActionResult RefreshToken()
        {
            HttpContext.Session.Remove("InventoryManagement-User");
            return Ok();
        }
    }
}
