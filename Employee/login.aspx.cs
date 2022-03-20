using CRUDApplication.BEL;
using CRUDApplication.BL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDApplication.Employee
{
    public partial class login : System.Web.UI.Page
    {
        private EmployeeBEL objemployeeBEL;
        private EmployeeBL objemployeeBL;
        protected void Page_Init(object sender, EventArgs e)
        {
            objemployeeBL = new EmployeeBL();            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            { 
                HttpCookie userInfo = Request.Cookies["userInfo"];
                if (userInfo != null)
                {
                    txtEmailID.Text = userInfo["EMAILID"].ToString();
                    txtPassword.Text = userInfo["PASSWORD"].ToString();
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string EmailID = txtEmailID.Text;
            string Password = txtPassword.Text;
            bool isChecked  = chkRememberMe.Checked;
            string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "SHA1");

            objemployeeBEL = new EmployeeBEL();
            objemployeeBEL.email = EmailID;
            objemployeeBEL.password = HashPassword;

            DataTable dt = objemployeeBL.DisplayEmployeeByEmailIDAndPassword(objemployeeBEL);

            string dbemail = string.Empty;
            string dbname = string.Empty;
            if(dt != null)
            {
                if(dt.Rows.Count > 0)
                { 
                    foreach(DataRow dr in dt.Rows)
                    {
                        dbemail = dr["email"].ToString();
                        dbname = dr["name"].ToString();
                    }
                    if (isChecked)
                    {
                        HttpCookie userInfo = new HttpCookie("userInfo");
                        userInfo["EMAILID"] = EmailID;
                        userInfo["PASSWORD"] = Password;
                        userInfo.Expires = DateTime.Now.AddDays(1);
                        Response.Cookies.Add(userInfo);
                    }
                    else
                    {
                        HttpCookie userInfo = Request.Cookies["userInfo"];
                        if (userInfo != null)
                        {
                            userInfo.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(userInfo);
                        }
                    }
                    Session["EMAIL"] = dbemail;
                    Session["NAME"] = dbname;
                    Response.Redirect("index.aspx");
                }
                else
                {
                    lblMessage.Text =  "Invalid Email ID OR Password";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    ClearControls();
                }
            }
            else
            {
                lblMessage.Text = "Invalid Email ID OR Password";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                ClearControls();
            }
            
        }
        private void ClearControls()
        {
            txtEmailID.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}