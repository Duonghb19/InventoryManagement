using InventoryManagement.AutoMapper;
using InventoryManagement.JWT;
using InventoryManagement.Middleware;
using InventoryManagement.Models;
using InventoryManagement.ODataConfig;
using InventoryManagement.Utils;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.OData;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);
// Add policy
builder.Services.AddCors(options =>
{
    options.AddPolicy("CORSPolicy", builder => builder.AllowAnyMethod().AllowAnyHeader().AllowCredentials().SetIsOriginAllowed((hosts) => true));
});

// Add Odata
builder.Services.AddControllers().AddOData(option => option.AddRouteComponents("v1", IEdmModelConfig.GetEdmModel()).Filter().Select().Expand().Expand().OrderBy().Count().SetMaxTop(100));

// Configure JWT authentication
builder.Services.AddAuthentication(auth =>
{
    auth.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    auth.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
}).AddJwtBearer(token =>
{
    string secretkey = builder.Configuration["Jwt:Key"];
    if (string.IsNullOrEmpty(secretkey))
    {
        throw new Exception("Jwt key is not configured");
    }
    token.RequireHttpsMetadata = false;
    token.SaveToken = true;
    token.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(secretkey)),
        ValidateLifetime = true,
        ValidateIssuer = false,
        ValidateAudience = false
    };
});

// Configure DI for application services
builder.Services.AddDbContext<InventoryManagementContext>(option => option.UseSqlServer(builder.Configuration.GetConnectionString("SQLConnection")));
builder.Services.AddHttpContextAccessor();
builder.Services.AddAutoMapper(typeof(MappingProfile));
builder.Services.AddScoped<IAuthService, AuthService>();
builder.Services.AddSingleton<IJwtHelper, JwtHelper>();

builder.Services.AddRouting(option => option.LowercaseUrls = true);
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors("CORSPolicy");
app.UseRouting();
app.UseAuthentication();
app.UseMiddleware<AuthHandlerMiddleware>();
app.UseAuthorization();
app.UseHttpsRedirection();
app.MapControllers();
app.UseMiddleware<ErrorHandlerMiddleware>();
app.Run();
