<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_lb_mod.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_lb_mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('Name').value == '') {
            alert('请输入名称');
            form1.Name.focus();
            return false;
        }

        if (document.getElementById('PxNum').value == '') {
            alert('请输入排序号，如果没有可填0');
            form1.PxNum.focus();
            return false;
        }

        if (document.getElementById('PxNum').value != '') {
            var objRe = /^\d+(\.\d+)?$/;
            if (!objRe.test(document.getElementById('PxNum').value)) {
                alert("排序号必须为正数");
                form1.PxNum.focus();
                return false;
            }
        }
    }
</script>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>员工通讯录</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table class="form" border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="form-item" style="width: 20%">
                    <font color="red">*</font>类别名称：
                </td>
                <td colspan="3" style="width: 80%">
                    <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="form-item">
                    <font color="red">*</font>排序号：
                </td>
                <td colspan="3">
                    <asp:TextBox ID="PxNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="form-item">上级类别：
                </td>
                <td colspan="3">
                    <asp:DropDownList ID="ParentNodesID" runat="server" Width="90%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4" height="25">
                    <asp:Button ID="Button1" runat="server" Text="确定" CssClass="mybtn" OnClick="Button1_Click" />
                    <input id="Button2" class="mybtn" onclick="history.back()" type="button" value="返回" />
                </td>
            </tr>
        </table>
        <asp:TextBox ID="GxUsername" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
    </form>
</body>
</html>
