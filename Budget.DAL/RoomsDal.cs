using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Budget.MODEl;
using System.Collections;

namespace Budget.DAL
{
    public class RoomsDal
    {
        /// <summary>
        /// 获取此房屋的所有房间
        /// </summary>
        /// <param name="HouseID">房屋id</param>
        /// <returns>此房屋所有房间的数据表</returns>
        public static DataTable GetRooms(int HouseID)
        {
            string sql = string.Format("select * from [Room] where [HouseID]={0}", HouseID);
            return DBHelper.ExecuteDatatable(sql);
        }

        /// <summary>
        /// 添加一个房间
        /// </summary>
        /// <param name="r">房间实体</param>
        /// <returns></returns>
        public static int AddRoom(Room r)
        {
            string sql = string.Format(@"insert into [Room] ([HouseID]
      ,[RoomName]
      ,[Length]
      ,[Width]
      ,[DoorArea]
      ,[WindowArea]) values ({0},'{1}',{2},{3},{4},{5})", r.HouseID, r.RoomName, r.Length, r.Width, r.DoorArea, r.WindowArea);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 删除房间
        /// </summary>
        /// <param name="RoomID">房间id</param>
        /// <returns></returns>
        public static int DeleteRoom(int RoomID)
        {
            string sql = string.Format("delete from [Room] where [RoomID]={0}",RoomID);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 根据一个房间id返回此房屋id
        /// </summary>
        /// <param name="RoomID">房间id</param>
        /// <returns>房间id或者0 0表示查询失败</returns>
        public static int GetHouseIDByRoomID(int RoomID)
        {
            string sql = string.Format("select HouseID from Room where RoomID={0}",RoomID);
            object data=DBHelper.ExecuteScalar(sql);
            int result;
            if ( data== null)
                result = 0;
            else
                result = Convert.ToInt32(data);
            return result;

        }
        /// <summary>
        /// 根据roomid获取房间地面墙面面积
        /// </summary>
        /// <param name="RoomID">房间id</param>
        /// <returns>包含数据的哈希表</returns>
        public static Hashtable getAreaByRoomID(int RoomID) 
        {
            string sql = string.Format("select [WallArea],cast([Area] as numeric(10, 2)) from [Room] where [RoomID]={0}", RoomID);
            DataTable dt = DBHelper.ExecuteDatatable(sql);
            Hashtable ht = new Hashtable();
            ht["WallArea"] = dt.Rows[0][0].ToString();
            ht["Area"] = dt.Rows[0][1].ToString();
            return ht;

        }

        /// <summary>
        /// 获取房屋下所有房间的装修金额总计
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns></returns>
        public static double GetRoomsTotal(int HouseID)
        {
            string sql = string.Format("select sum([Total]) from [Room] where [HouseID]={0}", HouseID);
            double result = DBHelper.ExecuteScalar(sql) == DBNull.Value ? 0 : Convert.ToDouble(DBHelper.ExecuteScalar(sql));
            return result;
        }

    }
}
