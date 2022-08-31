using FlutterAPIAPP.Models;
using Microsoft.EntityFrameworkCore;

namespace FlutterAPIAPP.Data
{
    public class DataContext:DbContext
    {
        public DataContext() { }

        public DataContext(DbContextOptions<DataContext> options) : base(options) { }

        public DbSet<Cars> Cars { get; set; } = null!;
    }
}
