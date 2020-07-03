namespace ControleCredito.Interfaces
{
    public interface ICredit
    {
        decimal TotalValue { get; }
        decimal InterestValue { get; }
        bool IsApproved { get; }
    }
}
