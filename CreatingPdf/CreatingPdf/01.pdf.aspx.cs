using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace CreatingPdf
{
    public partial class _01_pdf : System.Web.UI.Page
    {
        //sourceforge.net/projects/itextsharp ->extraktvame foldera i ot neia ni triabva samo 
      //  dll-core; sega triabva da se dobavi referencia kum tazi dll-ka vuv nashia proekt ot vs


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings[""].ConnectionString;


                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlDataAdapter da = new SqlDataAdapter("Select * from tblEmployee", con);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }
                
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //suzdavame pdf table, kato ia pravim s tolkova cols kolkoto cols ima grid viewto ni, ama zimame headera shtoto purvoachalno cols sa prazni
            
            PdfPTable pdfTable = new PdfPTable(GridView1.HeaderRow.Cells.Count);
            //zimame headera
            
                foreach (TableCell headerCell in GridView1.HeaderRow.Cells)
                {
                Font font = new Font();
                //zima cveta na gridViewto
                font.Color = new BaseColor(GridView1.HeaderStyle.ForeColor);


                    PdfPCell pdfCell = new PdfPCell(new Phrase(headerCell.Text, font));
                pdfCell.BackgroundColor = new BaseColor(GridView1.HeaderStyle.BackColor);
                pdfTable.AddCell(pdfCell);
                }
            

            //zimame redovete ot gridviewto ni
            foreach (GridViewRow row in GridView1.Rows)
            {
                foreach (TableCell tableCell in row.Cells)
                {
                    Font font = new Font();
                    //zima cveta na gridViewto
                    font.Color = new BaseColor(GridView1.RowStyle.ForeColor);
                                        //creatvame pdf cell sega i ia populatvame
                    PdfPCell pdfCell = new PdfPCell(new Phrase(tableCell.Text));
                    pdfCell.BackgroundColor = new BaseColor(GridView1.RowStyle.BackColor);
                    pdfTable.AddCell(pdfCell);
                }
            }

            Document pdfDocument = new Document(PageSize.A4, 10f,10f,10f,10f);
            //outputstreama ni pozvoliava da go downloadnem, a ako iskame da go zapishem v servera ni (v papka v sluchaia) 
            //polzvame filestream
            // PdfWriter.GetInstance(pdfDocument, Response.OutputStream);

            //zapazvane na servera, mappath ni pozvoliava da si opravim putia
            PdfWriter.GetInstance(pdfDocument, new FileStream(Server.MapPath("~/PdfDocs/Employees.pdf"), FileMode.Create));

            pdfDocument.Open();
            pdfDocument.Add(pdfTable);
            pdfDocument.Close();
            //specificirame content type-a v headera za da moje da se otvori pdfa
            //dolnite linii triabvat samo ako otvariame pdf-a, varianta s output stream
            //Response.ContentType = "application/pdf";
            //Response.AppendHeader("content-disposition", "attachment; filename=Employees.pdf");
            //Response.Write(pdfDocument);
            //Response.Flush();
            //Response.End();


        }
    }
}