using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

class ArtistsUsingXPath
{
    static void Main()
    {
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.Load("../../../1. Catalog.xml");
        string xPathQuery = "/catalog/album";
        Dictionary<string, int> artists = new Dictionary<string, int>();

        XmlNodeList artistsList = xmlDoc.SelectNodes(xPathQuery);
        foreach (XmlNode artist in artistsList)
        {
            string currentArtist = artist.SelectSingleNode("artist").InnerText;
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
