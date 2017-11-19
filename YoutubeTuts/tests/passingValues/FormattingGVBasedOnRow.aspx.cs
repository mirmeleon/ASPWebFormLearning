using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace passingValues
{
    public partial class FormattingGVBasedOnRow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //ako e header ili suotvetno footer ako imame
            if(e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Visible = false;
            }
            else if(e.Row.RowType == DataControlRowType.DataRow)
            {
                //zimame kolonkata koiato iskame 
                string name = (e.Row.Cells[1].Text);
                string country = e.Row.Cells[3].Text; //zimam 3tata kolonka v koiato ima bulgaria/usa i tn
                e.Row.Cells[1].Text = name +" from "+ country;
                //setvam dinamichno visibility na idto na false; po-dobre taka da se setva ako shte go polzvame v koda
                //ako niama da ni triabva v koda mojem da go setnem na falise i v samia grid view kat atribut
                e.Row.Cells[0].Visible = false; 

            }
        }
    }
}