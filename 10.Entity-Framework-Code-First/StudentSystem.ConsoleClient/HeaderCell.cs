using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentSystem.ConsoleClient
{
    public class HeaderCell : PdfCell
    {
        public HeaderCell(PdfPTable table, string data)
            : base(table, data, Color.LIGHT_GRAY, 0)
        {
        }
    }
}
