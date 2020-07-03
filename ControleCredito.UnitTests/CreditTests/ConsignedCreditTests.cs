using ControleCredito.Implementations;
using Shouldly;
using System;
using System.Collections.Generic;
using Xunit;

namespace ControleCredito.UnitTests.CreditTests
{
    public class ConsignedCreditTests
    {
        private ConsignedCredit _sut;

        public static IEnumerable<object[]> DataForTest =>
        new List<object[]>
        {
            new object[] { 100, 5, DateTime.Now.AddDays(15).Date, true },
            new object[] { 0, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { -1, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { 1000001, 5, DateTime.Now.AddDays(15).Date, false },
            new object[] { 100, 4, DateTime.Now.AddDays(15).Date, false  },
            new object[] { 100, 5, DateTime.Now.AddDays(10).Date, false  },
            new object[] { 100, 5, DateTime.Now.AddDays(41).Date, false  },
        };

        [Theory]
        [MemberData(nameof(DataForTest))]
        public void Validate_WhenCreditCreated(decimal value, int qtdInstallments, DateTime firstDueDate, bool expectedStatus)
        {
            _sut = new ConsignedCredit(value, qtdInstallments, firstDueDate);

            _sut.IsApproved.ShouldBe(expectedStatus);
        }

        [Fact]
        public void TotalValue_WhenValidCreditCreated_ShouldBeAddedInterestValue()
        {
            _sut = new ConsignedCredit(100, 5, DateTime.Now.AddDays(15).Date);

            _sut.TotalValue.ShouldBe(101);
        }

        [Fact]
        public void InterestValue_WhenValidCreditCreated_ShouldBePercentageOfValue()
        {
            _sut = new ConsignedCredit(100, 5, DateTime.Now.AddDays(15).Date);

            _sut.InterestValue.ShouldBe(1);
        }


    }
}
