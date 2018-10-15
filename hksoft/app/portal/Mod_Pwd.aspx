<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mod_Pwd.aspx.cs" Inherits="hkpro.app.portal.Mod_Pwd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
        .btn {
    padding: 7px 12px;
    font-size:16px;
    cursor: pointer;
}
    </style>
</head>
<body>
    <form id="form1" runat="server" data-ajax="false">
        <div data-role="page" id="indexPage">

            <%-- 顶部 --%>
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='Set.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>修改密码</h1>
                    </div>
                </div>
            </div>
            <%-- 内容 --%>
            <div data-role="content" data-theme="d" class="mycontent_detail" style="padding-top:30px">
                <asp:Label ID="lblMsg" runat="server" Font-Size="Medium" ForeColor="Red" />
                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="原密码:" AssociatedControlID="oldpwd"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="oldpwd" CssClass="form-control" runat="server" placeholder="请输入原密码" required="required" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="新密码:" AssociatedControlID="newpwd"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="newpwd" CssClass="form-control" runat="server" placeholder="请输入新密码" required="required" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="确认密码:" AssociatedControlID="Rnewpwd"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="Rnewpwd" CssClass="form-control" runat="server" placeholder="请确认新密码" required="required" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div align="center" class="btn_color" style="margin-top:10%">
                    <asp:Button ID="Button" runat="server" Text="保存" data-theme="e" data-mini="true"
                        OnClick="Save_Click" CssClass=" btn btn-info" Width="90%"/>
                </div>
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="oldpwd"
            ErrorMessage="请输入原密码">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="newpwd"
            ErrorMessage="请输入新密码">&nbsp; </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rnewpwd"
            ErrorMessage="请输入确认密码">&nbsp; </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="newpwd" Type="String"
            ControlToCompare="rnewpwd" ErrorMessage="新密码与确认密码不符！">&nbsp;</asp:CompareValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="oldpwd"
            Display="none" ErrorMessage="原密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="newpwd"
            Display="none" ErrorMessage="新密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
            runat="server">
        </asp:RegularExpressionValidator>

        <%-- 底部 --%>
        </div>
    </form>
</body>
</html>

