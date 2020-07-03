using System;

namespace ControleCredito.Implementations
{
    public class ConsignedCredit : Credit
    {
        public ConsignedCredit(decimal value, int qtdInstallments, DateTime firstDueDate) : base(value, qtdInstallments, firstDueDate)
        {
        }

        protected override decimal InterestTax => 0.01m;
    }
}
