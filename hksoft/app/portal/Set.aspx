<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Set.aspx.cs" Inherits="hkpro.app.portal.Set" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml" style="background-color: #FAFAFA;">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../cssjs_a/my.css" rel="stylesheet" />
<%--    <link href="../cssjs_a/global.css" rel="stylesheet" />--%>
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet" />
    <script src="./assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../cssjs_a/frame/jquery-1.8.2.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
 <%--   <script src="../cssjs_a/global.js"></script>--%>
    <style>
        .btn-info {
            color: #fff;
            background-color: #1e88e5;
            border-color: #1e88e5;
        }

        .mytop .div_h1 {
            background: #1e88e5;
        }

      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage" class="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='../Main_A.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>系统设置</h1>
                    </div>
                </div>
            </div>
            <div class="card" style="padding-top: 10%">
                <img class="card-img img-responsive" src="../images_a/app/img1.jpg" alt="Card image" />
                <div class="card-img-overlay card-inverse social-profile-first bg-over" style="padding-top: 30%">
                    <img src="<%=userImg %>" class="img-circle" width="100" />

                    <h4 class="card-title"><%=userName %></h4>
                </div>
                <div class="card-body text-center">
                    <%--         <div class="row">
                        <div class="col">    
                            <a href="Mod_Pwd.aspx" data-ajax="false" style="text-decoration: none">
                                <i class="m-b-0 mdi mdi-account-key" onclick="window.location='../images_A/mod_pwd1.gif'" onerror="errpic(this)" style="font-size: 30px"></i>
                                <span class="font-light">修改密码</span>
                            </a>
                        </div>
                        <div class="col-3">
                        </div>
                        <div class="col">
                            <a href="Mod_Zl.aspx" data-ajax="false" style="text-decoration: none">
                                <i class="m-b-0 mdi mdi-account-edit " onclick="window.location='../images_A/mod_zl1.gif'" onerror="errpic(this)" style="font-size: 30px"></i>
                                <span class="font-light">修改资料</span>
                            </a>
                        </div>
                    </div>--%>
                </div>
            </div>
            <div class="card-body">
                <ul class="feeds">
                    <li class="lib ">
                        <div>
                            <i class="ti ti-unlock" style="font-size: 20px"></i>
                        </div>
                        <a href="Mod_Pwd.aspx" data-ajax="false" style="text-decoration: none">
                            <span style="margin-right: 60%; font-size: 16px; margin-top: 6px; color: #455A64;">修改密码</span>
                        </a>
                    </li>
                    <li>
                        <div>
                            <i class="ti ti-pencil-alt" style="font-size: 20px"></i>
                        </div>
                        <a href="Mod_Zl.aspx" data-ajax="false" style="text-decoration: none">
                            <span style="margin-right: 60%; font-size: 16px; margin-top: 6px; color: #455A64;" class="font-light">修改资料</span>
                        </a></li>
                </ul>
            </div>
            <div align="center "> 
                <a onclick="window.location='../Logout_A.aspx'" class="btn" style ="width:90%; background-color:#1e88e5; color:#fff">退出
                  <%--  <asp:Button runat="server" Text="退出" data-theme="e" data-mini="true" CssClass="btn btn-info" Width="90%" />--%>
                </a>
            </div>
        </div>
    </form>
</body>
</html>
