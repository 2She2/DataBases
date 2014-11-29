// 02.Write a program that retrieves the name and description of all categories in the Northwind DB.

namespace _02.NameAndDescriptionOfCategories
{
    using System;
    using System.Data.SqlClient;

    using NorthwindDBConnection;

    class NameAndDescriptionOfCategories
    {
        static void Main(string[] args)
        {
            SqlConnection dbCon = NorthwindDBConnection.Connect();
            dbCon.Open();

            using (dbCon)
            {
                SqlCommand command = new SqlCommand(
                    "SELECT CategoryName, Description FROM Categories", dbCon);

                SqlDataReader reader = command.ExecuteReader();

                using (reader)
                {
                    while (reader.Read())
                    {
                        string categoryName = (string)reader["CategoryName"];
                        string categoryDescription = (string)reader["Description"];

                        Console.WriteLine("{0} - {1}", categoryName, categoryDescription);
                    }
                }
            }
        }
    }
}
