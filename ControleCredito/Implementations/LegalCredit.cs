using System;

namespace ControleCredito.Implementations
{
    public class LegalCredit : Credit
    {
        public LegalCredit(decimal value, int qtdInstallments, DateTime firstDueDate) : base(value, qtdInstallments, firstDueDate)
        {
        }

        protected override void Validate()
        {
            base.Validate();

            if (Value < 15000)
                SetNotApproved();
        }

        protected override decimal InterestTax => 0.05m;
    }
}
