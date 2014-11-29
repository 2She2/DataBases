// 04.Implement previous by using native SQL query and executing it through the DbContext.

namespace _04.PreviousWithSqlQuery
{
    using System;
    using System.Collections.Generic;

    using EntityFramework.Data;

    class PreviousWithSqlQuery
    {
        static void Main(string[] args)
        {
            using (var db = new NorthwindEntities())
            {
                string sqlQuery = "SELECT DISTINCT c.ContactName " +
                                  "FROM Orders o " +
                                  "JOIN Customers c " + 
                                  "ON o.CustomerID = c.CustomerID " + 
                                  "WHERE (1997 = (DATEPART(yyyy, o.OrderDate))) AND (o.ShipCountry = 'Canada')";
                
                var orders =  db.Database.SqlQuery<string>(sqlQuery);

                foreach (var order in orders)
                {
                    Console.WriteLine(order);
                }
            }
        }
    }
}
