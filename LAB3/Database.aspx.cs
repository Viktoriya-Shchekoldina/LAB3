using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LAB3
{
    public partial class Database : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add_customer(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "Insert" && Page.IsValid)
            {

                foreach (Parameter param in Заказчики.InsertParameters)
                {


                    TextBox textBox = AddCustomer.FindControl(param.Name) as TextBox;

                    Заказчики.InsertParameters[param.Name].DefaultValue = textBox.Text;
                }
                Заказчики.Insert();
            }

            Response.Redirect(Request.RawUrl);

        }




    }
}
