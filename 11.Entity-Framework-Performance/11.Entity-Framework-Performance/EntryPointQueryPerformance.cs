namespace _11.Entity_Framework_Performance
{
    using System;
    using System.Diagnostics;
    using System.Linq;

    using TelericAcademy.Data;

    public class EntryPointQueryPerformance
    {
        private static TelerikAcademyDb db = new TelerikAcademyDb();

        static void Main()
        {
            // If can't connect to the SQL Server, check the connection string!!!

            // 1.Using Entity Framework write a SQL query to select all employees from the Telerik Academy database and
            //   later print their name, department and town. Try the both variants: with and without .Include(…).
            //   Compare the number of executed SQL statements and the performance.

            GetInfoWithoutInclude(); // Many... many queries
            //GetInfoWithInclude(); // 1 query

            // 2.Using Entity Framework write a query that selects all employees from the Telerik Academy database,
            //   then invokes ToList(), then selects their addresses, then invokes ToList(), then selects their towns,
            //   then invokes ToList() and finally checks whether the town is "Sofia".
            //   Rewrite the same in more optimized way and compare the performance.

            //ToListSlow();
            //ToListFast();
        }

        private static void GetInfoWithoutInclude()
        {
            foreach (var employee in db.Employees)
            {
                Console.WriteLine("Name: {0}", employee.FirstName);
                Console.WriteLine("Department: {0}", employee.Department);
                Console.WriteLine("Town: {0}", employee.Address.Town);
            }
        }

        private static void GetInfoWithInclude()
        {
            foreach (var employee in db.Employees.Include("Department").Include("Address.Town"))
            {
                Console.WriteLine("Name: {0}", employee.FirstName);
                Console.WriteLine("Department: {0}", employee.Department);
                Console.WriteLine("Town: {0}", employee.Address.Town);
            }
        }

        private static void ToListSlow()
        {
            var employees = db.Employees.ToList()
                .Select(a => a.Address).ToList()
                .Select(t => t.Town).ToList()
                .Where(s => s.Name == "Sofia").ToList();

            foreach (var employee in employees)
            {
                Console.WriteLine("Name: {0}", employee);
            }
        }

        private static void ToListFast()
        {
            var employees = db.Employees
                .Select(a => a.Address)
                .Select(t => t.Town.Name == "Sofia").ToList();

            foreach (var employee in employees)
            {
                Console.WriteLine("Name: {0}", employee);
            }
        }
    }
}
