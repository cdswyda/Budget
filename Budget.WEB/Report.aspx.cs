using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using Budget.BLL;

namespace Budget.WEB
{
    public partial class Report : System.Web.UI.Page
    {
         int HouseID;
        protected void Page_Load(object sender, EventArgs e)
        {
            HouseID = Request["HouseID"] == null ? 0 : Convert.ToInt32(Request["HouseID"]);
            if (HouseID == 0 || Session["userid"] == null)
            {
                Response.Redirect("index.html");
            }
            if (HouseBll.GetHouseInfoByID(HouseID).Rows.Count == 0)
            {
                Response.Redirect("index.html");
            }



        }

        public string GetReport()
        {
            int i, j;//循环变量
            string html = "<div id='report' class='table--responsive'><table class='table table-hover'>";

            //表头信息
            html += "<tr class='text-center'><td colspan='7'>兰艺装饰预算报价表</td></tr>";
            html += "<tr>";
            html += string.Format("<td>名称</td><td>{0}</td>", HouseBll.GetHouseInfoByID(HouseID).Rows[0][1]);
            //业主信息
            DataRow udr = UserBll.GetUserInfoByID(Convert.ToInt32(HouseBll.GetHouseInfoByID(HouseID).Rows[0][3]));
            html += string.Format("<td>业主</td><td td colspan='3'>{0} 电话 {1}</td>", udr[4], udr[1]);
            //设计师信息
            udr = UserBll.GetUserInfoByID(Convert.ToInt32(HouseBll.GetHouseInfoByID(HouseID).Rows[0][2]));
            html += string.Format("<td>设计师  {0}  电话   {1}</td>", udr[4], udr[1]);
            html += "</tr>";

            html += @"

     <tr>
       <th>序号</th>
       <th>名称</th>
       <th>单位</th>
       <th>单价</th>
       <th>数量</th>
       <th>金额</th>
       <th>材料工艺及说明</th>
     </tr>";
            //获取所有房间
            DataTable roomDT = RoomsBll.GetRooms(HouseID);
            for (i = 0; i < roomDT.Rows.Count; i++)
            {

                int RoomID = Convert.ToInt32(roomDT.Rows[i][0]);//获取房间号
                //此房间下的所有装修条目
                html += string.Format("<tr class='roomtitle' ><td>{0}</td><td>{1}</td><td></td><td></td><td></td><td></td><td></td></tr>", i + 1, roomDT.Rows[i][2]);
                DataTable itemDT = ItemsBll.GetItemsByRoomID(RoomID);
                for (j = 0; j < itemDT.Rows.Count; j++)
                {
                    html += "<tr>";
                    html += string.Format("<td>{0}--{1}</td>", i + 1, j + 1);

                    html += string.Format("<td>{0}</td>", itemDT.Rows[j][2]);
                    html += string.Format("<td class='text-center'>{0}</td>", itemDT.Rows[j][3]);
                    html += string.Format("<td class='text-right'>{0}</td>", itemDT.Rows[j][4]);
                    html += string.Format("<td class='text-right'>{0}</td>", itemDT.Rows[j][5]);
                    html += string.Format("<td  class='text-right'>{0}</td>", itemDT.Rows[j][6]);
                    html += string.Format("<td>{0}</td>", itemDT.Rows[j][7]);
                    html += "</tr>";
                }

                //房间小计
                if (roomDT.Rows[i] != null && Convert.ToInt32(roomDT.Rows[i][9])!=0)
                {
                    html += string.Format("<tr><td></td><td>小计</td><td></td><td></td><td></td><td class='text-right'>￥ {0}</td><td></td></tr>", roomDT.Rows[i][9]);
                }
            }

            //特殊项目
            DataTable sItemDT = ItemsBll.GetItems1ByHouseID(HouseID);
            html += string.Format("<tr class='roomtitle'><td>{0}</td><td>{1}</td><td></td><td></td><td></td><td></td><td></td></tr>", i + 1, "其他项目");
            double sItemTotal = 0;
            for (j = 0; j < sItemDT.Rows.Count; j++)
            {
                html += "<tr>";
                html += string.Format("<td>{0}--{1}</td>", i + 1, j + 1);
                html += string.Format("<td>{0}</td>", sItemDT.Rows[j][2]);
                html += string.Format("<td class='text-center'>{0}</td>", sItemDT.Rows[j][3]);
                html += string.Format("<td class='text-right'>{0}</td>", sItemDT.Rows[j][4]);
                html += string.Format("<td class='text-right'>{0}</td>", sItemDT.Rows[j][5]);
                html += string.Format("<td  class='text-right'>{0}</td>", sItemDT.Rows[j][6]);
                html += string.Format("<td class='lyzsNote'>{0}</td>", sItemDT.Rows[j][7]);
                html += "</tr>";
                sItemTotal += Convert.ToDouble(sItemDT.Rows[j][6]);
            }
            //特殊小计
            html += string.Format("<tr><td></td><td>小计</td><td></td><td></td><td></td><td class='text-right'>￥ {0}</td><td></td></tr>", sItemTotal);

            //总计
            html += string.Format("<tr><td></td><td>总计</td><td></td><td></td><td></td><td class='text-right'>￥ {0}</td><td></td></tr>", HouseBll.GetTotal(HouseID));

            html += "</table></div>";

            return html;
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/force-download";
            Response.AddHeader("content-disposition",
                "attachment; filename=" + HouseBll.GetHouseInfoByID(HouseID).Rows[0][1] + DateTime.Now.ToString("yyyyMMddHHmmss") + ".xls");
            Response.Write("<html xmlns:x=\"urn:schemas-microsoft-com:office:excel\">");
            Response.Write("<head>");
            Response.Write("<META http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">");
            #region 样式的读取
            string fileCss = Server.MapPath("~/bootstrap/css/bootstrap1.min.css");
            string cssText = string.Empty;
            StreamReader sr = new StreamReader(fileCss);
            var line = string.Empty;
            while ((line = sr.ReadLine()) != null)
            {
                cssText += line;
            }
            sr.Close();
            Response.Write("<style>" + cssText + "</style>");
            #endregion
            Response.Write("<!--[if gte mso 9]><xml>");
            Response.Write("<x:ExcelWorkbook>");
            Response.Write("<x:ExcelWorksheets>");
            Response.Write("<x:ExcelWorksheet>");
            Response.Write("<x:Name>Report Data</x:Name>");
            Response.Write("<x:WorksheetOptions>");
            Response.Write("<x:Print>");
            Response.Write("<x:ValidPrinterInfo/>");
            Response.Write("</x:Print>");
            Response.Write("</x:WorksheetOptions>");
            Response.Write("</x:ExcelWorksheet>");
            Response.Write("</x:ExcelWorksheets>");
            Response.Write("</x:ExcelWorkbook>");
            Response.Write("</xml>");
            Response.Write("<![endif]--> ");
            Response.Write(GetReport());//这里是前台页面的HTML
            Response.Flush();
            Response.End();
        }


        //用户类型
        public string ShowType()
        {
            return Session["Type"].ToString();
        }
        //审核状态
        public string ShowState()
        {
            return HouseBll.GetHouseInfoByID(HouseID).Rows[0][8].ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int designerID = Convert.ToInt32(HouseBll.GetHouseInfoByID(HouseID).Rows[0][2]);
            if (MessageBll.AddMessage(HouseID, designerID, TextBox1.Text) == 1)
            {
                Response.Write("<script>alert('success!');</script>");
                
                Response.Redirect(string.Format("{0}?HouseID={1}", Request.Path, HouseID));
                
            }
        }
        //审核通过
        protected void Button3_Click(object sender, EventArgs e)
        {
            HouseBll.checkState(HouseID);
        }



    }
}