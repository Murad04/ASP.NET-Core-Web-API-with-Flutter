using AutoMapper;
using FlutterAPIAPP.Models;
using FlutterAPIAPP.DTO;

namespace FlutterAPIAPP.Profiles
{
    public class CarsProfile:Profile
    {
        public CarsProfile()
        {
            CreateMap<Cars, CarsDTO>()
                .ForMember(m => m.CarID, opt => opt.MapFrom(src => src.CarID))
                .ForMember(m => m.CarName, opt => opt.MapFrom(src => src.CarName))
                .ForMember(m => m.CarPrice, opt => opt.MapFrom(src => src.CarPrice))
                .ForMember(m => m.CarModel, opt => opt.MapFrom(src => src.CarModel))
                .ForMember(m => m.CarCompany, opt => opt.MapFrom(src => src.CarCompany))
                .ForMember(m => m.CarReleaseDate, opt => opt.MapFrom(src => src.CarReleaseDate))
                .ForMember(m => m.CarImage, opt => opt.MapFrom(src => src.CarImage));
            CreateMap<CarsDTO, Cars>();
        }
    }
}
