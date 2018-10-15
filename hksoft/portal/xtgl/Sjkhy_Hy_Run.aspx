<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sjkhy_Hy_Run.aspx.cs" Inherits="hkpro.portal.xtgl.Sjkhy_Hy_Run" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>数据库还原</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main" onload="remove_load();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 25px;" class="td_base">
                <font color="yellow">是否确定还原备份日期为</font><asp:Label ID="lblrq" runat="server" ForeColor="Red"></asp:Label><font
                    color="yellow">的数据库：</font><asp:Label ID="lbldb" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="form">
                    <tr>
                        <td style="height: 30px" align="center">
                            <font color="red">为避免数据丢失，强烈建议您在无人使用本系统时再执行数据还原！</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="确 定" OnClick="Save_Click" />
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
