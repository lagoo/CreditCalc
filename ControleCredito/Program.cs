using ControleCredito.Implementations;
using ControleCredito.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace ControleCredito
{
    class Program
    {
        static void Main(string[] args)
        {
            IHost host = CreateHostBuilder(args).Build(); 

            ConsoleWorker worker = host.Services.GetService<ConsoleWorker>();

            worker.Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
          Host.CreateDefaultBuilder(args)
              .ConfigureServices((hostContext, services) =>
              {
                  services.AddScoped<ConsoleWorker>();
                  services.AddScoped<ICreditService, CreditService>();
                  services.AddScoped<ICreditFactory, CreditFactory>();
              });
    }
}
