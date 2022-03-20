using CRUDApplication.BEL;
using CRUDApplication.BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUDApplication.Employee
{
    public partial class index : System.Web.UI.Page
    {
        private LeaveBL objleaveBL;
        private LeaveBEL objleaveBEL;
        protected void Page_Init(object sender, EventArgs e)
        {
            objleaveBL = new LeaveBL();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EMPID"] != null && Session["NAME"] != null)
            {
                lblMessage.Text = "Welcome " + Session["NAME"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            txtFromDate.Attributes.Add("min", DateTime.Now.Date.ToString("yyyy-MM-dd"));
            txtToDate.Attributes.Add("min", DateTime.Now.Date.ToString("yyyyy-MM-dd"));

            txtFromDate.Attributes.Add("max", DateTime.Now.Date.AddMonths(9).ToString("yyyy-MM-dd"));
            txtToDate.Attributes.Add("max", DateTime.Now.Date.AddMonths(9).ToString("yyyyy-MM-dd"));
        }

        protected void btnApplyLeave_Click(object sender, EventArgs e)
        {
            string Reason = txtReason.Text;
            DateTime FromDate = Convert.ToDateTime(txtFromDate.Text);
            DateTime ToDate = Convert.ToDateTime(txtToDate.Text);
            string LeaveType = RBLLeaveType.SelectedItem.Value.ToString();
            
            /*
            int Totaldays = 0;
            if (FromDate < ToDate)
            {
                TimeSpan t = Convert.ToDateTime(txtToDate.Text) - Convert.ToDateTime(txtFromDate.Text);
                
                Totaldays = Convert.ToInt32(t.TotalDays);
            }

            if(Totaldays > 15)
            {

            }
            */

            objleaveBEL = new LeaveBEL();
            objleaveBEL.reason = Reason;
            objleaveBEL.fromdate = FromDate.ToString("yyyy/MM/dd");
            objleaveBEL.todate = ToDate.ToString("yyyy/MM/dd");
            objleaveBEL.leavetype = LeaveType;
            objleaveBEL.empid = Convert.ToInt32(Session["EMPID"]);

            int LastInsertedID = objleaveBL.ApplyLeave(objleaveBEL);
            if(LastInsertedID > 0)
            {
                Response.Write("Leave Apply Successfully<br/><b> Refrence ID: " + LastInsertedID.ToString() + "</b>");
            }
            else
            {
                Response.Write("Not Apply Leave<br/>Try Again!");
            }
        }
    }
}