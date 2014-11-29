// 04.Write a method that adds a new product in the products table in the Northwind database.
//    Use a parameterized SQL command.

namespace _04.AddProduct
{
    using System;
    using System.Data.SqlClient;

    using NorthwindDBConnection;

    class AddProduct
    {
        static void Main(string[] args)
        {
            SqlConnection dbCon = NorthwindDBConnection.Connect();
            dbCon.Open();

            using (dbCon)
            {
                InsertIntoProducts("Rakia", 1, 1, "0.7ml", 10.56M, 7, 5, 1, true, dbCon);

                Console.WriteLine("Rakia Inserted!");
            }
        }

        private static void InsertIntoProducts(string productName, int supplierID, int categoryID, string quantityPerUnit,
                                               decimal unitPrice, int? unitsInStock, int unitsOnOrder, int reorderLevel,
                                               bool discontinued, SqlConnection dbCon)
        {
            SqlCommand command = new SqlCommand(
                    "INSERT INTO Products " +
                        "(ProductName, SupplierID, CategoryID, QuantityPerUnit, " + 
                        "UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) " +
                    "VALUES " + 
                        "(@productName, @supplierID, @categoryID, @quantityPerUnit, " + 
                        "@unitPrice, @unitsInStock, @unitsOnOrder, @reorderLevel, @discontinued); ", dbCon);
            command.Parameters.AddWithValue("@productName", productName);
            command.Parameters.AddWithValue("@supplierID", supplierID);
            command.Parameters.AddWithValue("@categoryID", categoryID);
            command.Parameters.AddWithValue("@quantityPerUnit", quantityPerUnit);
            command.Parameters.AddWithValue("@unitPrice", unitPrice);
            command.Parameters.AddWithValue("@unitsInStock", unitsInStock);
            command.Parameters.AddWithValue("@unitsOnOrder", unitsOnOrder);
            command.Parameters.AddWithValue("@reorderLevel", reorderLevel);
            command.Parameters.AddWithValue("@discontinued", discontinued);

            command.ExecuteNonQuery();
        }
    }
}
