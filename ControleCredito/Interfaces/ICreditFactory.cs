using ControleCredito.Enums;
using System;

namespace ControleCredito.Interfaces
{
    public interface ICreditFactory
    {
        ICredit Create(CreditTypeEnum creditType, decimal value, int qtdInstallments, DateTime firstDueDate);
    }
}
