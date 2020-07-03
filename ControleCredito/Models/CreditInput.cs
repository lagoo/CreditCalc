using ControleCredito.Enums;
using System;

namespace ControleCredito.Models
{
    public class CreditInput
    {
        public CreditInput(CreditTypeEnum creditType, decimal value, int qtdInstallments, DateTime firstDueDate)
        {
            CreditType = creditType;
            Value = value;
            QtdInstallments = qtdInstallments;
            FirstDueDate = firstDueDate;
        }

        public CreditTypeEnum CreditType { get; }
        public decimal Value { get; }
        public int QtdInstallments { get; }
        public DateTime FirstDueDate { get; }
    }
}
