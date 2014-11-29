// 03.Write a method that finds all customers who have orders made in 1997 and shipped to Canada.

namespace _03.CustomersWhoOrdersIn1997ToCanada
{
    using System;
    using System.Linq;

    using EntityFramework.Data;

    class CustomersWhoOrdersIn1997ToCanada
    {
        static void Main(string[] args)
        {
            CustomersWithOrderIn1997ToCanada();
        }

        public static void CustomersWithOrderIn1997ToCanada()
        {
            using (var db = new NorthwindEntities())
            {
                var customers = db.Orders.Where(x => x.OrderDate.Value.Year == 1997 &&
                                                  x.ShipCountry == "Canada")
                                         .Select(x => x.Customer.ContactName)
                                         .Distinct();

                foreach (var customer in customers)
                {
                    Console.WriteLine(customer);
                }
            }
        }
    }
}
