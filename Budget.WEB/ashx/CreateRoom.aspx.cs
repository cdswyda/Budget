using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;

namespace Budget.WEB.ashx
{
    public partial class CreateRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int houseID = Convert.ToInt32(Request["HouseID"]);
            string roomName=Request["RoomName"].ToString();
            double length = Convert.ToDouble(Request["Length"]);
            double width = Convert.ToDouble(Request["Width"]);
            double doorArea = Convert.ToDouble(Request["DoorArea"]);
            double windowArea = Convert.ToDouble(Request["WindowArea"]);
            Response.Write(RoomsBll.AddRoom(houseID,roomName,length,width,doorArea,windowArea));
        }
    }
}