<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesignerMain.aspx.cs" Inherits="Budget.WEB.DesignerMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />

    <title>兰艺装饰--设计你的生活</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f0f0f0;
        }

        .room {
            border: 2px solid #02c4b9;
            border-radius: 10px;
            line-height: 50px;
            background: rgba(245,245,245,0.9);
            width: 99%;
            margin-bottom: 20px;
            padding-left: inherit;
            padding-right: 5px;
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .house {
            border-bottom: 1px dashed #f0f0f0;
            height: auto;
            padding-bottom: 30px;
            margin-bottom: 10px;
            background-color: #fafafa;
            /*border: 1px solid #02c4b9;*/
            border-radius: 10px;
        }

        .clear {
            clear: both;
        }

        .header {
            position: relative;
        }

        .logout {
            position: absolute;
            top: -10px;
            right: 15px;
            width: auto;
        }

        .message {
            margin: 15px 0 5px 15px;
            font-size: 18px;
            width: 500px;
            padding-left:10px;
        }

            .message div {
                border-bottom: 1px dashed #02c4b9;
                margin-bottom:5px;
            }
    </style>
</head>
<body <%--style="background-image: url('images/bnr-1.jpg')"--%>>
    <form id="form1" runat="server">
        <div class="header">
            <h3 style="margin-left: 25px;"><a class="addHouse-a" href="CreateHouse.html?designer=<%=getDesignerPhone() %>" target="CreateHouse">开始一个新的设计</a></h3>
            <div class="logout">欢迎您，<%=ShowUserName() %> <a href="ashx/loginout.aspx">注销</a></div>
        </div>
        <div>
            <%--房屋Repeat控件--%>
            <asp:Repeater ID="HouseRepeater" runat="server" OnItemCreated="HouseRepeater_ItemCreated">
                <ItemTemplate>

                    <%--房屋div--%>
                    <div class="house">



                        <h3 class="col-sm-12" style="color: #000000;">

                            <%# Eval("Name") %>
                            <a href="Report.aspx?HouseID=<%#Eval("HouseID") %>" target="_blank">查看报表</a>

                            <button type="button" class="close" onclick="deleteHouse(<%#Eval("HouseID")%>)">
                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                            </button>

                        </h3>

                        <%--房间Repeat控件--%>
                        <div>
                            <asp:Repeater ID="RoomRepeater" runat="server">
                                <%--我是房间--%>
                                <ItemTemplate>
                                    <%--房间div--%>
                                    <div class="col-sm-3 ">
                                        <div class="room">
                                            <button type="button" class="close" onclick="deleteRoom(<%#DataBinder.Eval(Container.DataItem,"RoomID") %>)">
                                                <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>

                                            </button>
                                            <h4><%# DataBinder.Eval(Container.DataItem,"RoomName") %></h4>
                                            <a href="ItemManger.html?RoomID=<%#DataBinder.Eval(Container.DataItem,"RoomID") %>" target="_blank">编辑</a>


                                        </div>

                                    </div>
                                    <%--房间div结束--%>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <%--房间Repeat控件结束--%>

                        <%--显示其他项目--%>
                        <div class="col-sm-3 ">
                            <div class="room">
                                <h4>其他项目</h4>
                                <a href="ItemManger1.html?HouseID=<%#Eval("HouseID") %>" target="_blank">编辑</a>
                            </div>
                        </div>



                        <%--尾部div 显示添加房间--%>
                        <div class="col-sm-3">
                            <div class="room">
                                <h4>&nbsp;</h4>
                                <a class="addRoom-a" href="CreateRoom.html?HouseID=<%#Eval("HouseID") %>" target="CreateRoom">添加房间</a>
                            </div>

                        </div>
                        <%--尾部div结束--%>

                        <div class="col-sm-12">
                            地址：<%# Eval("Address") %>  面积：<%# Eval("Area") %>
                        </div>

                        <!--用于清除浮动的影响-->
                        <div class="clear"></div>
                        <!--end-->
                    </div>
                    <%--房屋div结束--%>
                </ItemTemplate>

            </asp:Repeater>
            <%--房屋Repeat控件结束--%>
        </div>

        <div class="house">
            <h3 style="padding-left:15px;">查看留言</h3>
            <asp:Repeater ID="MessageRepeater" runat="server">
                <ItemTemplate>
                    <div class="message">
                        <div>
                            <span><%#Eval("UserName") %> <%#Eval("Time") %> </span>
                            <span style="float: right;"><%#Eval("HouseName") %></span>

                        </div>

                        <%#Eval("Note") %>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>


    </form>



    <!--添加房屋modal-->
    <div class="modal" id="mymodal0">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">创建一个房屋</h4>
                </div>
                <div class="modal-body" style="height: 600px">

                    <iframe name="CreateHouse" scrolling="no" frameborder="0" style="width: 100%; height: 100%;"></iframe>

                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->



    <!--添加房间modal-->
    <div class="modal" id="mymodal">
        <div class="modal-dialog">
            <div class="modal-content" <%--style="background:rgba(20,100,60,0.9);"--%>>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">添加一个房间</h4>
                </div>
                <div class="modal-body" style="height: 600px">

                    <iframe name="CreateRoom" scrolling="no" frameborder="0" style="width: 100%; height: 100%;"></iframe>

                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->



    <script>
        //显示modal
        $(function () {
            $(".addRoom-a").click(function () {
                $("#mymodal").modal("toggle");
            });
            $(".addHouse-a").click(function () {
                $("#mymodal0").modal("toggle");
            });
        });
        //删除房间
        function deleteRoom(RoomID) {
            if (confirm("将删除此房间下的所有项目，是否继续")) {
                $.ajax({
                    url: 'ashx/DeleteRoom.aspx?roomID=' + RoomID,
                    type: 'POST',
                    success: function (result) {
                        if (result > 0) { location.reload(); }
                    }
                });
            }
        }

        //删除房屋
        function deleteHouse(RoomID) {
            if (confirm("将删除此房屋以及下属的所有房间、装修条目、特殊装修条目，请谨慎操作！是否继续？")) {
                $.ajax({
                    url: 'ashx/DeleteHouse.aspx?HouseID=' + RoomID,
                    type: 'POST',
                    success: function (result) {
                        if (result > 0) {
                            alert("删除成功");
                            location.reload();
                        }
                    }
                });
            }
        }


    </script>
</body>
</html>
