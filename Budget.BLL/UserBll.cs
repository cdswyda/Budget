using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Budget.MODEl;
using Budget.DAL;
using System.Data;

namespace Budget.BLL
{
    public class UserBll
    {
        /// <summary>
        /// 新增一个用户，默认类型为1，即业主
        /// </summary>
        /// <param name="phone">业主电话</param>
        /// <param name="name">业主姓名</param>
        /// <returns></returns>
        public static int AddUser(string phone, string name)
        {
            User u = new User();
            u.Phone = phone;
            u.Type = 1;
            u.Name = name;
            return UserDal.AddUser(u);
        }
        /// <summary>
        /// 新增一个用户，type为用户类型 0为设计师 1为业主
        /// </summary>
        /// <param name="phone">电话</param>
        /// <param name="type">用户类型</param>
        /// <param name="name">姓名</param>
        /// <returns></returns>
        public static int AddUser(string phone, int type, string name)
        {
            User u = new User();
            u.Phone = phone;
            u.Type = type;
            u.Name = name;
            return UserDal.AddUser(u);
        }
        /// <summary>
        /// 获取用户id
        /// </summary>
        /// <param name="p">手机号</param>
        /// <returns>不存在则为0否则为用户id</returns>
       
        public static int GetUserID(string p)
        {
            return UserDal.GetUserID(p);
        }
        /// <summary>
        /// 获取用户类型
        /// </summary>
        /// <param name="p">电话号码</param>
        /// <returns></returns>
        public static int GetUserType(string p)
        {
            return UserDal.GetUserType(p);
        }
        /// <summary>
        /// 根据用户id获取用户姓名
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns>用户姓名</returns>
        public static string GetUserName(int id)
        { return UserDal.GetUserName(id); }

        /// <summary>
        /// 根据房屋id获取业主名
        /// </summary>
        /// <param name="id">房屋id</param>
        /// <returns>业主姓名</returns>
        public static string GetUserNameByHouseID(int id)
        {
            return UserBll.GetUserNameByHouseID(id);
        }

        /// <summary>
        /// 根据用户编号获取用户信息
        /// </summary>
        /// <param name="UserID">用户ID</param>
        /// <returns>一行数据</returns>
        public static DataRow GetUserInfoByID(int UserID)
        {
            return UserDal.GetUserInfoByID(UserID).Rows[0];
        }
    }
}
