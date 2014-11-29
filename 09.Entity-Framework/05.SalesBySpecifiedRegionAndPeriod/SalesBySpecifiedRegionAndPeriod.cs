// 05.Write a method that finds all the sales by specified region and period (start / end dates).

namespace _05.SalesBySpecifiedRegionAndPeriod
{
    using System;
    using System.Linq;

    using EntityFramework.Data;

    class SalesBySpecifiedRegionAndPeriod
    {
        static void Main(string[] args)
        {
            GetSales("RJ", new DateTime(1997, 1, 1), new DateTime(1998, 1, 1));
        }

        public static void GetSales(string region, DateTime start, DateTime end)
        {
            using (var db = new NorthwindEntities())
            {
                var sales = db.Orders.Where(x => x.ShipRegion == region &&
                                                 x.OrderDate >= start &&
                                                 x.OrderDate <= end)
                                     .Select(x =>
                                     new
                                     {
                                         OrderID = x.OrderID,
                                         ShipRegion = x.ShipRegion,
                                         OrderDate = x.OrderDate
                                     });

                foreach (var sale in sales)
                {
                    Console.WriteLine(sale);
                }
            }
        }
    }
}
