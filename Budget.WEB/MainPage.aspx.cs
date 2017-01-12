using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;


namespace Budget.WEB
{
    public partial class MainPage : System.Web.UI.Page
    {
        int Type;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request["designer"]==null||Request["designer"].ToString()=="")
            {
                Response.Redirect("index.html");
            }
            if (!Page.IsPostBack)
            {
                //获取用户类型
                Type = UserBll.GetUserType(Request["designer"].ToString());

                
            
            }
        }





        /// <summary>
        /// 根据用户类型输出不同的内容
        /// </summary>
        /// <returns>调用不同的方法</returns>
        public string WritePage() 
        {
            if (Type == 0)
                return WriteDesigner();
            else
                return WriteUser();
        }
        /// <summary>
        /// 在页面上输出设计师的内容
        /// </summary>
        /// <returns>html代码</returns>
        private string WriteDesigner()
        { 
            string html="";



            return html;
        }

        /// <summary>
        /// 在页面上输出业主内容
        /// </summary>
        /// <returns></returns>

        private string WriteUser() 
        {
            return "业主";
        }
     
    }
}