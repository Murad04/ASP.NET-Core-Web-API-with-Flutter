using FlutterAPIAPP.Data.Interfaces;
using FlutterAPIAPP.Models;
using Microsoft.EntityFrameworkCore;

namespace FlutterAPIAPP.Data
{
    public class CarsRepository : ICarsRepository<Cars>
    {
        DataContext _dataContext;

        public CarsRepository(DataContext dataContext)
        {
            _dataContext = dataContext;
        }

        public async Task<bool> DeleteData(Cars cars)
        {
            var data = await _dataContext.Cars.FindAsync(cars);
            if (data is not null)
            {
                _dataContext.Cars.Remove(data);
                await _dataContext.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<List<Cars>> GetData()
        {
            var data = await _dataContext.Cars.ToListAsync();
            return data;
        }

        public async Task<List<Cars>> GetDataByCompany(string carCompany)
        {
            return await _dataContext.Cars.Where(car => car.CarCompany == carCompany).ToListAsync();
        }

        public async Task<List<Cars>> GetDataByDate(int carReleaseDate)
        {
            return await _dataContext.Cars.Where(car => car.CarReleaseDate.Year >= carReleaseDate).ToListAsync();
        }

        public async Task<Cars> GetDataById(int id)
        {
            return await _dataContext.Cars.Where(car => car.CarID == id).FirstOrDefaultAsync();
        }

        public async Task<List<Cars>> GetDataByPrice(decimal carPrice)
        {
            return await _dataContext.Cars.Where(car => car.CarPrice <= carPrice).ToListAsync();
        }

        public async Task<Cars> InsertData(Cars cars)
        {
            _dataContext.Cars.Add(cars);
            await _dataContext.SaveChangesAsync();
            return cars;
        }

        public async Task<Cars> UpdateData(Cars cars)
        {
            _dataContext.Update(cars).Property(car => car.CarID).IsModified = false;
            await _dataContext.SaveChangesAsync();
            return cars;
        }
    }
}
