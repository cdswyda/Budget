using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;
using System.Data;

namespace Budget.WEB
{
    public partial class DesignerMain : System.Web.UI.Page
    {
        int designerID;
        protected void Page_Load(object sender, EventArgs e)
        {
            //未登录 则返回至主页 要求登录
            if (Session["userid"] == null)
            {
                Response.Redirect("index.html");
            }

            //记录设计师id
            designerID = Convert.ToInt32(Session["userid"]);
            //调用显示房屋repeat
            BindHouseInfo(designerID);
            //调用显示留言
            BindMessageInfo(designerID);
        }

        //给创建房屋的页面绑定设计师电话
        public string getDesignerPhone()
        {
            return UserBll.GetUserInfoByID(designerID)["Phone"].ToString();
        }


        //根据手机号获取设计师id
        private int GetID(string p)
        {
            return UserBll.GetUserID(p);
        }
        //给House绑定数据
        private void BindHouseInfo(int designerID)
        {
            HouseRepeater.DataSource = HouseBll.GetHouseInfo(designerID);
            HouseRepeater.DataBind();
        }
        //绑定留言
        private void BindMessageInfo(int designerID)
        {
            DataTable dt = MessageBll.GetMessageByDesigner(designerID);
            MessageRepeater.DataSource = dt;
            MessageRepeater.DataBind();
        }


        //显示用户姓名
        public string ShowUserName()
        {
            return UserBll.GetUserName(designerID);
        }
        public string ShowUserName(string id)
        {
            return UserBll.GetUserName(Convert.ToInt32(id));
        }
        //外层Repeat控件的item项创建事件
        protected void HouseRepeater_ItemCreated(object sender, RepeaterItemEventArgs e)
        {

            Repeater RoomRepeater = e.Item.FindControl("RoomRepeater") as Repeater;
            if(RoomRepeater!=null)
            {
                //获取到此房屋的id
                int houseID = Convert.ToInt32(((DataRowView)e.Item.DataItem).Row.ItemArray[0]);
                //获取此房屋的所有房间
                DataTable rooms = RoomsBll.GetRooms(houseID);
                //设置数据源及绑定
                RoomRepeater.DataSource = rooms;
                RoomRepeater.DataBind();
            }

            
        }






    }
}