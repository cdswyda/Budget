using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Budget.DAL;
using Budget.MODEl;
using System.Collections;

namespace Budget.BLL
{
    public class RoomsBll
    {
        /// <summary>
        /// 获取此房屋的所有房间
        /// </summary>
        /// <param name="HouseID">房屋id</param>
        /// <returns>此房屋所有房间的数据表</returns>
        public static DataTable GetRooms(int HouseID)
        {
            return RoomsDal.GetRooms(HouseID);
        }
        /// <summary>
        /// 添加一个房间
        /// </summary>
        /// <param name="houseID">所属房屋id</param>
        /// <param name="roomName">房间名</param>
        /// <param name="length">长</param>
        /// <param name="width">宽</param>
        /// <param name="doorArea">门面积</param>
        /// <param name="windowArea">窗面积</param>
        /// <returns>新增结果0或者2</returns>
        public static int AddRoom(int houseID, string roomName, double length, double width, double doorArea, double windowArea)
        {
            //若必须参数有空，直接返回失败
            if (houseID == 0 || roomName == null || roomName == "" || length == 0 || width == 0)
                return 0;
            //数据存入实体
            Room r = new Room();
            r.HouseID = houseID;
            r.RoomName = roomName;
            r.Length = length;
            r.Width = width;
            r.DoorArea = doorArea;
            r.WindowArea = windowArea;
            //调用
            return RoomsDal.AddRoom(r);
        }

        /// <summary>
        /// 删除房间
        /// </summary>
        /// <param name="RoomID">房间id</param>
        /// <returns></returns>
        public static int DeleteRoom(int RoomID)
        {            
            return RoomsDal.DeleteRoom(RoomID);
        }

        public static string GetRoomsByRoomID(int RoomID)
        {
            //获取到此房间的房屋id
            int HouseID = RoomsDal.GetHouseIDByRoomID(RoomID);
            //查询此房屋下的所有房间
            DataTable dt = RoomsDal.GetRooms(HouseID);
            //放到数组中
            ArrayList al = new ArrayList();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Hashtable hs = new Hashtable();
                hs["id"] = dt.Rows[i][0].ToString(); 
                hs["text"] = dt.Rows[i][2].ToString();
                al.Add(hs);
            }
           //json序列化
            return JSON.Encode(al);
        }
        /// <summary>
        /// 根据roomid获取房间地面墙面面积
        /// </summary>
        /// <param name="RoomID">房间id</param>
        /// <returns>序列后的json字符串</returns>
        public static string getAreaByRoomID(int RoomID) 
        {
            Hashtable ht = RoomsDal.getAreaByRoomID(RoomID);
            return JSON.Encode(ht);
        }


    }
}
