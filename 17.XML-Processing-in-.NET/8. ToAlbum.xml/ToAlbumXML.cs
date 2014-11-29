//8. Write a program, which (using XmlReader and XmlWriter) reads the file catalog.xml 
//   and creates the file album.xml, in which stores in appropriate way the names of all 
//   albums and their authors.

using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;

class ToAlbumXML
{
    static void Main()
    {
        string fileName = "../../../8. album.xml";
        Encoding encoding = Encoding.GetEncoding("windows-1251");

        // reading the catalog
        using (XmlReader reader = XmlReader.Create("../../../1. Catalog.xml"))
        {
            using (XmlTextWriter writer = new XmlTextWriter(fileName, encoding))
            {
                writer.Formatting = Formatting.Indented;
                writer.IndentChar = '\t';
                writer.Indentation = 1;

                writer.WriteStartDocument();
                writer.WriteStartElement("AlbumsCatalogSimplified");
                writer.WriteAttributeString("name", "Albums catalog");

                while (reader.Read())
                {
                    
                    if ((reader.NodeType == XmlNodeType.Element))
                    {                        
                        if (reader.Name == "name")
                        {
                            writer.WriteStartElement("album"); // opening tag <album>
                            writer.WriteElementString("name", reader.ReadElementString()); //<name>...</name>                            
                        }
                        if (reader.Name == "artist")
                        {
                            writer.WriteElementString("artist", reader.ReadElementString()); //<artist>...</artist>
                            writer.WriteEndElement(); //closing tab </album>
                        }
                    }
                }
            }
        }  
        
        Console.WriteLine("album.xml created!");
    }
}