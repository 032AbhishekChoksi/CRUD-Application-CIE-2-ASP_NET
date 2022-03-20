using CRUDApplication.BEL;
using CRUDApplication.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDApplication.Employee
{
    public partial class registration : System.Web.UI.Page
    {
        private EmployeeBL objemployeeBL;
        private EmployeeBEL objemployeeBEL;
        protected void Page_Init(object sender, EventArgs e)
        {
            objemployeeBL = new EmployeeBL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool isfileUpload = FUResume.HasFile;
            string Name = txtName.Text;
            string Email = txtEmailID.Text;
            string Password = txtPassword.Text;
            string HashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "SHA1");

           

            if(isfileUpload)
            {
                string fileextension = System.IO.Path.GetExtension(FUResume.FileName);
                if (fileextension.ToLower().Equals(".pdf"))
                {
                    double filesize = FUResume.PostedFile.ContentLength;
                    double filesizeInMB = Convert.ToDouble((filesize/1024)/1024);

                    if (filesizeInMB > 2)
                    {
                        lblMessage.Text = "File size is exceeded than 2 MB";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        FUResume.SaveAs(Server.MapPath("~/PDF/" + FUResume.FileName));

                        objemployeeBEL = new EmployeeBEL();
                        objemployeeBEL.name = Name;
                        objemployeeBEL.email = Email;
                        objemployeeBEL.password = HashPassword;
                        objemployeeBEL.resume = FUResume.FileName;

                        int retuncode = objemployeeBL.RegisterEmployee(objemployeeBEL);
                        if (retuncode == -1)
                        {
                            lblMessage.Text = "Already Email ID Register please try again!";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                        else
                        {
                            lblMessage.Text = "Register Succeessfully";
                            lblMessage.ForeColor = System.Drawing.Color.Green;
                            ClearControls();
                        }
                    }                    
                }
                else
                {
                    lblMessage.Text = "Invalid File Uplaod<br/><b>Only PDF File is Upload<b/>";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }                
            }
            else
            {
                lblMessage.Text = "Please choose the file first";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            
        }
        private void ClearControls()
        {
            txtName.Text = string.Empty;
            txtEmailID.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}