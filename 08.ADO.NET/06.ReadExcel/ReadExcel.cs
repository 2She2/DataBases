// 06.Create an Excel file with 2 columns: name and score:
//    Write a program that reads your MS Excel file through the OLE DB data provider and
//    displays the name and score row by row.

namespace _06.ReadExcel
{
    using System;
    using System.Data.OleDb;

    class ReadExcel
    {
        static void Main(string[] args)
        {
            string path = @"../../../Chart.xlsx";

            //// First way with "Jet.OLEDB"
            //OleDbConnection excelCon = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='../../Chart.xlsx';Extended Properties= \"Excel 8.0;HDR=Yes;IMEX=1\";");

            // Second way with "ACE.OLEDB"
            string connectionStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=Excel 12.0;";

            OleDbConnection excelCon = new OleDbConnection(connectionStr);
            excelCon.Open();

            using (excelCon)
            {
                OleDbCommand command = new OleDbCommand(@"SELECT * FROM [Sheet1$]", excelCon);
                OleDbDataReader reader = command.ExecuteReader();

                using (reader)
                {
                    Console.WriteLine("Performers :");

                    while (reader.Read())
                    {
                        string performerName = (string)reader["Name"];
                        double performerScore = (double)reader["Score"];

                        Console.WriteLine("Name: {0} | Score: {1}", performerName.PadRight(5), performerScore);
                    }
                }
            }
        }
    }
}
