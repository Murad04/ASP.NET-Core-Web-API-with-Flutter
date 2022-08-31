using FlutterAPIAPP.Data;
using FlutterAPIAPP.Data.Interfaces;
using FlutterAPIAPP.Models;
using Microsoft.EntityFrameworkCore;
using AutoMapper;

internal class Program
{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        // Add services to the container.

        builder.Services.AddControllers();
        builder.Services.AddDbContext<DataContext>(opt => opt.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
        builder.Services.AddCors(option =>
        {
            option.AddPolicy(
                "allowedOrigin",
                builder => builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
        });
        builder.Services.AddScoped<ICarsRepository<Cars>, CarsRepository>();

        // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();
        builder.Services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());

        var app = builder.Build();

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        app.UseAuthorization();

        app.MapControllers();

        app.Run();
    }
}