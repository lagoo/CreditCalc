using System;

namespace ControleCredito.Implementations
{
    public class RealStateCredit : Credit
    {
        public RealStateCredit(decimal value, int qtdInstallments, DateTime firstDueDate) : base(value, qtdInstallments, firstDueDate)
        {
        }

        protected override decimal InterestTax => 0.09m;
    }
}
