using CRUDApplication.BEL;
using CRUDApplication.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDApplication.BL
{
    public class LeaveBL
    {
        private LeaveDAL objleaveDAL;
        public LeaveBL()
        {
            objleaveDAL = new LeaveDAL();
        }
        public Int32 ApplyLeave(LeaveBEL objleaveBEL)
        {
            int result = 0;
            try
            {
                result = objleaveDAL.ApplyLeave(objleaveBEL);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
            return result;
        }
    }
}