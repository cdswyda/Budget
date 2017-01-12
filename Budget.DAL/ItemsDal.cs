using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Data;

namespace Budget.DAL
{
    public class ItemsDal
    {
        #region Item操作
        /// <summary>
        /// 根据房间id取得所有项目
        /// </summary>
        /// <param name="key">房间id</param>
        /// <param name="index">分页</param>
        /// <param name="size">每页大小</param>
        /// <param name="sortField">排序字段</param>
        /// <param name="sortOrder">升序降序</param>
        /// <returns>结果集哈希表</returns>
        public static Hashtable GetItemsByRoomID(int key, int index, int size, string sortField, string sortOrder)
        {
            //查询语句
            string sql = string.Format(@"SELECT  [ItemID]
      ,[RoomID]
      ,[Name]
      ,[Units]
      ,[Price]
      ,[Quantity]
      ,[Total]
      ,[Note]
  FROM [Budget].[dbo].[Item] WHERE [RoomID]={0}", key);
            //排序字段
            if (String.IsNullOrEmpty(sortField) == false)
            {
                if (sortOrder != "desc") sortOrder = "asc";
                sql += " order by " + sortField + " " + sortOrder;
            }
            else
            {
                sql += " order by ItemID asc ";
            }
            //调用查询

            DataTable dt = DBHelper.ExecuteDatatable(sql);

            //所有结果存入集合 调用dt转集合方法
            ArrayList dataall = DataTable2ArrayList(dt);
            //分页
            ArrayList data = new ArrayList();
            int start = index * size, end = start + size;
            for (int i = 0, l = dataall.Count; i < l; i++)
            {
                Hashtable record = (Hashtable)dataall[i];
                if (record == null) continue;
                if (start <= i && i < end)
                {
                    data.Add(record);
                }
            }

            Hashtable result = new Hashtable();
            result["data"] = data;
            result["total"] = dataall.Count;
            return result;

        }

        /// <summary>
        /// 根据房间编号获取所有装修项目
        /// </summary>
        /// <param name="RoomID">房间编号</param>
        /// <returns></returns>
        public static DataTable GetItemsByRoomID(int RoomID)
        {
            string sql = string.Format(@"select [ItemID]
      ,[RoomID]
      ,[Name]
      ,	CASE [Units]
		    WHEN 1 THEN 'm'
		    WHEN 2 THEN '㎡'
		    WHEN 3 THEN '项'
		    WHEN 4 THEN '块'
		    WHEN 5 THEN '个'
		    WHEN 6 THEN '扇'
		    WHEN 7 THEN '件'
		    WHEN 8 THEN '条'
	    END
      ,[Price]
      ,[Quantity]
      ,cast([Total] as numeric(10, 2))
      ,[Note] from [Item] where [RoomID]={0}", RoomID);
            return DBHelper.ExecuteDatatable(sql);
        }
        /// <summary>
        ///  新增项目
        /// </summary>
        /// <param name="RoomID">房间id</param>
        /// <param name="Name">项目名称</param>
        /// <param name="Units">单位</param>
        /// <param name="Price">单价</param>
        /// <param name="Quantity">数量</param>
        /// <param name="Note">说明</param>
        /// <returns></returns>
        public static int AddItem(int RoomID, string Name, int Units, double Price, double Quantity, string Note)
        {
            string sql = string.Format("insert into [Item] ([RoomID],[Name],[Units],[Price],[Quantity],[Note]) values ({0},'{1}',{2},{3},{4},'{5}')", RoomID, Name, Units, Price, Quantity, Note);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="ItemID">项目编号</param>
        /// <returns></returns>
        public static int DeleteItem(int ItemID)
        {
            string sql = string.Format("delete from [Item] where [ItemId] = {0}", ItemID);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 更新项目
        /// </summary>
        /// <param name="ItemID">项目id</param>
        /// <param name="Name">名称</param>
        /// <param name="Units">单位</param>
        /// <param name="Price">单价</param>
        /// <param name="Quantity">数量</param>
        /// <param name="Note">说明</param>
        /// <returns></returns>
        public static int UpdateItem(int ItemID, string Name, int Units, double Price, double Quantity, string Note)
        {
            string sql = string.Format("update [Item] set [Name]='{0}' , [Units]={1} ,  [Price]={2} , [Quantity]={3} , [Note]='{4}' where [ItemID] = {5}", Name, Units, Price, Quantity, Note, ItemID);
            return DBHelper.ExecuteNonQuery(sql);
        }
        #endregion
        #region SpecialItem操作

        /// <summary>
        /// 根据房屋id取得所有特殊项目
        /// </summary>
        /// <param name="key">房屋id</param>
        /// <param name="index">分页</param>
        /// <param name="size">每页大小</param>
        /// <param name="sortField">排序字段</param>
        /// <param name="sortOrder">升序降序</param>
        /// <returns>结果集哈希表</returns>
        public static Hashtable GetItems1ByHouseID(int key, int index, int size, string sortField, string sortOrder)
        {
            //查询语句
            string sql = string.Format(@"SELECT  [ItemID]
      ,[HouseID]
      ,[Name]
      ,[Units]
      ,[Price]
      ,[Quantity]
      ,[Total]
      ,[Note]
  FROM [Budget].[dbo].[SpecialItem] WHERE [HouseID]={0}", key);
            //排序字段
            if (String.IsNullOrEmpty(sortField) == false)
            {
                if (sortOrder != "desc") sortOrder = "asc";
                sql += " order by " + sortField + " " + sortOrder;
            }
            else
            {
                sql += " order by ItemID asc ";
            }
            //调用查询

            DataTable dt = DBHelper.ExecuteDatatable(sql);

            //所有结果存入集合 调用dt转集合方法
            ArrayList dataall = DataTable2ArrayList(dt);
            //分页
            ArrayList data = new ArrayList();
            int start = index * size, end = start + size;
            for (int i = 0, l = dataall.Count; i < l; i++)
            {
                Hashtable record = (Hashtable)dataall[i];
                if (record == null) continue;
                if (start <= i && i < end)
                {
                    data.Add(record);
                }
            }

            Hashtable result = new Hashtable();
            result["data"] = data;
            result["total"] = dataall.Count;
            return result;

        }


        /// <summary>
        /// 根据房屋获取所有特殊装修条目
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns>dt</returns>
        public static DataTable GetItems1ByHouseID(int HouseID)
        {
            string sql = string.Format(@"select [ItemID]
      ,[HouseID]
      ,[Name]
      ,	CASE [Units]
		    WHEN 1 THEN 'm'
		    WHEN 2 THEN '㎡'
		    WHEN 3 THEN '项'
		    WHEN 4 THEN '块'
		    WHEN 5 THEN '个'
		    WHEN 6 THEN '扇'
		    WHEN 7 THEN '件'
		    WHEN 8 THEN '条'
	    END
      ,[Price]
      ,[Quantity]
      ,cast([Total] as numeric(10, 2))
      ,[Note] from [SpecialItem] where [HouseID]={0}", HouseID);
            return DBHelper.ExecuteDatatable(sql);
        }




        /// <summary>
        ///  新增特殊项目
        /// </summary>
        /// <param name="RoomID">房屋id</param>
        /// <param name="Name">项目名称</param>
        /// <param name="Units">单位</param>
        /// <param name="Price">单价</param>
        /// <param name="Quantity">数量</param>
        /// <param name="Note">说明</param>
        /// <returns></returns>
        public static int AddItem1(int HouseID, string Name, int Units, double Price, double Quantity, string Note)
        {
            string sql = string.Format("insert into [SpecialItem] ([HouseID],[Name],[Units],[Price],[Quantity],[Note]) values ({0},'{1}',{2},{3},{4},'{5}')", HouseID, Name, Units, Price, Quantity, Note);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 删除特殊项目
        /// </summary>
        /// <param name="ItemID">项目编号</param>
        /// <returns></returns>
        public static int DeleteItem1(int ItemID)
        {
            string sql = string.Format("delete from [SpecialItem] where [ItemID] = {0}", ItemID);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 删除房屋下的所有特殊条目
        /// </summary>
        /// <param name="HouseID">房屋id</param>
        /// <returns></returns>
        public static int DeleteItem1ByHouseID(int HouseID)
        {
            string sql = string.Format("delete from [SpecialItem] where [HouseID] = {0}", HouseID);
            return DBHelper.ExecuteNonQuery(sql);
        }

        /// <summary>
        /// 更新特殊项目
        /// </summary>
        /// <param name="ItemID">项目id</param>
        /// <param name="Name">名称</param>
        /// <param name="Units">单位</param>
        /// <param name="Price">单价</param>
        /// <param name="Quantity">数量</param>
        /// <param name="Note">说明</param>
        /// <returns></returns>
        public static int UpdateItem1(int ItemID, string Name, int Units, double Price, double Quantity, string Note)
        {
            string sql = string.Format("update [SpecialItem] set [Name]='{0}' , [Units]={1} ,  [Price]={2} , [Quantity]={3} , [Note]='{4}' where [ItemID] = {5}", Name, Units, Price, Quantity, Note, ItemID);
            return DBHelper.ExecuteNonQuery(sql);
        }


        /// <summary>
        /// 获取房屋下的所有特殊装修的合计
        /// </summary>
        /// <param name="HouseID">房屋编号</param>
        /// <returns></returns>
        public static double GetSItemTotal(int HouseID)
        {
            string sql = string.Format("select sum([Total]) from [SpecialItem] where [HouseID]={0}", HouseID);
            double result = DBHelper.ExecuteScalar(sql)==DBNull.Value? 0:Convert.ToDouble(DBHelper.ExecuteScalar(sql)) ;
            return result;
        }



        #endregion


        /// <summary>
        /// DT转化成集合
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private static ArrayList DataTable2ArrayList(DataTable data)
        {
            ArrayList array = new ArrayList();
            //遍历每行
            for (int i = 0; i < data.Rows.Count; i++)
            {
                DataRow row = data.Rows[i];//获取当前行
                Hashtable record = new Hashtable();
                //遍历每列
                for (int j = 0; j < data.Columns.Count; j++)
                {
                    object cellValue = row[j];
                    if (cellValue.GetType() == typeof(DBNull))
                    {
                        cellValue = null;
                    }
                    //构造record["列名"]=此行此列的值 形式
                    record[data.Columns[j].ColumnName] = cellValue;
                }
                array.Add(record);
            }
            return array;
        }

    }
}
