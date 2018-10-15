<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yhcx_View.aspx.cs" Inherits="hkpro.portal.yhgl.Yhcx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>用户查询</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看用户信息
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        用户编码：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="yhbm" runat="server" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        姓名：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        所属部门：
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="96%" Enabled="False">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        职位：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zwmc" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        角色：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gwjs" runat="server" Width="90%" ReadOnly="true" CssClass="mytext"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        电子邮件：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        移动电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        有效开始日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSdate" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        有效截止日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEdate" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        性别：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xb" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        出生日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="csrq" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        办公电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        短号：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        状态：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zt" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" ReadOnly="true" Width="96%"
                                            TextMode="multiLine" Rows="6"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
