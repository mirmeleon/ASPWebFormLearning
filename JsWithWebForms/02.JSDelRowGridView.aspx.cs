using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsWithJs
{
    public partial class _02_JSDelRowGridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //proveriavame dali e header row
            if (e.Row.RowType == DataControlRowType.DataRow) {
                //zimame rowa i mu advame del a btn; namirame a link btn po id
              LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
                //izvlichane na idto s DataBinder.Eval ->1voto e containera, vtoroto e column name-a
                lb.Attributes.Add("onclick", "return confirm('are you sure to delete record with id = "+ DataBinder.Eval(e.Row.DataItem, "Id") + "')");

            }

        }
    }
}