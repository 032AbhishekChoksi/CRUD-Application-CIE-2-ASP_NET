using CRUDApplication.BEL;
using CRUDApplication.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CRUDApplication.BL
{
    public class EmployeeBL
    {
        private EmployeeDAL objemployeeDAL;
        public EmployeeBL()
        {
            objemployeeDAL = new EmployeeDAL();
        }
        public Int32 RegisterEmployee(EmployeeBEL objEmployee)
        {
            int result = -1;
            try
            {
                result =  objemployeeDAL.RegisterEmployee(objEmployee);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            return result;
        }
        public DataTable DisplayEmployeeByEmailIDAndPassword(EmployeeBEL objemployeeBEL)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = objemployeeDAL.DisplayEmployeeByEmailIDAndPassword(objemployeeBEL);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            return dt;
        }
    }
}