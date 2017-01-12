using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Budget.DAL;
using System.Data;

namespace Budget.BLL
{
    public class MessageBll
    {
        public static int AddMessage(int HouseID, int UserID, string Note)
        {
            return MessageDal.AddMessage(HouseID, UserID, Note);
        }

        public static DataTable GetMessageByDesigner(int designerID)
        {
            return MessageDal.GetMessageByDesigner(designerID);
        }
    }
}
