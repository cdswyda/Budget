using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Budget.WEB.ashx
{
    public partial class loginout : System.Web.UI.Page
    {
        //注销
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../index.html");
        }
    }
}