using System;

namespace ControleCredito.Implementations
{
    public class FisicalCredit : Credit
    {
        public FisicalCredit(decimal value, int qtdInstallments, DateTime firstDueDate) : base(value, qtdInstallments, firstDueDate)
        {
        }

        protected override decimal InterestTax => 0.03m;
    }
}
