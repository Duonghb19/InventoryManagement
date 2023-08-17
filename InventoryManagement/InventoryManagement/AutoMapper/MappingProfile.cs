using AutoMapper;
using InventoryManagement.Models;

namespace InventoryManagement.AutoMapper
{
    public class MappingProfile : Profile
    {

        public MappingProfile()
        {
            CreateMap<User, UserInfo>();
            CreateMap<UserInfo, User>();

            CreateMap<Category, CategoryDTO>();
            CreateMap<CategoryDTO, Category>();

            CreateMap<Supplier, SupplierDTO>();
            CreateMap<SupplierDTO, Supplier>();

            CreateMap<Customer, CustomerDTO>();
            CreateMap<CustomerDTO, Customer>();
        }
    }
}
