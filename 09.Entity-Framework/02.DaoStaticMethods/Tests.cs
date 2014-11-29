// 02.Create a DAO class with static methods which provide functionality for inserting,
//	  modifying and deleting customers. Write a testing class.

namespace _02.DaoStaticMethods
{
    using System;
    using System.Data.Entity;

    using EntityFramework.Data;

    class Tests
    {
        static void Main(string[] args)
        {
            Customer customer = new Customer()
            {
                CustomerID = "WWWW",
                CompanyName = "Bash firmata",
                ContactName = "Peshooo"
            };

            DAO.Insert(customer);
            DAO.Update(customer);
            //DAO.Delete(customer);
        }
    }
}
