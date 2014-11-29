using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml.Schema;

class ValidateXMLandXSD
{
    static void Main()
    {
        XmlSchemaSet schemas = new XmlSchemaSet();        
        schemas.Add("", "../../16. Catalog.xsd");

        XDocument doc = XDocument.Load("../../../1. Catalog.xml"); // you can try to change the xml file to see the warnings
        string msg = "";
        doc.Validate(schemas, (o, e) =>
        {
            msg = e.Message;
        });
        Console.WriteLine(msg == "" ? "Document is valid" : "Document invalid: " + msg);
    }
}
