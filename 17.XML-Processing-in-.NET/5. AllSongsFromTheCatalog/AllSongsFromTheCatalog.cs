//5. Write a program, which using XmlReader extracts all song titles from catalog.xml.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

class AllSongsFromTheCatalog
{
    static void Main()
    {
        Console.WriteLine("Songs in the catalog:");
        using (XmlReader reader = XmlReader.Create("../../../1. Catalog.xml"))
        {
            while (reader.Read())
            {
                                
                if ((reader.NodeType == XmlNodeType.Element) &&
                    (reader.Name == "title"))
                {
                    Console.WriteLine(reader.ReadElementString());
                }
            }
        }        
    }
}
