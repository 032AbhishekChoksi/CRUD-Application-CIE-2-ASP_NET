using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDApplication.Admin
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string Name = txtName.Text;
            string Password = txtPassword.Text;

            if (FormsAuthentication.Authenticate(Name, Password))
            {
                FormsAuthentication.RedirectFromLoginPage(Name, false);
            }
            else
            {
                lblMessage.Text = "Invalide User Name or Password";
            }
        }
    }
}