using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;

namespace Budget.WEB.ashx
{
    public partial class CreateHouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //                "designer": designer,
            //"name": name,
            //"username": username,
            //"phone": phone,
            //"address": address,
            //"area": area,
            //"height": height
            string designerp = Request["designer"].ToString(),
                name = Request["name"].ToString(),
                username = Request["username"].ToString(),
                userPhone = Request["phone"].ToString(),
                address = Request["address"].ToString();

            double area = Convert.ToDouble(Request["area"]),
                height = Convert.ToDouble(Request["height"]);

            //存储这个业主 先判断是否存在
            if (UserBll.GetUserID(userPhone) == 0)
            {
                //不存在则创建
                UserBll.AddUser(userPhone, username);
            }
            
            //获取设计师id
            int designer = UserBll.GetUserID(designerp);
            //获取房子业主
            int owner = UserBll.GetUserID(userPhone);
            //新增房子
            Response.Write(HouseBll.AddHouse(name, designer, owner, address, area, height));
            
        }
    }
}