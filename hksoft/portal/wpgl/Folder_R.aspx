<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Folder_R.aspx.cs" Inherits="hkpro.portal.wpgl.Folder_R" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>分类目录</title>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td class="td_base" style="height: 25">
                &nbsp;<asp:Label ID="lblsta" runat="server" Text="-> 修改状态" ForeColor="Yellow" Font-Size="Medium"></asp:Label>
            </td>
            <td align="right" class="td_base">
                <asp:Button CssClass="mybtn" ID="AddBtn" runat="server" Text="增 加" OnClick="Save_Click"
                    CausesValidation="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click"
                    Enabled="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                    OnClientClick="return confirm('确认要执行删除吗？')" Enabled="false"></asp:Button>
                <asp:Button ID="ReturnBtn" runat="server" Text="返 回" CssClass="mybtn" OnClick="ReturnBtn_Click"
                    CausesValidation="False" />&nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
        <tr>
            <td style="width: 20%" class="form-item">
                <font color="red">*</font>文件夹名称：
            </td>
            <td style="width: 80%">
                <asp:TextBox ID="mlid" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="mlmc" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="form-item">
                上级文件夹：
            </td>
            <td>
                <asp:DropDownList ID="DirList" runat="server" Width="80%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" class="form-item">
            </td>
            <td>
                <asp:CheckBox ID="share" Text="是否共享此文件夹" runat="server" />
                <asp:Image ID="Image1" runat="server" ImageUrl="../../images/help.gif" ToolTip="其它用户将可以搜索到您共享的文件夹下的内容" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mlmc"
        ErrorMessage="请输入文件夹名称">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
