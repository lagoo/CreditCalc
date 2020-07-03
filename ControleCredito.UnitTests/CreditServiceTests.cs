using ControleCredito.Enums;
using ControleCredito.Interfaces;
using ControleCredito.Models;
using Moq;
using Shouldly;
using System;
using Xunit;

namespace ControleCredito.UnitTests
{
    public class CreditServiceTests
    {
        private readonly CreditService _sut;
        private readonly Mock<ICredit> credit;
        private readonly Mock<ICreditFactory> creditFactoryMock;
        private readonly CreditInput input = new CreditInput(CreditTypeEnum.Consigned, 1000, 5, DateTime.Now);

        public CreditServiceTests()
        {
            creditFactoryMock = new Mock<ICreditFactory>();
            credit = new Mock<ICredit>();
            credit.Setup(e => e.IsApproved).Returns(true);
            credit.Setup(e => e.InterestValue).Returns(1);
            credit.Setup(e => e.TotalValue).Returns(1001);

            creditFactoryMock.Setup(e => e.Create(input.CreditType, input.Value, input.QtdInstallments, input.FirstDueDate)).Returns(credit.Object);

            _sut = new CreditService(creditFactoryMock.Object);
        }

        [Fact]
        public void EvaluateCredit_WhenIsValid_ShouldReturnCreditResult()
        {
           var result = _sut.EvaluateCredit(input);

            result.CreditAproved.ShouldBe(true);
            result.TotalValue.ShouldBe(1001);
            result.InterestValue.ShouldBe(1);
        }
    }
}
