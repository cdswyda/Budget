using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;

namespace Budget.WEB.ashx
{
    public partial class DeleteRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int RoomID = Convert.ToInt32(Request["roomID"]);
            int result = RoomsBll.DeleteRoom(RoomID);
            Response.Write(result);

        }
    }
}