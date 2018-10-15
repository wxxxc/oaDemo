<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign_Add_cladd.aspx.cs"
    Inherits="hkpro.workflow.form.FormDesign_Add_cladd" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>表单设计 - 新增字段</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="4" cellspacing="1" width="100%">
        <tr>
            <td colspan="2" height="30">
            </td>
        </tr>
        <tr>
            <td width="20%" class="td_yes">
                字段名称：
            </td>
            <td width="80%">
                <asp:TextBox ID="Name" runat="server" Width="90%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td_yes">
                字段类型：
            </td>
            <td>
                <asp:DropDownList ID="Type" runat="server" Width="90%">
                    <asp:ListItem>[常规型]</asp:ListItem>
                    <asp:ListItem>[数字型]</asp:ListItem>
                    <asp:ListItem>[电子印章]</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="26">
                <asp:Button ID="SaveBtn" runat="server" Text="保存" CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="CloseBtn" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value="关闭" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Name"
        ErrorMessage="请输入字段名称">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
