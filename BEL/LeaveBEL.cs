using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDApplication.BEL
{
    public class LeaveBEL
    {
        public int id { set; get; }
        public string reason { set; get; }
        public string fromdate { set; get; }
        public string todate { set; get; }
        public string leavetype { set; get; }
        public int empid { set; get; }
    }
}