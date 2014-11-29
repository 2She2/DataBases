//7. In a text file we are given the name, address and phone number of given 
//   person (each at a single line). Write a program, which creates new XML
//   document, which contains these data in structured XML format.

using System;
using System.Collections.Generic;
using System.IO;
using System.Xml.Linq;

class TxtToXML
{
    static void Main()
    {
        // reading the text file
        string filePath = "../../../7. PersonInfo.txt";
        List<string> personInfo = new List<string>();

        using (StreamReader reader = new StreamReader(filePath))
        {            
            string line;
            while ((line = reader.ReadLine()) != null)
            {
                personInfo.Add(line);
            }
        }

        // creating the catalog
        XElement catalogXml = new XElement("catalog",
            new XElement("person",
                new XElement("name", personInfo[0]),
                new XElement("address", personInfo[1]),
                new XElement("phoneNumber", personInfo[2])                
                    )                
            );

        catalogXml.Save("../../../7. Person.xml");
        Console.WriteLine("Person.xml created!");
    }
}
