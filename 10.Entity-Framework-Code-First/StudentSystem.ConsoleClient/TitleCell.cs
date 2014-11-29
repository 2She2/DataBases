using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentSystem.ConsoleClient
{
    public class TitleCell: PdfCell
    {
        public TitleCell(PdfPTable table, string data)
            : base(table, data, Color.WHITE, 0)
        {
        }
    }
}
