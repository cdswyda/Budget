using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Budget.MODEl;

namespace Budget.DAL
{
    public class HouseDal
    {
        /// <summary>
        /// 添加房间
        /// </summary>
        /// <param name="h">House实体</param>
        /// <returns></returns>
        public static int AddHouse(House h)
        {
            string sql = string.Format("insert into [House] ([Name],[Designer],[Owner],[Address],[Area],[height]) values ('{0}',{1},{2},'{3}',{4},{5})", h.Name, h.Designer, h.Owner, h.Address, h.Area, h.Height);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 根据设计师获取所有房屋
        /// </summary>
        /// <param name="designerID">设计师id</param>
        /// <returns>数据表</returns>
        public static DataTable GetHouseInfo(int designerID)
        {
            string sql = string.Format("select * from House where Designer={0} order by [HouseId] desc", designerID);
            return DBHelper.ExecuteDatatable(sql);
        }


        /// <summary>
        /// 根据用户获取所有房屋
        /// </summary>
        /// <param name="UserID">用户id</param>
        /// <returns>数据表</returns>
        public static DataTable GetHouseInfoByUser(int UserID)
        {
            string sql = string.Format("select * from House where [Owner]={0}", UserID);
            return DBHelper.ExecuteDatatable(sql);
        }


        /// <summary>
        /// 获取此房屋的信息
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns>数据</returns>
        public static DataTable GetHouseInfoByID(int HouseID)
        {
            string sql = string.Format("select * from [House] where [HouseID]={0}", HouseID);

            return DBHelper.ExecuteDatatable(sql);


        }
        /// <summary>
        /// 审核通过
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns></returns>
        public static int checkState(int HouseID)
        {
            string sql = string.Format("update [House] set [State]=1 where [HouseID]={0}",HouseID);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 删除房屋
        /// </summary>
        /// <param name="HouseID">房屋id</param>
        /// <returns></returns>
        public static int DeleteHouse(int HouseID)
        {
            string sql = string.Format("delete from [House] where [HouseID]={0}",HouseID);
            return DBHelper.ExecuteNonQuery(sql);
        }
    }
}
