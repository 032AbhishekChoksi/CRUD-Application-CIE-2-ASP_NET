using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDApplication.Employee
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["EMAIL"] != null && Session["NAME"] != null)
            {
                Session.Remove("EMAIL");
                Session.Remove("NAME");
            }
            Response.Redirect("login.aspx");
        }
    }
}