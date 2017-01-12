using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;


namespace Budget.WEB
{
    public partial class UserMain : System.Web.UI.Page
    {
        int UserID;
        DataTable HouseDT;
        protected void Page_Load(object sender, EventArgs e)
        {
            //未登录 则返回至主页 要求登录
            if (Session["userid"] == null)
            {
                Response.Redirect("index.html");
            }
            UserID = Convert.ToInt32(Session["userid"]);//用户id
            HouseDT = HouseBll.GetHouseInfoByUser(UserID);//此用户的所有房屋
        }

        //用户姓名
        public string ShowUserName()
        {
            return UserBll.GetUserInfoByID(UserID)["Name"].ToString();
        }


        //生成查看报表的链接
        public string Show()
        {
            string html = "";
            for (int i = 0; i < HouseDT.Rows.Count; i++)
            {
                html += string.Format("<a href='Report.aspx?HouseID={0}' target='_blank'> 我在{1}的房子，面积{2}</a>", HouseDT.Rows[i][0], HouseDT.Rows[i]["Name"], HouseDT.Rows[i]["Area"]);
                html += "<br/>";
            }
            return html;
        }


    }
}