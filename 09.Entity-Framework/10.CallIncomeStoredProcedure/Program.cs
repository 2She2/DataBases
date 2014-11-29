namespace _10.CallIncomeStoredProcedure
{
    using System;
    using System.Linq;

    using EntityFramework.Data;

    class Program
    {
        static void Main(string[] args)
        {
            using (var db = new NorthwindEntities())
            {
                var totalIncomes = db.usp_GetTotalIncome("Exotic Liquids", new DateTime(1980, 1, 1), new DateTime(2010, 1, 1)).First();

                Console.WriteLine("Total incomes: " + totalIncomes);
            }
        }
    }
}
