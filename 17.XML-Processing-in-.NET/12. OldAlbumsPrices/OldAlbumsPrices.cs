// 12. Write a program, which extract from the file catalog.xml the prices for all albums,
//     published 5 years ago or earlier.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;

class OldAlbumsPrices
{
    static void Main()
    {
        XDocument xmlDoc = XDocument.Load("../../../1. Catalog.xml");
        var oldAlbums =
            (from album in xmlDoc.Descendants("album")
             where int.Parse(album.Element("year").Value) < (DateTime.Now.Year-5)
             select album).ToList();

        foreach (var album in oldAlbums)
        {                        
            Console.WriteLine("{0} ${1}",album.Element("name").Value,album.Element("price").Value);
        }        
    }
}
