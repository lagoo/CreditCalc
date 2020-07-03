using ControleCredito.Interfaces;
using ControleCredito.Models;

namespace ControleCredito
{
    public class CreditService : ICreditService
    {
        private readonly ICreditFactory creditFactory;

        public CreditService(ICreditFactory creditFactory)
        {
            this.creditFactory = creditFactory;
        }

        public CreditResult EvaluateCredit(CreditInput creditInput)
        {
            ICredit credit = creditFactory.Create(creditInput.CreditType,
                                                  creditInput.Value,
                                                  creditInput.QtdInstallments,
                                                  creditInput.FirstDueDate);


            CreditResult result = new CreditResult(credit.IsApproved,
                                                   credit.TotalValue,
                                                   credit.InterestValue);


            return result;
        }
    }
}
