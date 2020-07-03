using System;

namespace ControleCredito.Implementations
{
    public class DirectCredit : Credit
    {
        public DirectCredit(decimal value, int qtdInstallments, DateTime firstDueDate) : base(value, qtdInstallments, firstDueDate)
        {
        }

        protected override decimal InterestTax => 0.02m;
    }
}
