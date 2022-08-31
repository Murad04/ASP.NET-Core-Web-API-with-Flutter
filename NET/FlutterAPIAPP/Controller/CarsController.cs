using AutoMapper;
using FlutterAPIAPP.Data.Interfaces;
using FlutterAPIAPP.DTO;
using FlutterAPIAPP.Models;
using Microsoft.AspNetCore.Mvc;

namespace FlutterAPIAPP.Controller
{
    [ApiController]
    [Route("api/cars")]
    public class CarsController : ControllerBase
    {
        ICarsRepository<Cars> _carsRepository;
        IMapper _mapper;

        public CarsController(ICarsRepository<Cars> carsRepository, IMapper mapper)
        {
            _carsRepository = carsRepository;
            _mapper = mapper;
        }

        [HttpGet]
        public async Task<IActionResult> GetCars()
        {
            var data = await _carsRepository.GetData();
            return Ok(_mapper.Map<IEnumerable<CarsDTO>>(data));
        }

        [HttpGet("{carID}")]
        public async Task<IActionResult> GetDataById(int carID)
        {
            var data=await _carsRepository.GetDataById(carID);
            return Ok(_mapper.Map<CarsDTO>(data));
        }

        [HttpPost]
        public async Task<IActionResult> CreateCar(CarsDTO carsDTO)
        {
            var data = _mapper.Map<Cars>(carsDTO);
            await _carsRepository.InsertData(data);
            return Ok(carsDTO);
        }

        [HttpDelete("{carID}")]
        public async Task<IActionResult> DeleteCar(int carID)
        {
            var data = await _carsRepository.GetDataById(carID);
            await _carsRepository.DeleteData(data);
            return Ok(_mapper.Map<Cars>(data));
        }

        [HttpGet("GetDataByCompany/{carCompany}")]
        public async Task<IActionResult> GetDataByCompany(string carCompany)
        {
            var data = await _carsRepository.GetDataByCompany(carCompany);
            return Ok(_mapper.Map<IEnumerable<CarsDTO>>(data));
        }

        [HttpGet("GetDataByPrice/{carPrice:int}")]
        public async Task<IActionResult> GetDataByPrice(decimal carPrice)
        {
            var data=await _carsRepository.GetDataByPrice(carPrice);
            return Ok(_mapper.Map<IEnumerable<CarsDTO>>(data));
        }

        [HttpGet("GetDataByYear{carReleaseDate:int}")]
        public async Task<IActionResult> GetDataByReleaseDate(int carReleaseDate)
        {
            var data = await _carsRepository.GetDataByDate(carReleaseDate);
            return Ok(_mapper.Map<IEnumerable<CarsDTO>>(data));
        }
    }
}
