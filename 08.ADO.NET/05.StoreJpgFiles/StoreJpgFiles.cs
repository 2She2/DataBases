// 05.Write a program that retrieves the images for all categories in the Northwind database
//    and stores them as JPG files in the file system.

namespace _05.StoreJpgFiles
{
    using System;
    using System.IO;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Drawing.Imaging;

    using NorthwindDBConnection;

    class StoreJpgFiles
    {
        static void Main(string[] args)
        {
            int fileOffset = 78;
            // Pictures will be in the project folder
            string picturePath = "../../Picture";
            string pictureExtension = ".jpg";

            SqlConnection dbCon = NorthwindDBConnection.Connect();
            dbCon.Open();

            using (dbCon)
            {
                SqlCommand command = new SqlCommand(
                    "SELECT Picture, CategoryID " + 
                    "FROM Categories", dbCon);

                SqlDataReader reader = command.ExecuteReader();

                using (reader)
                {
                    while (reader.Read())
                    {
                        byte[] pictureBytes = (byte[])reader["Picture"];
                        int categoryID = (int)reader["CategoryID"];

                        MemoryStream stream = new MemoryStream(
                            pictureBytes, fileOffset,
                            pictureBytes.Length - fileOffset);

                        Image image = Image.FromStream(stream);

                        using (image)
                        {
                            image.Save(picturePath + categoryID + pictureExtension, ImageFormat.Jpeg);
                        }
                    }
                }
            }
        }
    }
}
