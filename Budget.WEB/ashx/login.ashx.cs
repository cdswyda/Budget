using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Budget.BLL;

namespace Budget.WEB.ashx
{
    /// <summary>
    /// login 的摘要说明
    /// </summary>
    public class login : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            context.Response.ContentType = "text/plain";

            string username = context.Request["username"];
            string password = context.Request["password"];

            context.Response.Write(LoginBll.Login(username, password));

            if (LoginBll.Login(username, password) == 1)
            {
                context.Response.Redirect("CheckUserType.aspx?designer=" + username);
            }
            else
            {
                //context.Response.Write("<script>if(confirm('登录失败！请重试！')){window.open('../index.html','_self')}</script>");
                context.Response.Redirect("../index.html");

            }
            

            //context.Response.Write("Hello World");
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}