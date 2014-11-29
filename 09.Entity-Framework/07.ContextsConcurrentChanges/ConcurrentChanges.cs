// 07.Try to open two different data contexts and perform concurrent changes on the same records.
//	  What will happen at SaveChanges()? How to deal with it?

namespace _07.ContextsConcurrentChanges
{
    using System;
    using System.Linq;
    using System.Data.Entity;

    using EntityFramework.Data;

    class ConcurrentChanges
    {
        static void Main(string[] args)
        {
            using (var dbFirst = new NorthwindEntities())
            {
                using (var dbSecond = new NorthwindEntities())
                {
                    Customer customer = new Customer()
                    {
                        CustomerID = "WWWW",
                        CompanyName = "Bash firmata",
                        ContactName = "Peshooo"
                    };

                    dbFirst.Customers.Attach(customer);
                    dbFirst.SaveChanges();

                    dbSecond.Customers.Attach(customer);
                    dbSecond.Customers.Remove(customer);
                    dbSecond.SaveChanges();
                }
            }
        }
    }
}
