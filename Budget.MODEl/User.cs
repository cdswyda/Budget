using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Budget.MODEl
{
    public  class User
    {
        string _phone;

        public string Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        int _type;

        public int Type
        {
            get { return _type; }
            set { _type = value; }
        }
        string _name;

        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
    }
}
