using iTextSharp.text.pdf;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentSystem.ConsoleClient
{
    public class TableCells
    {
        private PdfPTable table;

        public TableCells(PdfPTable table)
        {
            this.table = table;
        }

        public void DataCell(string data)
        {
            var dataCell = new DataCell(this.table, data);
        }

        public void SummaryCell(string data)
        {
            var summaryCell = new SummaryCell(this.table, data);
        }

        public void HeaderCell(string data)
        {
            var summaryCell = new HeaderCell(this.table, data);
        }

        public void TitleCell(string data)
        {
            var summaryCell = new TitleCell(this.table, data);
        }
    }
}
