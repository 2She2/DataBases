// 2.Using transactions write a method which retrieves some money (for example $200) from certain account.
//   The retrieval is successful when the following sequence of sub-operations is completed successfully:
//      - A query checks if the given CardPIN and CardNumber are valid.
//      - The amount on the account (CardCash) is evaluated to see whether
//        it is bigger than the requested sum (more than $200).
//      - The ATM machine pays the required sum (e.g. $200) and stores in the table CardAccounts the
//        new amount (CardCash = CardCash - 200).

// 3.Extend the project from the previous exercise and add a new table TransactionsHistory with fields
//   (Id, CardNumber, TransactionDate, Ammount) containing information about all money retrievals on all accounts.
//   Modify the program logic so that it saves historical information (logs) in the new table after
//   each successful money withdrawal.
//   What should the isolation level be for the transaction?

namespace _14.Transactions_in_ADO.NET_and_EF
{
    using System;
    using System.Linq;
    using System.Transactions;

    using ATM.Data;

    public class Transactions
    {
        public static void Main()
        {
			// First run "14.Transactions-in-ADO.NET-and-EF.sql"
            // If don't work, check the connection string!!!

            TransactionOptions transactionOptions = new TransactionOptions()
            {
                IsolationLevel = IsolationLevel.RepeatableRead
            };

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.RequiresNew, transactionOptions))
            {
                ATMEntities db = new ATMEntities();
                string pin = GetPIN();
                string cardNumber = GetCardNumber();
                decimal money = GetMoney();

                var userAccount = db.CardAccounts.Where(x => x.CardPIN == pin && x.CardNumber == cardNumber).FirstOrDefault();

                if (userAccount == null)
                {
                    Console.WriteLine("Incorrect PIN or card number!");
                    return;
                }

                if (userAccount.CardCash > money)
                {
                    userAccount.CardCash = userAccount.CardCash - 200;
                    db.TransactionsHistories.Add(new TransactionsHistory
                    {
                        Ammount = money,
                        CardNumber = cardNumber,
                        TransactionDate = DateTime.Now
                    });

                    Console.WriteLine(userAccount.CardCash);
                    db.SaveChanges();
                    Console.WriteLine("Please take {0} money!", money);
                }
                else
                {
                    Console.WriteLine("Not enough money!");
                }

                scope.Complete();
            }
        }

        // If we want we can get the PIN from the console
        private static string GetPIN()
        {
            return "9999";
        }

        private static string GetCardNumber()
        {
            return "peshovipid";
        }

        private static decimal GetMoney()
        {
            return 200M;
        }
    }
}
