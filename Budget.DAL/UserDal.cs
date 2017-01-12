using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Budget.MODEl;

namespace Budget.DAL
{
    public  class UserDal
    {
        /// <summary>
        /// 添加一个用户
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static int AddUser(User u)
        {
            string sql = string.Format("insert into [User] ([Phone],[Type],[Name]) values ('{0}','{1}','{2}')",u.Phone,u.Type,u.Name);
            return DBHelper.ExecuteNonQuery(sql);
        }
        /// <summary>
        /// 获取用户id
        /// </summary>
        /// <param name="p">用户手机号</param>
        /// <returns>不存在则为0否则为用户id</returns>
        public static int GetUserID(string p)
        {
            string sql = string.Format("select [UserID] from [User] where [Phone]='{0}'",p);
            int result = DBHelper.ExecuteScalar(sql) == DBNull.Value ? 0 : Convert.ToInt32(DBHelper.ExecuteScalar(sql));
            return result;
        }
        /// <summary>
        /// 获取用户类型
        /// </summary>
        /// <param name="p">电话号码</param>
        /// <returns></returns>
        public static int GetUserType(string p) 
        {
            string sql = string .Format("select [Type] from [User] where [Phone]='{0}'",p);
            return Convert.ToInt32(DBHelper.ExecuteScalar(sql));
        }
        /// <summary>
        /// 根据用户id获取用户姓名
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns>用户姓名</returns>
        public static string GetUserName(int id)
        {
            string sql = string.Format("select [Name] from [User] where [UserID]={0}",id);
            string userName = Convert.ToString(DBHelper.ExecuteDatatable(sql).Rows[0][0]);
            return userName;
        }
        /// <summary>
        /// 根据房屋id获取业主名
        /// </summary>
        /// <param name="id">房屋id</param>
        /// <returns>业主姓名</returns>
        public static string GetUserNameByHouseID(int id)
        {
            string sql = string.Format("select [User].[Name] name from [User] inner join [House] on [House].[Owner]=[User].[UserID] where [House].[HouseID]={0}",id);
            return DBHelper.ExecuteScalar(sql).ToString();
        }

        /// <summary>
        /// 根据用户编号获取用户信息
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <returns>一行数据</returns>
        public static DataTable GetUserInfoByID(int UserID)
        {
            string sql = string.Format("select * from [User] where [UserID]={0}",UserID);
            return DBHelper.ExecuteDatatable(sql);
        }

    }
}
