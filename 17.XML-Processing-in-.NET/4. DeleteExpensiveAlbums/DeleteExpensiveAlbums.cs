//4. Using the DOM parser write a program to delete from catalog.xml all albums having price > 20.


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Collections;

class DeleteExpensiveAlbum
{
    static void Main()
    {
        XmlDocument doc = new XmlDocument();
        doc.Load("../../../1. Catalog.xml");
        XmlNode rootNode = doc.DocumentElement;        

        foreach (XmlNode node in rootNode.ChildNodes)
        {
            double currentPrice = double.Parse(node["price"].InnerText.Trim());
            if (currentPrice>20)
            {
                rootNode.RemoveChild(node);
            }
        }

        doc.Save("../../../4. newCatalog.xml");
    }
}
