using ControleCredito.Enums;
using ControleCredito.Implementations;
using Shouldly;
using System;
using System.Collections.Generic;
using Xunit;

namespace ControleCredito.UnitTests
{
    public class CreditFactoryTests
    {
        private readonly CreditFactory _sut;

        public static IEnumerable<object[]> DataForTest =>
        new List<object[]>
        {
            new object[] { CreditTypeEnum.Consigned, typeof(ConsignedCredit)},
            new object[] { CreditTypeEnum.Direct, typeof(DirectCredit)},
            new object[] { CreditTypeEnum.Fiscal, typeof(FisicalCredit)},
            new object[] { CreditTypeEnum.Legal, typeof(LegalCredit)},
            new object[] { CreditTypeEnum.RealState, typeof(RealStateCredit)}
        };

        public CreditFactoryTests()
        {
            _sut = new CreditFactory();
        }

        [Theory]
        [MemberData(nameof(DataForTest))]
        public void Create_WhenValidEnumValue_ReturnCreditOfType(CreditTypeEnum creditType, Type creditTypeof)
        {
            var result = _sut.Create(creditType, 0, 0, DateTime.Now);

            result.ShouldBeOfType(creditTypeof);
        }
    }
}
