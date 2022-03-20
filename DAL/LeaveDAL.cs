using CRUDApplication.BEL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CRUDApplication.DAL
{
    public class LeaveDAL
    {
        private static readonly string MainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        
        private SqlConnection GetConnection()
        {
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(MainConnection);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            return con;
        }

        public Int32 ApplyLeave(LeaveBEL objleaveBEL)
        {
            int result = 0;
            SqlConnection con = GetConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("SP_Insert_Leave");
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Reason", objleaveBEL.reason);
                cmd.Parameters.AddWithValue("@FromDate", objleaveBEL.fromdate);
                cmd.Parameters.AddWithValue("@ToDate", objleaveBEL.todate);
                cmd.Parameters.AddWithValue("@LeaveType", objleaveBEL.leavetype);
                cmd.Parameters.AddWithValue("@EmpID", objleaveBEL.empid);
                con.Open();
                result = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.Dispose();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();
            }
            return result;
        }
    }
}