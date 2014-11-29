//2. Write program that extracts all different artists which are found in the
//   catalog.xml. For each artist you should print the number of albums in the
//   catalogue. Use the DOM parser and a hash-table.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml;

internal class ArtistInCatalog
{
    private static void Main()
    {
        XmlDocument doc = new XmlDocument();
        doc.Load("../../../1. Catalog.xml");
        XmlNode rootNode = doc.DocumentElement;
        Dictionary<string, int> artists = new Dictionary<string, int>(); // much easier than hashtable

        foreach (XmlNode node in rootNode.ChildNodes)
        {
            string currentArtist = node["artist"].InnerText;
            if (artists.Keys.Contains(currentArtist))
            {
                artists[currentArtist]++;
            }
            else
            {
                artists.Add(currentArtist, 1);
            }
        }

        foreach (var artist in artists)
        {
            Console.WriteLine("Artist: {0} - Albums: {1}", artist.Key, artist.Value);
        }
    }
}