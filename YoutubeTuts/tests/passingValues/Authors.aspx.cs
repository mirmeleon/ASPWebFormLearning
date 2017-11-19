using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace passingValues
{
    public partial class Authors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //taka se zima datata ako ne polzvame data controler kata sqldataSource
            string cs = ConfigurationManager.ConnectionStrings["BookShopSystemConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("Select * from Authors", con);
                con.Open();
               // grAuthors.DataSource = cmd.ExecuteReader();
              //  grAuthors.DataBind();

            }
        }
    }
}