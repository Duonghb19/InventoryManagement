using InventoryManagement.Models;
using AutoMapper;

namespace InventoryManagement.AutoMapper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<User, UserInfo>();
        }
    }
}
