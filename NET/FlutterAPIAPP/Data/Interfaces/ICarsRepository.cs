namespace FlutterAPIAPP.Data.Interfaces
{
    public interface ICarsRepository<T>
    {
        Task<List<T>> GetData();
        Task<T> GetDataById(int id);

        Task<T> InsertData(T car);
        Task<T> UpdateData(T car);
        Task<bool> DeleteData(T car);

        Task<List<T>> GetDataByCompany(string carCompany);
        Task<List<T>> GetDataByPrice(decimal carPrice);
        Task<List<T>> GetDataByDate(int carReleaseDate);
    }
}
