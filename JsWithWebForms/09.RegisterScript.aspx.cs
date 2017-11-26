using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsWithJs
{
    public partial class _09_RegisterScript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //type ->tva nie textboxa i si go zimame chrez getType metoda (toy ni vrushat textbox class)
            //2ria param mu kazvame che e clientScript, a 3ia e samia script
           // ClientScript.RegisterStartupScript(TextBox1.GetType(), "clientScript",
             //   "document.getElementById('TextBox1').value = new Date();", true);

            //ClientScript.RegisterStartupScript(Label1.GetType(), "clientScript",
            //    "document.getElementById('Label1').innerHTML = new Date();", true);
            ClientScript.RegisterStartupScript(Label1.GetType(), "clientScript",
              "function getCharachterCount(){document.getElementById('Label1').innerHTML= " +
              " document.getElementById('TextBox1').value.length;}", true);
        }
    }
}