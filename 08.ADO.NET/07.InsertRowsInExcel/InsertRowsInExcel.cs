// 07.Implement appending new rows to the Excel file.

namespace _07.InsertRowsInExcel
{
    using System;
    using System.Data.OleDb;

    class InsertRowsInExcel
    {
        static void Main(string[] args)
        {
            string path = @"../../../Chart.xlsx";
            string connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;";

            OleDbConnection excelCon = new OleDbConnection(connStr);
            excelCon.Open();

            using (excelCon)
            {
                InsertScore("Peshnqta", 11, excelCon);
                Console.WriteLine("Row inserted!");
            }
        }

        private static void InsertScore(string name, double score, OleDbConnection excelCon)
        {
            OleDbCommand insertEntry = new OleDbCommand(
                @"INSERT INTO [Sheet1$] (Name, Score) " + 
                    "VALUES " + 
                        "(@mame, @score)", excelCon);
            insertEntry.Parameters.AddWithValue("@name", name);
            insertEntry.Parameters.AddWithValue("@score", score);

            insertEntry.ExecuteNonQuery();
        }
    }
}
