using ControleCredito.Enums;
using ControleCredito.Interfaces;
using System;
using System.Globalization;

namespace ControleCredito
{
    public class ConsoleWorker
    {
        private readonly ICreditService creditService;
        private bool Running = true;

        public ConsoleWorker(ICreditService creditService)
        {
            this.creditService = creditService;
        }

        internal void Run()
        {
            while (Running)
            {
                Console.WriteLine("====== Sistema de validação de Credito ======\n" +
                               "======================\n" +
                               "Digite a opção desejada: \n" +
                               "- Digite 1 para validar credito; \n" +
                               "- Digite 2 para limpar; \n" +
                               "- Digite 0 para sair \n" +
                               "======================\n");

                string option = Console.ReadLine();

                Running = option switch
                {
                    "0" => false,
                    "1" => CreateCredit(),
                    "2" => ClearConsole(),
                    _ => true
                };
            }
        }

        private bool CreateCredit()
        {
            decimal? value = null;
            int? qtdInstallments = null;
            DateTime? dueDate = null;
            CreditTypeEnum? creditType = null;
            string text;

            while (value == null)
            {
                Console.WriteLine(
                   "======================\n" +
                   "Digite o valor requisitado: \n" +
                   "======================\n");

                text = Console.ReadLine();

                if (decimal.TryParse(text, out decimal valueD))
                    value = valueD;
            }

            while (qtdInstallments == null)
            {
                Console.WriteLine(
                   "======================\n" +
                   "Digite a quantidade de parcelas: \n" +
                   "======================\n");

                text = Console.ReadLine();

                if (int.TryParse(text, out int qtdInstallmentsD))
                    qtdInstallments = qtdInstallmentsD;
            }


            while (dueDate == null)
            {
                Console.WriteLine(
                   "======================\n" +
                   "Digite a data de vencimento (dd/mm/yyyy): \n" +
                   "======================\n");

                text = Console.ReadLine();

                if (DateTime.TryParseExact(text, "dd/MM/yyyy", new CultureInfo("pt-BR"), DateTimeStyles.None, out DateTime dateD))
                    dueDate = dateD;
            }

            while (creditType == null)
            {
                Console.WriteLine(
                   "======================\n" +
                   "Digite a opção do credito desejada: \n" +
                       "- Digite 1 para Credito Direto; \n" +
                       "- Digite 2 para Credito Consignado; \n" +
                       "- Digite 3 para Credito Pessoa Jurídica; \n" +
                       "- Digite 4 para Credito Pessoa Física; \n" +
                       "- Digite 5 para Credito Imobiliário; \n" +
                   "======================\n");

                text = Console.ReadLine();

                if (Enum.TryParse(typeof(CreditTypeEnum), text, true, out object creditTypeD))
                    creditType = (CreditTypeEnum)creditTypeD;
            }

            var result = creditService.EvaluateCredit(new Models.CreditInput(creditType.Value, value.Value, qtdInstallments.Value, dueDate.Value));

            Console.WriteLine(
                "======================\n" +
                result + "\n" +
                "======================\n");

            return true;
        }

        private bool ClearConsole()
        {
            Console.Clear();

            return true;
        }
    }
}
