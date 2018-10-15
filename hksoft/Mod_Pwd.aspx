<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mod_Pwd.aspx.cs" Inherits="hkpro.Mod_Pwd" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="cssjs/mypc.css" />
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <title>修改密码</title>
</head>
<body class="main">
    <div class="card card-body">
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group row">
                <label for="oldpwd" class="col-sm-3 text-right control-label col-form-label">原登录密码*</label>
                <div class="col-sm-9">
                    <div class="input-group w240">
                        <div class="input-group-addon"><i class="ti-lock"></i></div>
                        <asp:TextBox CssClass="form-control" ID="oldpwd" runat="server" TextMode="password" placeholder="原登录密码"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="newpwd" class="col-sm-3 text-right control-label col-form-label">新登录密码*</label>
                <div class="col-sm-9">
                    <div class="input-group w240">
                        <div class="input-group-addon"><i class="ti-lock"></i></div>
                        <asp:TextBox CssClass="form-control w200" ID="newpwd" runat="server" TextMode="password" placeholder="新登录密码"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="Rnewpwd" class="col-sm-3 text-right control-label col-form-label">确认新密码*</label>
                <div class="col-sm-9">
                    <div class="input-group w240">
                        <div class="input-group-addon"><i class="ti-lock"></i></div>
                        <asp:TextBox CssClass="form-control w200" ID="Rnewpwd" runat="server" TextMode="password" placeholder="确认新密码"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="form-group m-b-0">
                <div class="offset-sm-9 col-sm-3 text-right">
                    <asp:Button CssClass="btn btn-info" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click"></asp:Button>
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
                Display="none" ErrorMessage="原密码必需为数字、字母或二者组合" ValidationExpression="^\w+$" runat="server">
            </asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="newpwd"
                Display="none" ErrorMessage="新密码必需为数字、字母或二者组合" ValidationExpression="^\w+$" runat="server">
            </asp:RegularExpressionValidator>
        </form>
    </div>
</body>
</html>
