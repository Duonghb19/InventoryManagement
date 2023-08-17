using InventoryManagement.Models;
using Newtonsoft.Json;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace InventoryManagement.JWT
{
    public class JwtHelper : IJwtHelper
    {
        private readonly IConfiguration _configuration;
        public JwtHelper(IConfiguration configuration)
        {
            _configuration = configuration;
        }
        public string GenerateToken(UserInfo userInfo)
        {
            var jwtKey = _configuration["Jwt:Key"];
            var jwtExpireMinutes = _configuration["Jwt:ExpireMinutes"];
            if (string.IsNullOrEmpty(jwtKey) || string.IsNullOrEmpty(jwtExpireMinutes))
            {
                throw new Exception("Jwt key or expire minutes is not configured");
            }
            // get secret key from appsettings.json
            var secretKey = Encoding.ASCII.GetBytes(jwtKey);
            // create token handler
            var tokenHandler = new JwtSecurityTokenHandler();
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.NameIdentifier, userInfo.UserId.ToString()),
                    new Claim(ClaimTypes.Name, userInfo.Username ?? ""),
                    new Claim(ClaimTypes.UserData, JsonConvert.SerializeObject(userInfo)),
                    new Claim(ClaimTypes.Role, userInfo.Role ?? ""),
                }),
                Expires = DateTime.UtcNow.AddMinutes(int.Parse(jwtExpireMinutes)),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(secretKey), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }

        public UserInfo? ValidateToken(string token)
        {
            if (token == null) return null;
            var jwtKey = _configuration["Jwt:Key"];
            if (string.IsNullOrEmpty(jwtKey))
            {
                throw new Exception("Jwt key is not configured");
            }
            // get secret key from appsettings.json
            var secretKey = Encoding.ASCII.GetBytes(jwtKey);

            try
            {
                // create token handler
                var tokenHandler = new JwtSecurityTokenHandler();
                _ = tokenHandler.ValidateToken(token, new TokenValidationParameters
                {
                    IssuerSigningKey = new SymmetricSecurityKey(secretKey),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ValidateIssuer = false,
                    ValidateAudience = false
                }, out SecurityToken validatedToken);
                var jwtToken = (JwtSecurityToken)validatedToken;
                return new UserInfo
                {
                    UserId = int.Parse(jwtToken.Claims.FirstOrDefault(x => x.Type == "nameid")?.Value ?? ""),
                    Username = jwtToken.Claims.FirstOrDefault(x => x.Type == "unique_name")?.Value,
                    Role = jwtToken.Claims.FirstOrDefault(x => x.Type == "role")?.Value
                };
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}
