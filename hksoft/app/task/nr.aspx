<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nr.aspx.cs" Inherits="hksoft.app.task.nr" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>
    <style>
        table {
            width: 100%;
        }
    </style>
</head>
<body style="width: 100%;">
    <%-- 导航条--%>

    <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
        <div>
            <a onclick="javascript:history.back(-1);">
                <i class="fa fa-chevron-left" style="padding-top:22px;"></i>
            </a>
            <div class="div_h1">
                <h1>任务内容</h1>
            </div>
        </div>
    </div>
    <%--内容--%>
    <div class="ibox-content" style="padding-top:70px">
        <div style="background-color: #F6F6F6">
            <div class="nr" style="padding-left:10px;padding-right:10px">
                <asp:Label ID="rwnr" runat="server" style="word-break:break-all;overflow:hidden;"> </asp:Label>
            </div>
        </div>
        <br />
    </div>
</body>
</html>
