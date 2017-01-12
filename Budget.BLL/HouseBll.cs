using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Budget.MODEl;
using Budget.DAL;
using System.Data;

namespace Budget.BLL
{
    public class HouseBll
    {
        /// <summary>
        /// 新增一个房屋
        /// </summary>
        /// <param name="name">小区名</param>
        /// <param name="designer">设计师id</param>
        /// <param name="owner">业主id</param>
        /// <param name="address">地址</param>
        /// <param name="area">面积</param>
        /// <param name="height">高度</param>
        /// <returns></returns>
        public static int AddHouse(string name, int designer, int owner, string address, double area, double height)
        {
            House h = new House();
            h.Name = name;
            h.Designer = designer;
            h.Owner = owner;
            h.Address = address;
            h.Area = area;
            h.Height = height;
            return HouseDal.AddHouse(h);
        }

        /// <summary>
        /// 根据设计师获取所有房屋
        /// </summary>
        /// <param name="designerID">设计师id</param>
        /// <returns>数据表</returns>
        public static DataTable GetHouseInfo(int designerID)
        {
            return HouseDal.GetHouseInfo(designerID);
        }
        /// <summary>
        /// 根据用户获取所有房屋
        /// </summary>
        /// <param name="UserID">用户id</param>
        /// <returns></returns>
        public static DataTable GetHouseInfoByUser(int UserID)
        {
            return HouseDal.GetHouseInfoByUser(UserID);
        }


        /// <summary>
        /// 此房屋的装修金额合计
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns></returns>
        public static double GetTotal(int HouseID)
        {
            return RoomsDal.GetRoomsTotal(HouseID) + ItemsDal.GetSItemTotal(HouseID);
        }
        /// <summary>
        /// 获取此房屋的信息
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns>数据</returns>
        public static DataTable GetHouseInfoByID(int HouseID)
        {
            return HouseDal.GetHouseInfoByID(HouseID);
        }

        /// <summary>
        /// 设置审核通过
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns></returns>
        public static int checkState(int HouseID)
        {
            return HouseDal.checkState(HouseID);
        }
        /// <summary>
        /// 删除房屋
        /// </summary>
        /// <param name="HouseID">房屋id</param>
        /// <returns></returns>
        public static int DeleteHouse(int HouseID)
        {
            return HouseDal.DeleteHouse(HouseID);
        }
    }
}
