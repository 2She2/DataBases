using System;
using System.Xml.Xsl;

class XSLTransformDemo
{
    static void Main()
    {
        XslCompiledTransform xslt =
          new XslCompiledTransform();
        xslt.Load("../../../13. Catalog.xslt");
        xslt.Transform("../../../1. Catalog.xml", "../../../14. Catalog.html");
        Console.WriteLine("Successfully transformed!");
    }
}
