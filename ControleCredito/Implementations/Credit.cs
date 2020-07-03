using ControleCredito.Interfaces;
using System;

namespace ControleCredito.Implementations
{
    public abstract class Credit : ICredit
    {
        protected decimal Value { get; private set; }
        protected int QtdInstallments { get; private set; }
        protected DateTime FirstDueDate { get; private set; }

        protected Credit(decimal value, int qtdInstallments, DateTime firstDueDate)
        {
            Value = value;
            QtdInstallments = qtdInstallments;
            FirstDueDate = firstDueDate;

            Validate();
        }

        protected virtual void Validate()
        {
            bool approved = true;

            if (QtdInstallments < 5 || QtdInstallments > 72)
                approved = false;

            if (Value > 1000000.0m || Value <= 0)
                approved = false;

            if (FirstDueDate.Date < DateTime.Now.AddDays(15).Date || FirstDueDate.Date > DateTime.Now.AddDays(40).Date)
                approved = false;

            if (!approved)
                SetNotApproved();
        }

        protected void SetNotApproved()
        {
            IsApproved = false;
            Value = 0;
        }

        public bool IsApproved { get; private set; } = true;
        public decimal TotalValue => Value + InterestValue;
        public decimal InterestValue => Value * InterestTax;

        protected abstract decimal InterestTax { get; }
    }
}
