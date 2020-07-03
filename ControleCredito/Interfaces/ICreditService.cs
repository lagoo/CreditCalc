using ControleCredito.Models;

namespace ControleCredito.Interfaces
{
    public interface ICreditService
    {
        CreditResult EvaluateCredit(CreditInput creditInput);
    }
}