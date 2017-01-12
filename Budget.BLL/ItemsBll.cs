using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using Budget.DAL;
using System.Data;


namespace Budget.BLL
{
    public class ItemsBll
    {
#region
        /// <summary>
        /// 根据房间id取得所有项目
        /// </summary>
        /// <param name="key">房间id</param>
        /// <param name="index">分页</param>
        /// <param name="size">每页大小</param>
        /// <param name="sortField">排序字段</param>
        /// <param name="sortOrder">升序降序</param>
        /// <returns>序列后的json</returns>
        public static string GetItemsByRoomID(int key, int index, int size, string sortField, string sortOrder)
        {
            Hashtable ht = ItemsDal.GetItemsByRoomID(key, index, size, sortField, sortField);
            return JSON.Encode(ht);
        }
        /// <summary>
        /// 获取房间内的所有装修条目
        /// </summary>
        /// <param name="RoomID">房间编号</param>
        /// <returns>dt</returns>
        public static DataTable GetItemsByRoomID(int RoomID)
        {
            return ItemsDal.GetItemsByRoomID(RoomID);
        }

        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="hs">包含数据的哈希表</param>
        /// <returns></returns>
        public static int AddItem(Hashtable hs)
        {
            int RoomID = Convert.ToInt32(hs["RoomID"]);
            string Name = hs["Name"].ToString();
            int Units = Convert.ToInt32(hs["Units"]);
            double Price = Convert.ToDouble(hs["Price"]);
            double Quantity = Convert.ToDouble(hs["Quantity"]);
            string Note = hs["Note"].ToString();
            return ItemsDal.AddItem(RoomID, Name, Units, Price, Quantity, Note);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="hs">数据</param>
        /// <returns></returns>
        public static int DeleteItem(Hashtable hs)
        {
            int ItemID = Convert.ToInt32(hs["ItemID"]);
            return ItemsDal.DeleteItem(ItemID);
        }
        

        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="hs">数据哈希表</param>
        /// <returns></returns>
        public static int UpdateItem(Hashtable hs)
        {
            int ItemID = Convert.ToInt32(hs["ItemID"]);
            string Name = hs["Name"].ToString();
            int Units = Convert.ToInt32(hs["Units"]);
            double Price = Convert.ToDouble(hs["Price"]);
            double Quantity = Convert.ToDouble (hs["Quantity"]);
            string Note = hs["Note"].ToString();
            return ItemsDal.UpdateItem(ItemID,Name,Units,Price,Quantity,Note);
        }
#endregion


        /// <summary>
        /// 根据房屋id取得所有特殊项目
        /// </summary>
        /// <param name="key">房屋id</param>
        /// <param name="index">分页</param>
        /// <param name="size">每页大小</param>
        /// <param name="sortField">排序字段</param>
        /// <param name="sortOrder">升序降序</param>
        /// <returns>序列后的json</returns>
        public static string GetItems1ByHouseID(int key, int index, int size, string sortField, string sortOrder)
        {
            Hashtable ht = ItemsDal.GetItems1ByHouseID(key, index, size, sortField, sortField);
            return JSON.Encode(ht);
        }
        /// <summary>
        /// 根据房屋id获取特殊张绣条目
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns>dt</returns>
        public static DataTable GetItems1ByHouseID(int HouseID)
        {
            return ItemsDal.GetItems1ByHouseID(HouseID);
        }


        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="hs">包含数据的哈希表</param>
        /// <returns></returns>
        public static int AddItem1(Hashtable hs)
        {
            int HouseID = Convert.ToInt32(hs["HouseID"]);
            string Name = hs["Name"].ToString();
            int Units = Convert.ToInt32(hs["Units"]);
            double Price = Convert.ToDouble (hs["Price"]);
            double Quantity = Convert.ToDouble (hs["Quantity"]);
            string Note = hs["Note"].ToString();
            return ItemsDal.AddItem1(HouseID, Name, Units, Price, Quantity, Note);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="hs">数据</param>
        /// <returns></returns>
        public static int DeleteItem1(Hashtable hs)
        {
            int ItemID = Convert.ToInt32(hs["ItemID"]);
            return ItemsDal.DeleteItem1(ItemID);
        }
        /// <summary>
        /// 删除房屋下的所有特殊条目
        /// </summary>
        /// <param name="HouseID">房屋id</param>
        /// <returns></returns>
        public static int DeleteItem1ByHouseID(int HouseID) 
        {
            return ItemsDal.DeleteItem1ByHouseID(HouseID);
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="hs">数据哈希表</param>
        /// <returns></returns>
        public static int UpdateItem1(Hashtable hs)
        {
            int ItemID = Convert.ToInt32(hs["ItemID"]);
            string Name = hs["Name"].ToString();
            int Units = Convert.ToInt32(hs["Units"]);
            double Price = Convert.ToDouble (hs["Price"]);
            double Quantity = Convert.ToDouble (hs["Quantity"]);
            string Note = hs["Note"].ToString();
            return ItemsDal.UpdateItem1(ItemID, Name, Units, Price, Quantity, Note);
        }

        
    }
}
