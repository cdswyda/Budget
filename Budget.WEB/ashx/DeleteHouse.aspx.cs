using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Budget.BLL;

namespace Budget.WEB.ashx
{
    public partial class DeleteHouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //删除房屋
            int HouseID = Convert.ToInt32(Request["HouseID"]);
            Response.Write(HouseBll.DeleteHouse(HouseID));
            
        }
    }
}