using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Budget.DAL;
using System.Collections;

namespace Budget.BLL
{
    public class LoginBll
    {
        //登录
        public static int Login(string u, string p)
        {
            return LoginDal.login(u,p);
        }
    }
}
