//9. Write a program to traverse given directory and write to a XML file its contents 
//   together with all subdirectories and files. Use tags <file> and <dir> with appropriate 
//   attributes. For the generation of the XML document use the class XmlWriter.

using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Linq;

class DirectoryTreeToXML
{
    static void Main()
    {
        string rootPath = @"C:\Windows\Help\Windows";
        var dir = new DirectoryInfo(rootPath);

        var doc = new XDocument(GetDirectoryXml(dir));

        Console.WriteLine(doc.ToString()); // if you want to see it on the console

        doc.Save("../../../9. Directory.xml");
        Console.WriteLine("9. Directory.xml created!");
    }

    public static XElement GetDirectoryXml(DirectoryInfo dir)
    {
        var info = new XElement("dir",
                       new XAttribute("name", dir.Name));

        foreach (var file in dir.GetFiles())
        {
            info.Add(new XElement("file",
                         new XAttribute("name", file.Name)));
        }

        foreach (var subDir in dir.GetDirectories())
        {
            info.Add(GetDirectoryXml(subDir));
        }

        return info;
    }
}
