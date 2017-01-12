<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Budget.WEB.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>兰艺装饰--查看报表</title>
    <%--bootstrap--%>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <%------%>
    <%--导出--%>
    <script src="js/Chinese/tableExport.js"></script>
    <script src="js/Chinese/jquery.base64.js"></script>
    <%------%>
    <style>
        /*房间标题行*/
        .roomtitle {
            background-color: #f9f9f9;
        }

        .mes-h {
            display: none;
        }

        .mes-s {
            display: block;
        }
    </style>
</head>
<body>
    <div>
        <%=GetReport() %>
    </div>
    <form id="form1" class="form" role="form" runat="server">

        <input type="button" onclick="$('#report').tableExport({ type: 'excel', escape: 'false' });" value="导出1" />
        <asp:Button ID="Button1" runat="server" Text="导出2" OnClick="Button1_Click" />
        <asp:Button ID="Button3" runat="server" Text="审核通过此报价表" OnClick="Button3_Click" class="mes-h"/>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" class="mes-h" Columns="50" Rows="3">请输入留言内容</asp:TextBox>
        <br />
        <asp:Button ID="Button2" runat="server" Text="提交留言" OnClick="Button2_Click" class="mes-h" />

        <input id="UserType" type="text" value="<%=ShowType() %>" style="visibility:hidden"/>
        <input id="HouseState" type="text" value="<%=ShowState() %>" style="visibility:hidden"/>



    </form>
    <script>
        window.onload = function () {
            //用户类型是用户则显示留言
            if ($("#UserType").val() == 1) {
                $("#TextBox1").removeClass("mes-h").addClass("mes-s");
                $("#Button2").removeClass("mes-h").addClass("mes-s");

                //房屋状态为未审核的显示审核按钮
                if ($("#HouseState").val() == 0)
                {
                    $("#Button3").removeClass("mes-h").addClass("mes-s");
                }
            }



        };
        
            
        

    </script>
    
</body>
</html>
