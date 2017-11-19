using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace passingValues
{
    public partial class EmployeesFiltering : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //tuy minava i prez table headera za tuy triabva da proverim dali row-a ne e theader; 
            //v sluchaia proveriavame obratnto dali e obiknoven row
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                //tursim stoynostta na 4tata kolonka (broeneto pochva ot 0)
                if(e.Row.Cells[3].Text == "Bulgaria")
                {
                    int salary = Convert.ToInt32(e.Row.Cells[2].Text); //zimame 2rata colona, koiato  mi e salaryto
                    string formattedStr = string.Format(new System.Globalization.CultureInfo("bg-BG"), "{0:c}", salary);
                    e.Row.Cells[2].Text = formattedStr;

                } else
                {
                    //usa
                    int salary = Convert.ToInt32(e.Row.Cells[2].Text); //zimame 2rata colona, koiato  mi e salaryto
                    string formattedStr = string.Format(new System.Globalization.CultureInfo("en-US"), "{0:c}", salary);
                    e.Row.Cells[2].Text = formattedStr;
                }
            }
        }
    }
}