using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ComputerOrderForm.Models;

namespace ComputerOrderForm
{
    public partial class ComputerOrderForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            var order = new ComputerOrder();
            order.OrderId = 101; //zima se ot dbto
            order.OrderName = OrderNameId.Text; //inputa ot formata go vruzvame za klasa
            order.Customer = Customer.Text;
            order.CustomerEmail = CustomerEmail.Text;
            order.DeliveryDate = DeliveryDate.SelectedDate;
            order.PartNumber = int.Parse(PartNumber.Text);
            order.Rush = RushYes.Checked; //ako e cheknato na formata shte go chekne na true inache na false
            Session["CurrentOrder"] = order; //setvame sesiata da e ravna na obekta ni
        }
    }
}