using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;

namespace Budget.DAL
{
    public  class DBHelper
    {
        static Database db = DatabaseFactory.CreateDatabase("ConnectionString");


        /// <summary>
        /// 返回查询dt
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>数据表</returns>
        public static DataTable ExecuteDatatable(string sql)
        {
            DbCommand cmd = db.GetSqlStringCommand(sql);
            return db.ExecuteDataSet(cmd).Tables[0];  
        }


        /// <summary>
        /// 执行增删改，返回受影响行数
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns>受影响行数</returns>
        public static int ExecuteNonQuery(string sql)
        {
            DbCommand cmd = db.GetSqlStringCommand(sql);
            return db.ExecuteNonQuery(cmd);
        }
        /// <summary>
        /// 执行一个返回首行首列的查询
        /// </summary>
        /// <param name="sql">sql语句</param>
        /// <returns></returns>
        /// <returns>obj</returns>
        public static object ExecuteScalar(string sql)
        {
            DbCommand cmd = db.GetSqlStringCommand(sql);
            return db.ExecuteScalar(cmd);
        }
    }
}
