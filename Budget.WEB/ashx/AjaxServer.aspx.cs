using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Budget.BLL;
using System.Collections;


namespace Budget.WEB
{
    public partial class AjaxServer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String methodName = Request["method"];
            Type type = this.GetType();
            MethodInfo method = type.GetMethod(methodName);
            if (method == null) throw new Exception("method is null");
            try
            {
                //根据参数调用函数
                method.Invoke(this, null);
            }
            catch (Exception ex)
            {
                Hashtable result = new Hashtable();
                result["error"] = -1;
                result["message"] = ex.Message;
                result["stackTrace"] = ex.StackTrace;
                String json = JSON.Encode(result);
                Response.Clear();
                Response.Write(json);
            }
        }
        //根据房间id获取所有项目
        public void GetItemsByRoomID()
        {
            int RoomID = Convert.ToInt32(Request["key"]);
            //分页
            int pageIndex = Convert.ToInt32(Request["pageIndex"]);
            int pageSize = Convert.ToInt32(Request["pageSize"]);
            //字段排序
            String sortField = Request["sortField"];
            String sortOrder = Request["sortOrder"];

            //业务层：数据库操作
            string result = ItemsBll.GetItemsByRoomID(RoomID, pageIndex, pageSize, sortField, sortOrder);


            Response.Write(result);
        }

        //
        public void GetItemsByHouseID()
        {
            int HouseID  = Convert.ToInt32(Request["key"]);
            //分页
            int pageIndex = Convert.ToInt32(Request["pageIndex"]);
            int pageSize = Convert.ToInt32(Request["pageSize"]);
            //字段排序
            String sortField = Request["sortField"];
            String sortOrder = Request["sortOrder"];

            //业务层：数据库操作
            string result = ItemsBll.GetItems1ByHouseID(HouseID, pageIndex, pageSize, sortField, sortOrder);


            Response.Write(result);
        }
        //获取此房间的地面墙面面积
        public void getAreaByRoomID()
        {
            int RoomID = Convert.ToInt32(Request["RoomID"]);
            Response.Write(RoomsBll.getAreaByRoomID(RoomID)); 
        }

        //获取此房间所在房屋下的所有房间
        public void GetRoomsByRoomID()
        {
            int RoomID = Convert.ToInt32(Request["RoomID"]);
            Response.Write(RoomsBll.GetRoomsByRoomID(RoomID));
        }

        //保存item
        public void SaveItems()
        {
            //获取数据
            String json = Request["data"];
            //解码
            ArrayList rows = (ArrayList)JSON.Decode(json);
            foreach (Hashtable row in rows)
            {
                String id = row["RoomID"] != null ? row["RoomID"].ToString() : "";
                //根据记录状态，进行不同的增加、删除、修改操作
                String state = row["_state"] != null ? row["_state"].ToString() : "";

                if (state == "added" || id == "")           //新增：id为空，或_state为added
                {
                    ItemsBll.AddItem(row);
                }
                else if (state == "removed" || state == "deleted")//删除
                {
                    ItemsBll.DeleteItem(row);
                }
                else if (state == "modified" || state == "") //更新：_state为空或modified
                {
                    ItemsBll.UpdateItem(row);
                }
            }
        }

        //保存specialitem
        public void SaveItems1()
        {
            //获取数据
            String json = Request["data"];
            //解码
            ArrayList rows = (ArrayList)JSON.Decode(json);
            foreach (Hashtable row in rows)
            {
                String id = row["HouseID"] != null ? row["HouseID"].ToString() : "";
                //根据记录状态，进行不同的增加、删除、修改操作
                String state = row["_state"] != null ? row["_state"].ToString() : "";

                if (state == "added" || id == "")           //新增：id为空，或_state为added
                {
                    ItemsBll.AddItem1(row);
                }
                else if (state == "removed" || state == "deleted")//删除
                {
                    ItemsBll.DeleteItem1(row);
                }
                else if (state == "modified" || state == "") //更新：_state为空或modified
                {
                    ItemsBll.UpdateItem1(row);
                }
            }
        }

    }
}