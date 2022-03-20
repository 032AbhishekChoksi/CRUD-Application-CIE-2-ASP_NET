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
            if(Session["EMPID"] != null && Session["NAME"] != null)
            {
                Session.Remove("EMPID");
                Session.Remove("NAME");
            }
            Response.Redirect("login.aspx");
        }
    }
}