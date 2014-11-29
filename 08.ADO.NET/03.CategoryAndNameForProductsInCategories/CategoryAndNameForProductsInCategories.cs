// 03.Write a program that retrieves from the Northwind database all
//    product categories and the names of the products in each category.
//    Can you do this with a single SQL query (with table join)?

namespace _03.CategoryAndNameForProductsInCategories
{
    using System;
    using System.Data.SqlClient;

    using NorthwindDBConnection;

    class CategoryAndNameForProductsInCategories
    {
        static void Main(string[] args)
        {
            SqlConnection dbCon = NorthwindDBConnection.Connect();
            dbCon.Open();

            using (dbCon)
            {
                SqlCommand command = new SqlCommand(
                    "SELECT c.CategoryName, p.ProductName " +
                    "FROM Categories c " +
                    "JOIN Products p " +
                    "ON c.CategoryID = p.CategoryID " +
                    "GROUP BY c.CategoryName, p.ProductName", dbCon);

                SqlDataReader reader = command.ExecuteReader();

                using (reader)
                {
                    while (reader.Read())
                    {
                        string categoryName = (string)reader["CategoryName"];
                        string productName = (string)reader["ProductName"];

                        Console.WriteLine("{0} - {1}", categoryName, productName);
                    }
                }
            }
        }
    }
}
