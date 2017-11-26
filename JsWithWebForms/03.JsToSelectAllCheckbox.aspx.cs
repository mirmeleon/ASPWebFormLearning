using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace WebFormsWithJs
{
    public partial class _03_JsToSelectAllCheckbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        private void Delete(string ids)
        {
            //pasvame idtata na employetata det shte triem
            string cs = ConfigurationManager.ConnectionStrings["sampleDbConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            //podavame mu stored procedurata s ime spDeleteEmployes
            SqlCommand cmd = new SqlCommand("spDeleteEmployees", con);
            //kazvame mu che e stored procedure
            cmd.CommandType = CommandType.StoredProcedure;
            //podavame id-tata na stornatata procedura; @Ids mi e promenlivata v stornata procedur
            SqlParameter parameter = new SqlParameter("@Ids", ids);
            cmd.Parameters.Add(parameter);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void lbDeleteSelected_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            //foreachvame po redovete na gridViewto kat go zimame po id GridView1
            foreach (GridViewRow gr in GridView1.Rows)
            {
                //zimame samo checkbox det sa cheknati
                CheckBox cb = (CheckBox)gr.FindControl("CheckBox1");
                if(cb.Checked)
                {
                    //zimame idtata ot vseki row; prevurna si idcolonata na template kolona, 
                    //lavel1 e idto na template controlera det otgovaria za idta
                    //find control go vrushta kat generic kontrol i za tuy go kastvame da si bude label
                    sb.Append(((Label)gr.FindControl("Label1")).Text + ",");
                }
            }

            //premahvame poslednata , che e izlishna ot sb
            sb.Remove(sb.ToString().LastIndexOf(","), 1);
            Delete(sb.ToString());
            GridView1.DataBind();
        }
    }
}