<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MySignet_Mod.aspx.cs" Inherits="hkpro.workflow.seal.MySignet_Mod1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>个人私章</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">   
        <tr>
            <td valign="top" align="center">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>印章名称：
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="sName" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>原印章密码：
                        </td>
                        <td>
                            <asp:TextBox ID="oldsPwd" runat="server" CssClass="mytext" Width="96%" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>新印章密码：
                        </td>
                        <td>
                            <asp:TextBox ID="newsPwd" runat="server" CssClass="mytext" Width="96%" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font> 确认新密码：
                        </td>
                        <td>
                            <asp:TextBox ID="newsPwdConfirm" runat="server" CssClass="mytext" Width="96%" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            备注：
                        </td>
                        <td>
                            <asp:TextBox ID="sRemark" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center">
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text=" 保存 " OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value=" 返回 " class="btn btn-info" onclick="javascript:location.href='MySignet.aspx';" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sName"
        ErrorMessage="请输入印章名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldsPwd"
        ErrorMessage="请输入原印章密码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="newsPwd"
        ErrorMessage="请输入新印章密码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="newsPwdConfirm"
        ErrorMessage="请输入确认新密码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" ControlToValidate="newsPwd"
        Display="none" ErrorMessage="新印章密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="newsPwd"
        Type="String" ControlToCompare="newsPwdConfirm" ErrorMessage="新印章密码与确认新密码不符！">&nbsp;
    </asp:CompareValidator>
    </form>
</body>
</html>
