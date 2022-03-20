using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CRUDApplication.BEL
{
    public class EmployeeBEL
    {
        public int id { set; get; }
        public string name { set; get; }
        public string email { set; get; }
        public string password { set; get; }
        public string resume { set; get; }
    }
}