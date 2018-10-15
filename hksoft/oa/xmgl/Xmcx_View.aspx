<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmcx_View.aspx.cs" Inherits="hkpro.oa.xmgl.Xmcx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>项目查询</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>项目清单
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                    <tr>
                        <td style="height: 10px">
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                <tr>
                                    <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                        align="center">
                                        <a href="xmcx_view.aspx?id=<%=xmid.Text %>" class="mail_top">项目清单</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="xmcx_gzjl.aspx?id=<%=xmid.Text %>" class="black">跟踪记录</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="xmcx_lxr.aspx?id=<%=xmid.Text %>" class="black">联系人</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="xmcx_fj.aspx?id=<%=xmid.Text %>" class="black">项目附件</a>
                                    </td>
                                    <td align="right" colspan="4">
                                        <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                                    </td>
                                </tr>
                            </table>
                            <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                <tr>
                                    <td class="form-item">
                                        项目名称：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="xmmc" runat="server" CssClass="mytext" Width="96%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        所属省份：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sssf" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        所属城市：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sscs" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        项目进度：
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="xmjd" runat="server" Width="96%">
                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="可行性报告" Value="可行性报告"></asp:ListItem>
                                            <asp:ListItem Text="领导同意" Value="领导同意"></asp:ListItem>
                                            <asp:ListItem Text="公司通过" Value="公司通过"></asp:ListItem>
                                            <asp:ListItem Text="双方协商" Value="双方协商"></asp:ListItem>
                                            <asp:ListItem Text="签订协议" Value="签订协议"></asp:ListItem>
                                            <asp:ListItem Text="项目完成" Value="项目完成"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
