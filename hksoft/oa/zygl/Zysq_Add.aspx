<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zysq_Add.aspx.cs" Inherits="hkpro.oa.zygl.Zysq_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>我的申请</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                新增资源申请
            </td>
            <td class="td_base" style="width: 20%">
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
                                        <font color="red">*</font>资源分类：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="zyfl" runat="server" Width="90%" CssClass="mytext" AutoPostBack="true"
                                            OnSelectedIndexChanged="ZYFL_Click">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>申请资源：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="sqzy" runat="server" Width="90%" CssClass="mytext">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>使用时间：
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="100" MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="sxs" runat="server" Width="60">
                                                        <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="06点" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07点" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08点" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09点" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10点" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11点" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12点" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13点" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14点" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15点" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16点" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17点" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18点" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19点" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20点" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21点" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22点" Value="22:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                        <asp:ListItem Text="分钟" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00分" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="05分" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="10分" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="15分" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="20分" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="25分" Value="25:"></asp:ListItem>
                                                        <asp:ListItem Text="30分" Value="30:"></asp:ListItem>
                                                        <asp:ListItem Text="35分" Value="35:"></asp:ListItem>
                                                        <asp:ListItem Text="40分" Value="40:"></asp:ListItem>
                                                        <asp:ListItem Text="45分" Value="45:"></asp:ListItem>
                                                        <asp:ListItem Text="50分" Value="50:"></asp:ListItem>
                                                        <asp:ListItem Text="55分" Value="55:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>归还时间：
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="100" MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="exs" runat="server" Width="60">
                                                        <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="06点" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07点" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08点" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09点" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10点" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11点" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12点" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13点" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14点" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15点" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16点" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17点" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18点" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19点" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20点" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21点" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22点" Value="22:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="efz" runat="server" Width="60">
                                                        <asp:ListItem Text="分钟" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00分" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="05分" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="10分" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="15分" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="20分" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="25分" Value="25:"></asp:ListItem>
                                                        <asp:ListItem Text="30分" Value="30:"></asp:ListItem>
                                                        <asp:ListItem Text="35分" Value="35:"></asp:ListItem>
                                                        <asp:ListItem Text="40分" Value="40:"></asp:ListItem>
                                                        <asp:ListItem Text="45分" Value="45:"></asp:ListItem>
                                                        <asp:ListItem Text="50分" Value="50:"></asp:ListItem>
                                                        <asp:ListItem Text="55分" Value="55:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>使用部门：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="sybm" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        简要说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jysm" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息提醒资源管理员" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信提醒资源管理员" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="jszt" runat="server" Text="检索状态" OnClick="JSzt_Click"
                                Visible="false"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                CssClass="mybtn"></asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--隐藏label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sqzy"
        ErrorMessage="请选择申请资源">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="zyfl"
        ErrorMessage="请选择资源分类">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator124" runat="server" ControlToValidate="sybm"
        ErrorMessage="请选择使用部门">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="请输入使用时间（日期）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sxs"
        ErrorMessage="请选择使用时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sfz"
        ErrorMessage="请选择使用时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="请输入归还时间（日期）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="exs"
        ErrorMessage="请选择归还时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="efz"
        ErrorMessage="请选择归还时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtSdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="使用时间格式错误，格式参考2008-01-01、2008/01/01" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtEdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="归还时间格式错误，格式参考2008-12-31、2008/12/31" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="jysm"
        Display="none" ErrorMessage="简要说明不能超过50个字" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
