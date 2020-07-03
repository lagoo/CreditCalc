using ControleCredito.Extensions;

namespace ControleCredito.Models
{
    public class CreditResult
    {
        public CreditResult(bool creditAproved, decimal totalValue, decimal interestValue)
        {
            CreditAproved = creditAproved;
            TotalValue = totalValue;
            InterestValue = interestValue;
        }

        public bool CreditAproved { get; }
        public decimal TotalValue { get; }
        public decimal InterestValue { get; }

        public override string ToString()
        {
            return $"Credito: {(CreditAproved ? "Aprovado" : "Reprovado")}, Valor Total com Juros {TotalValue.ToBrazilianFormat()}, Valor do Juros {InterestValue.ToBrazilianFormat()}";
        }
    }
}
