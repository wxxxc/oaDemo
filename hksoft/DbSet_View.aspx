<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DbSet_View.aspx.cs" Inherits="hkpro.DbSet_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="CssJs/WebCalendar.js"></script>
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>驾驶舱设置</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                新增数据项
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                    <tr>
                        <td colspan="2">
                            <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                                <tr>
                                    <td class="form-item" width="20%">
                                        数据项名称：
                                    </td>
                                    <td width="80%">
                                        <asp:DropDownList ID="Name" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        显示条数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="topnum" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="BtnS" runat="server" Text="确 定" OnClick="Save_Click" />
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Name"
        ErrorMessage="已无可选数据项，请关闭此窗口！">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="topnum"
        ErrorMessage="请输入显示条数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="topnum"
        Display="none" ErrorMessage="显示条数应为大于0的整数" ValidationExpression="^[1-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
