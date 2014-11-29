using iTextSharp.text;
using iTextSharp.text.pdf;
using StudentSystem.Data;
using StudentSystem.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace StudentSystem.ConsoleClient
{
    class PdfRow
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Age { get; set; }
        public string Number { get; set; }
    }

    public class GeneratePDF
    {
        public GeneratePDF()
        {
        }

        static List<IGrouping<int, PdfRow>> GetSalesByDate()
        {
            StudentSystemData db = new StudentSystemData();

            List<IGrouping<int, PdfRow>> collection;
            collection = db.Students.All().Select(x => new PdfRow
                {
                    FirstName = x.FirstName,
                    LastName = x.LastName,
                    Age = x.Age,
                    Number = x.Number
                })
                .GroupBy(x => x.Age)
                .ToList();

            return collection;
        }

        public static void SalesReport(string pdfFile)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.InvariantCulture;
            var collection = GetSalesByDate();
            decimal grandTotal = 0;
            Document document = new Document();
            PdfWriter writer = PdfWriter.GetInstance(document,
                               new FileStream(pdfFile, FileMode.Create));
            document.Open();

            PdfPTable table = new PdfPTable(4);
            new TitleCell(table, "Person Age reporst");
            CreateTitle(table, "Person Age reporst");

            foreach (var rows in collection)
            {
                CreaterHeaderRow(table, "First Name", "last Name", "Age", "Number");

                foreach (var row in rows)
                {
                    CreateCellRow(table, row.FirstName, row.FirstName, row.Age.ToString(), row.Number);
                }

                var totalSum = rows.Sum(x => x.Age);
                grandTotal += totalSum;
                CreateSummary(table, string.Format("Total Age: {0}", totalSum.ToString()));
            }

            PdfPTable grandSumTable = new PdfPTable(5);
            CreateTitle(table, string.Format("Grand Total:  {0}", grandTotal.ToString()));
            document.Add(table);
            document.Close();
        }

        private static void CreateDataCell(PdfPTable table, string name)
        {
            Font font = FontFactory.GetFont(BaseFont.COURIER_BOLD);
            CreateCell(table, name, Color.WHITE, font, 0, false);
        }
        private static void CreateSummary(PdfPTable table, string summary)
        {
            Font font = FontFactory.GetFont(BaseFont.COURIER_BOLD);
            CreateCell(table, summary, Color.WHITE, font, 4, false);
        }

        private static void CreateHeaderCell(PdfPTable table, string name)
        {
            Font font = FontFactory.GetFont(BaseFont.COURIER_BOLD);
            CreateCell(table, name, Color.LIGHT_GRAY, font, 0, false);
        }

        private static void CreateTitle(PdfPTable table, string title)
        {
            Font font = FontFactory.GetFont(BaseFont.COURIER_BOLD);
            CreateCell(table, title, Color.WHITE, font, 4, true);
        }

        private static void CreaterHeaderRow(PdfPTable table, params string[] columnNames)
        {
            foreach (var name in columnNames)
            {
                CreateHeaderCell(table, name);
            }
        }

        private static void CreateCellRow(PdfPTable table, params string[] columnNames)
        {
            foreach (var name in columnNames)
            {
                CreateDataCell(table, name);
            }
        }

        private static void SetAllBorders(Cell cell)
        {
            cell.Border = PdfCell.BOTTOM_BORDER | PdfCell.LEFT_BORDER | PdfCell.RIGHT_BORDER | PdfCell.TOP_BORDER;
        }

        private static void CreateCell(PdfPTable table, string name, Color color, Font font, int columnSpan, bool isAlignCenter)
        {
            Cell cell = new Cell();
            Phrase phrase = new Phrase();

            phrase.Add(new Chunk(name, font));

            cell.AddElement(phrase);
            SetAllBorders(cell);

            cell.BackgroundColor = color;
            cell.Colspan = columnSpan;

            if (isAlignCenter)
            {
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
            }

            table.AddCell(cell.CreatePdfPCell());
        }
    }
}
