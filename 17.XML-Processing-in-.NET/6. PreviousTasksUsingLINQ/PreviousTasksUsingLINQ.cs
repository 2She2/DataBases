// 6. Rewrite the same using XDocument and LINQ query.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

class PreviousTasksUsingLINQ
{
    static void Main()
    {
        //1. creating the catalog
        Console.WriteLine("------Task 1------");
        CreateCatalog();  
        Console.WriteLine("------task 1 completed!------");
        
        //2. artists in the catalog
        Console.WriteLine("\n------Task 2------");
        ArtistsInCatalog();
        Console.WriteLine("------Task 2 completed!------");

        //3. the same as 2

        //4. delete in the albums that cost >20
        Console.WriteLine("\n------Task 4------");
        DeleteExpensiveAlbums(20);
        Console.WriteLine("------Task 4 completed!------");

        //5. find all songs
        Console.WriteLine("\n------Task 5------");
        AllSongsFromTheCatalog();
        Console.WriteLine("------Task 5 completed!------");
    }

    // for task 5
    private static void AllSongsFromTheCatalog()
    {
        XDocument xmlDoc = XDocument.Load("../../../6. CatalogByLINQ.xml");

        var allSongs =
            from songs in xmlDoc.Descendants("title")
            select songs.Value;

        foreach (var song in allSongs)
        {
            Console.WriteLine(song);
        }
    }

    // for task 4
    private static void DeleteExpensiveAlbums(decimal price)
    {
        XDocument xmlDoc = XDocument.Load("../../../6. CatalogByLINQ.xml");
        var expensiveAlbums =
            (from album in xmlDoc.Descendants("album")
            where decimal.Parse(album.Element("price").Value) > price
            select album).ToList();

        foreach (var album in expensiveAlbums)
        {
            album.Remove();
        }

        xmlDoc.Save("../../../6. NEWCatalogByLINQ.xml");
    }

    // for task 2
    private static void ArtistsInCatalog()
    {
        XDocument xmlDoc = XDocument.Load("../../../6. CatalogByLINQ.xml");
        var artists =
            from album in xmlDoc.Descendants("album")
            group album by album.Element("artist").Value into artis
            select new
            {
                Name = artis.Key,
                Count = artis.Count()
            };

        foreach (var artist in artists)
        {
            Console.WriteLine("Artist name:{0} has {1} albums", artist.Name, artist.Count);
        }
    }

    // for task 1
    private static void CreateCatalog()
    {
        XElement catalogXml = new XElement("catalog",
            new XElement("album",
                new XElement("name", "Album 1"),
                new XElement("artist", "Artist 1"),
                new XElement("year", "2000"),
                new XElement("producer", "Producer 1"),
                new XElement("price", "10"),
                new XElement("songs",
                    new XElement("song",
                        new XElement("title", "Song 1 in album 1"),
                        new XElement("duration", "11")
                                ),
                    new XElement("song",
                        new XElement("title", "Song 2 in album 1"),
                        new XElement("duration", "21")
                            )
                    )
                ),
                new XElement("album",
                new XElement("name", "Album 2"),
                new XElement("artist", "Artist 2"),
                new XElement("year", "2000"),
                new XElement("producer", "Producer 2"),
                new XElement("price", "20"),
                new XElement("songs",
                    new XElement("song",
                        new XElement("title", "Song 1 in album 2"),
                        new XElement("duration", "12")
                                ),
                    new XElement("song",
                        new XElement("title", "Song 2 in album 2"),
                        new XElement("duration", "22")
                            )
                    )
                ),
                new XElement("album",
                new XElement("name", "Album 3"),
                new XElement("artist", "Artist 1"),
                new XElement("year", "2001"),
                new XElement("producer", "Producer 3"),
                new XElement("price", "30"),
                new XElement("songs",
                    new XElement("song",
                        new XElement("title", "Song 1 in album 3"),
                        new XElement("duration", "13")
                                ),
                    new XElement("song",
                        new XElement("title", "Song 2 in album 3"),
                        new XElement("duration", "23")
                            )
                    )
                )
            );


        Console.WriteLine(catalogXml);

        catalogXml.Save("../../../6. CatalogByLINQ.xml");
    }
}
