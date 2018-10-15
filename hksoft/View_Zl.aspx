<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View_Zl.aspx.cs" Inherits="hkpro.View_Zl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看资料</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td style="width: 35%" class="form-item">
                                        用户：
                                    </td>
                                    <td style="width: 65%">
                                        <asp:Label ID="yhbm" runat="server" Enabled="false" /><asp:Label ID="Label1" runat="server"
                                            Enabled="false" Text="-" /><asp:Label ID="xm" runat="server" Enabled="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        姓名：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xmxm" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        性别：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xb" runat="server" Width="90%" Enabled="False">
                                            <asp:ListItem Text="男" Value="男"></asp:ListItem>
                                            <asp:ListItem Text="女" Value="女"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        部门：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ssbm" runat="server" Width="90%" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        职位：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zw" runat="server" CssClass="mytext" Width="90%" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        移动电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        电子邮件：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        办公电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        传真电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        出生日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="csrq" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
