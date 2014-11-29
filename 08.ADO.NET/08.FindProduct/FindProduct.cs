// 08.Write a program that reads a string from the console and finds all products that contain this string.
//    Ensure you handle correctly characters like ', %, ", \ and _.

namespace _08.FindProduct
{
    using System;
    using System.Data.SqlClient;
    using System.Text.RegularExpressions;

    using NorthwindDBConnection;

    class FindProduct
    {
        static void Main(string[] args)
        {
            string searchedString = Console.ReadLine();

            if (Regex.IsMatch(searchedString, "[^0-9a-zA-Z]", RegexOptions.CultureInvariant))
            {
                searchedString = "[" + searchedString + "]";
            }

            SqlConnection dbCon = NorthwindDBConnection.Connect();
            dbCon.Open();

            using (dbCon)
            {
                SqlParameter searchParameter = new SqlParameter();
                searchParameter.ParameterName = "@searchParameter";
                searchParameter.Value = string.Format("%{0}%", searchedString);


                SqlCommand getCategories = new SqlCommand(
                    "SELECT ProductName " +
                    "FROM Products " +
                        "WHERE ProductName LIKE @searchParameter", dbCon);

                getCategories.Parameters.Add(searchParameter);

                var reader = getCategories.ExecuteReader();

                using (reader)
                {
                    Console.WriteLine("Matches:");

                    while (reader.Read())
                    {
                        string line = (string)reader["ProductName"];
                        Console.WriteLine(line);
                    }
                }
            }
        }
    }
}
