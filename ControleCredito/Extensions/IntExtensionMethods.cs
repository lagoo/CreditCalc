using System.Globalization;

namespace ControleCredito.Extensions
{
    public static class IntExtensionMethods
    {
        public static string ToBrazilianFormat(this decimal value)
        {
            return value.ToString("n2", new CultureInfo("pt-BR"));
        }
    }
}
