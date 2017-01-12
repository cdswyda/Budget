using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Collections;


namespace Budget.DAL
{
    public  class LoginDal
    {
        //登录
        public static int login(string u ,string p) 
        {
            string sql = string.Format("select count(*) from [User] where [Phone]='{0}' and [password]='{1}'",u,p);
            return Convert.ToInt32(DBHelper.ExecuteScalar(sql));
        }





        /// <summary>
        /// DT转化成集合
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        private static ArrayList DataTable2ArrayList(DataTable data)
        {
            ArrayList array = new ArrayList();
            for (int i = 0; i < data.Rows.Count; i++)
            {
                DataRow row = data.Rows[i];

                Hashtable record = new Hashtable();
                for (int j = 0; j < data.Columns.Count; j++)
                {
                    object cellValue = row[j];
                    if (cellValue.GetType() == typeof(DBNull))
                    {
                        cellValue = null;
                    }
                    record[data.Columns[j].ColumnName] = cellValue;
                }
                array.Add(record);
            }
            return array;
        }
    }
}
