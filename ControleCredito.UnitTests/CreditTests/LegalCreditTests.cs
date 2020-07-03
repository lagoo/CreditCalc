using ControleCredito.Implementations;
using Shouldly;
using System;
using System.Collections.Generic;
using Xunit;

namespace ControleCredito.UnitTests.CreditTests
{
    public class LegalCreditTests
    {
        private LegalCredit _sut;

        public static IEnumerable<object[]> DataForTest =>
        new List<object[]>
        {
            new object[] { 15001, 5, DateTime.Now.AddDays(15).Date, true },
            new object[] { 0, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { -1, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { 1000001, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { 100, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { 15001, 4, DateTime.Now.AddDays(15).Date, false  },
            new object[] { 15001, 5, DateTime.Now.AddDays(10).Date, false  },
            new object[] { 15001, 5, DateTime.Now.AddDays(41).Date, false  }
        };

        [Theory]
        [MemberData(nameof(DataForTest))]
        public void Validate_WhenCreditCreated(decimal value, int qtdInstallments, DateTime firstDueDate, bool expectedStatus)
        {
            _sut = new LegalCredit(value, qtdInstallments, firstDueDate);

            _sut.IsApproved.ShouldBe(expectedStatus);
        }

        [Fact]
        public void TotalValue_WhenValidCreditCreated_ShouldBeAddedInterestValue()
        {
            _sut = new LegalCredit(15001, 5, DateTime.Now.AddDays(15).Date);

            _sut.TotalValue.ShouldBe(15751.05m);
        }

        [Fact]
        public void InterestValue_WhenValidCreditCreated_ShouldBePercentageOfValue()
        {
            _sut = new LegalCredit(15001, 5, DateTime.Now.AddDays(15).Date);

            _sut.InterestValue.ShouldBe(750.05m);
        }
    }
}
