// 09.Create a method that places a new order in the Northwind database.
//    The order should contain several order items. Use transaction to ensure the data consistency.

namespace _09.InsertEntityWithTransaction
{
    using System;
    using System.Linq;
    using System.Transactions;

    using EntityFramework.Data;

    class Transactions
    {
        static void Main(string[] args)
        {
            using (var scope = new TransactionScope(TransactionScopeOption.Required))
            {
                using (var db = new NorthwindEntities())
                {
                    var order = new Order()
                        {
                            CustomerID = "VICTE",
                            EmployeeID = 4,
                            ShipCity = "selo Razstrelci",
                            ShipCountry = "Bulgaria"
                        };

                    db.Orders.Add(order);
                    db.SaveChanges();
                }

                scope.Complete();
            }
        }
    }
}
