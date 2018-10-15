<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs_Show.aspx.cs" Inherits="hkpro.oa.zsgl.wdzs_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>查看知识</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看知识
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            小类名称：
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="LittleName" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            知识名称：
                        </td>
                        <td>
                            <asp:TextBox ID="TitleName" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            知识描述：
                        </td>
                        <td>
                            <asp:TextBox ID="Content" runat="server" CssClass="mytextarea" Width="90%" TextMode="MultiLine"
                                Rows="3" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            作者有话：
                        </td>
                        <td>
                            <asp:TextBox ID="AthourSay" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            知识关键字：
                        </td>
                        <td>
                            <asp:TextBox ID="KeyWord" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            阅读权限：
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server" TextMode="MultiLine" Width="90%" Rows="3"
                                CssClass="mytextarea" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            最后更新时间：
                        </td>
                        <td>
                            <asp:TextBox ID="Settime" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
