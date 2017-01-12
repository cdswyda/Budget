<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserMain.aspx.cs" Inherits="Budget.WEB.UserMain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>兰艺装饰--感谢您的信赖</title>

    <link href="css/style.css" type="text/css" rel="stylesheet" media="all" />
    <link href="css/bootstrap.css" type="text/css" rel="stylesheet" media="all" />
    <link rel="stylesheet" type="text/css" href="css/default.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <!--web-font-->
    <link href='http://fonts.useso.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
    <!--//web-font-->
    <!-- Custom Theme files -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Furnishing Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
		Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="http://ajax.useso.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="js/jquery.min.js"></script>
    <!-- //js -->
    <!-- start-smoth-scrolling-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript" src="js/modernizr.custom.53451.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 1000);
            });
        });
    </script>
    <!--//end-smoth-scrolling-->
</head>
<body>
    <form id="form1" runat="server">
        <!--header-->
        <div class="banner">
            <div class="container">
                <div class="col-md-9 top-nav">
                    <span class="menu">
                        <img src="images/menu.png" alt="" /></span>
                    <ul class="nav1">
                        <li><a href="index.html" class="active">HOME</a></li>
                        <li><a href="login.html">LOGIN</a></li>
                        <li><a href="about.html">ABOUT</a></li>

                    </ul>
                    <!-- script-for-menu -->
                    <script>
                        $("span.menu").click(function () {
                            $("ul.nav1").slideToggle(300, function () {
                                // Animation complete.
                            });
                        });
                    </script>
                    <!-- /script-for-menu -->
                </div>
                <div class="col-md-3 header-logo">
                    <a href="index.html">
                        <img src="images/logo-1.png" alt="logo" /></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!--//header-->
        <!--about-->



        <div class="about">
            <div class="container">
                <div class="services">
                    <h3>欢迎您，<%=ShowUserName() %> <a href="ashx/loginout.aspx">注销</a></h3>
                </div>
                <div class="about-info">
                    <div class="col-md-5 about-info-left">
                        <img src="images/about.jpg" alt="" />
                    </div>
                    <div class="col-md-7 about-info-right">
                        <h4></h4>
                        <p><%=Show() %></p>
                        
                    </div>
                    <div class="clearfix"></div>
                </div>


            </div>
        </div>












    </form>
</body>
</html>
