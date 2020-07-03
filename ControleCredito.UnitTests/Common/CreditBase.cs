using System;

namespace ControleCredito.UnitTests.Common
{
    public abstract class CreditBase
    {
        protected virtual decimal validBaseValue { get; set; } = 1000;
        protected virtual int validBaseQtdInstallments { get; set; } = 6;
        protected virtual DateTime validBaseDate { get; set; } = DateTime.Now.AddDays(15);
    }
}
