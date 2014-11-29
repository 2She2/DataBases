namespace NorthwindDBConnection
{
    using System.Data.SqlClient;

    public static class NorthwindDBConnection
    {
        public static SqlConnection Connect()
        {
            // If you can't connect try to change "(local)"
            SqlConnection dbCon = new SqlConnection(
                "Server=(local); Database=Northwind; Integrated Security=true");

            return dbCon;
        }
    }
}
