using InventoryManagement.Models;
using Microsoft.OData.Edm;
using Microsoft.OData.ModelBuilder;

namespace InventoryManagement.ODataConfig
{
    public class IEdmModelConfig
    {
        public static IEdmModel GetEdmModel()
        {
            ODataConventionModelBuilder builder = new();
            builder.EntitySet<User>("Users");
            return builder.GetEdmModel();
        }
    }
}
