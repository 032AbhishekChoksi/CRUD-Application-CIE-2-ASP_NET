using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using CRUDApplication.BEL;
using System.Data;

namespace CRUDApplication.DAL
{
    public class EmployeeDAL
    {
        private static readonly string MainConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        private SqlConnection GetConnection()
        {
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(MainConnection);
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            return con;
        }

        public Int32 RegisterEmployee(EmployeeBEL objEmployee)
        {
            SqlConnection con = GetConnection();
            int result = -1;
            try
            {
                SqlCommand cmd = new SqlCommand("SP_Register_Employee");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@Name", objEmployee.name);
                cmd.Parameters.AddWithValue("@EmailID", objEmployee.email);
                cmd.Parameters.AddWithValue("@Password", objEmployee.password);
                cmd.Parameters.AddWithValue("@Resume", objEmployee.resume);
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

        public DataTable DisplayEmployeeByEmailIDAndPassword(EmployeeBEL objemployeeBEL)
        {

            DataTable dt = new DataTable();
            SqlConnection con = GetConnection();
            try
            {
                SqlCommand cmd = new SqlCommand("SP_Display_EmployeeByEmailIDAndPassword");
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@EmailID", objemployeeBEL.email);
                cmd.Parameters.AddWithValue("@Password", objemployeeBEL.password);

                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
                dataAdapter.Fill(dt);
                cmd.Dispose();
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            finally
            {
                con.Close();        
            }
            return dt;
        }
    }
}