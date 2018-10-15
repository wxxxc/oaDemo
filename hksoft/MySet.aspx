<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MySet.aspx.cs" Inherits="hkpro.MySet" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>个人设置</title>
</head>
<body class="main">
    <form id="Setup" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <br />
                            <table cellspacing="0" cellpadding="0" border="0" width="98%">
                                <tr>
                                    <td style="height: 21px; width: 91px; background-image: url(images/tab_b_y.gif)"
                                        align="center">
                                        <a href="myset.aspx?i=2" class="mail_top">常规设定</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                        <a href="yxset.aspx" class="black">邮箱配置</a>
                                    </td>
                                    <asp:Panel ID="p_gys1" runat="server">
                                        <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                            <a href="zmset.aspx" class="black">自定义桌面</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(images/tab_b_n.gif)" align="center">
                                            <a href="dbset.aspx" class="black">自定义驾驶舱</a>
                                        </td>
                                    </asp:Panel>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <!--常规设定-->
                            <table border="0" align="center" cellpadding="0" cellspacing="0" width="98%" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>每页行数：
                                    </td>
                                    <td style="width: 80%">
                                        <asp:TextBox CssClass="mytext" ID="tb_PageCount" runat="server" Width="150" MaxLength="4"></asp:TextBox>&nbsp;0代表不分页
                                    </td>
                                </tr>
                                <asp:Panel ID="p_gys2" runat="server">
                                    <tr>
                                        <td class="form-item">
                                            登录后默认显示：
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="mp" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                <asp:ListItem Text="桌面" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="待办事项" Value="2"></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                </asp:Panel>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Label ID="Msg" runat="server" ForeColor="red"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_PageCount"
        ErrorMessage="请输入每页行数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="每页行数必须为0-1000之间的正整数"
        ControlToValidate="tb_PageCount" MinimumValue="0" MaximumValue="1000" Type="integer">&nbsp;
    </asp:RangeValidator>
    </form>
</body>
</html>
