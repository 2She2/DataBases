// 01.Write a program that retrieves from the Northwind sample database in
//    MS SQL Server the number of rows in the Categories table.

namespace _01.CategoriesFromNorthwindDB
{
    using System;
    using System.Data.SqlClient;

    using NorthwindDBConnection;

    public class CategoriesFromNorthwindDB
    {
        static void Main(string[] args)
        {
            SqlConnection dbCon = NorthwindDBConnection.Connect();
            dbCon.Open();

            using (dbCon)
            {
                SqlCommand command = new SqlCommand(
                    "SELECT COUNT(CategoryID) FROM Categories", dbCon);

                int categoriesCount = (int)command.ExecuteScalar();
                Console.WriteLine("Categories count: " + categoriesCount);
            }
        }
    }
}
