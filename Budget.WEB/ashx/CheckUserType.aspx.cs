using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;
namespace Budget.WEB.ashx
{
    public partial class CheckUserType : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            int Type;
            if (Request["designer"] == null || Request["designer"].ToString() == "")
            {
                Response.Redirect("../index.html");
                Response.End();
            }
            //记录登录用户的类型
            Type = UserBll.GetUserType(Request["designer"].ToString());
            //保存登录信息
            Session["userid"] = UserBll.GetUserID(Request["designer"].ToString());
            Session["Type"] = Type;
            switch (Type)
            {
                case 0:
                    Response.Redirect("../DesignerMain.aspx");
                    break;
                case 1:
                    Response.Redirect("../UserMain.aspx");
                    break;
                case 2:
                    Response.Redirect("../Admin.aspx");
                    break;
                default:
                    Response.Redirect("../index.html");
                    break;
            }
        }
    }
}