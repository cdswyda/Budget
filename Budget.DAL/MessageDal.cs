using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Budget.DAL
{
    public class MessageDal
    {
        //用户新增留言
        public static int AddMessage(int HouseID,int UserID,string Note)
        {
            string sql = string.Format("insert into [Message] ([HouseID],[UserID],[Note]) values({0},{1},'{2}') ",HouseID,UserID,Note);
            return DBHelper.ExecuteNonQuery(sql);
        }
        //设计师查看留言
        public static DataTable GetMessageByDesigner(int designerID)
        {
            string sql = string.Format(@"select [Message].[HouseID], [Message].[Time],[Message].[Note],
[House].[Owner],[House].[Name] HouseName,
[User].[Name] UserName
from [User] inner join [House] on [House].[Owner]=[User].[UserID] 
inner join [Message] on [House].[HouseID] =[Message].[HouseID]

where [Message].[UserID]={0}", designerID);
            return DBHelper.ExecuteDatatable(sql);
        }

    }
}
