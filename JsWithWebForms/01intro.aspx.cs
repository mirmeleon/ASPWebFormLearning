using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsWithJs
{
    public partial class _01intro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //code behind we can do like this; tia sa client side eventi;
            ImageButton1.Attributes.Add("onMouseOver", "this.src='http://www.clker.com/cliparts/T/R/T/d/j/C/small-button-pressed-md.png'");
            ImageButton1.Attributes.Add("onmouseout", "this.src='http://cliparts101.com/files/61/39C5F4544A4688F9DD098402AB3EC1E3/Small_Red_Button2.png'");
           //ako ne se polzva v html-a da go uncommenta; tozi primer e za code behind; imam go sushtoto v htmla
            // ImageButton1.Attributes.Add("onclick", "return confirm('are u shure?')");
        }

        //a server side eventi
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Write("Server side click!");
        }
    }
}