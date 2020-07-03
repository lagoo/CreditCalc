using ControleCredito.Enums;
using ControleCredito.Interfaces;
using System;

namespace ControleCredito.Implementations
{
    public class CreditFactory : ICreditFactory
    {
        public ICredit Create(CreditTypeEnum creditType, decimal value, int qtdInstallments, DateTime firstDueDate)
        {
            return creditType switch
            {
                CreditTypeEnum.Direct => new DirectCredit(value, qtdInstallments, firstDueDate),
                CreditTypeEnum.Consigned => new ConsignedCredit(value, qtdInstallments, firstDueDate),
                CreditTypeEnum.Fiscal => new FisicalCredit(value, qtdInstallments, firstDueDate),
                CreditTypeEnum.Legal => new LegalCredit(value, qtdInstallments, firstDueDate),
                CreditTypeEnum.RealState => new RealStateCredit(value, qtdInstallments, firstDueDate),
                _ => throw new Exception("Nenhuma configurção para este tipo de credito")
            };
        }
    }
}
