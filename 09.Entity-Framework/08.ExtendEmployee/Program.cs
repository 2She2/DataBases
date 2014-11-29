// 08.By inheriting the Employee entity class create a class which allows employees
//	  to access their corresponding territories as property of type EntitySet<T>.

namespace _08.ExtendEmployee
{
    using System;
    using System.Linq;

    using EntityFramework.Data;

    public class Program
    {
        static void Main(string[] args)
        {
            using (var db = new NorthwindEntities())
            {
                Employee extendedEmployee = new Employee();
                extendedEmployee = db.Employees.First();

                foreach (var item in extendedEmployee.TerritoriesSet)
                {
                    Console.WriteLine(item.TerritoryDescription);
                }
            }
        }
    }
}
