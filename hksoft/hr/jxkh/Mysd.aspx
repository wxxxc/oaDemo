<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mysd.aspx.cs" Inherits="hkpro.oa.jxkh.Mysd" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>查询密钥设定</title>
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("oldpwd");  //设置初始光标焦点
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>

</head>
<body class="main" onload="SetFocus();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tbody>
                        <tr>
                            <td>
                                <table border="0" align="center" cellpadding="0" cellspacing="0" class="form" width="100%">
                                    <tr>
                                        <td align="right" style="width: 20%" class="form-item">
                                            原查询密钥：
                                        </td>
                                        <td style="width: 80%">
                                            <asp:TextBox CssClass="mytext" ID="oldpwd" runat="server" TextMode="password" Width="150"
                                                MaxLength="20"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            新查询密钥：
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="mytext" ID="newpwd" runat="server" TextMode="Password" Width="150"
                                                MaxLength="20"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            确认新密钥：
                                        </td>
                                        <td>
                                            <asp:TextBox CssClass="mytext" ID="Rnewpwd" runat="server" TextMode="Password" Width="150"
                                                MaxLength="20"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="height: 30">
                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click"
                                    AccessKey="s"></asp:Button>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="newpwd"
        ErrorMessage="请输入新查询密钥">&nbsp; </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rnewpwd"
        ErrorMessage="请输入确认密钥">&nbsp; </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="newpwd" Type="String"
        ControlToCompare="rnewpwd" ErrorMessage="新密钥与确认密钥不符！">&nbsp;</asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="oldpwd"
        Display="none" ErrorMessage="原密钥必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="newpwd"
        Display="none" ErrorMessage="新密钥必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
