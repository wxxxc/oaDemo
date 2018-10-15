<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjdbg_View.aspx.cs" Inherits="hkpro.oa.kqgl.Qjdbg_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>请假单变更</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                变更请假单明细
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
                                    <td class="form-item">
                                        请假类型：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="qjlx" runat="server" Width="90%" AutoPostBack="true" OnSelectedIndexChanged="qjlx_SelectedIndexChanged">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="年假" Value="年假"></asp:ListItem>
                                            <asp:ListItem Text="探亲假" Value="探亲假"></asp:ListItem>
                                            <asp:ListItem Text="婚假" Value="婚假"></asp:ListItem>
                                            <asp:ListItem Text="丧假" Value="丧假"></asp:ListItem>
                                            <asp:ListItem Text="产假" Value="产假"></asp:ListItem>
                                            <asp:ListItem Text="公假" Value="公假"></asp:ListItem>
                                            <asp:ListItem Text="事假" Value="事假"></asp:ListItem>
                                            <asp:ListItem Text="病假" Value="病假"></asp:ListItem>
                                        </asp:DropDownList>
                                        <font color="red">*</font>
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        <asp:Label ID="lblgjlb" runat="server" Text="公假类别：" Visible="false"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="gjlb" runat="server" Width="90%" Visible="false">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="培训类公假" Value="培训类公假"></asp:ListItem>
                                            <asp:ListItem Text="其它类公假" Value="其它类公假"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        请假开始日期：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="qjkssj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="63%"></asp:TextBox>
                                        <asp:DropDownList ID="qjkssd" runat="server">
                                            <asp:ListItem Text="上午" Value="上午"></asp:ListItem>
                                            <asp:ListItem Text="下午" Value="下午"></asp:ListItem>
                                            <asp:ListItem Text="晚上" Value="晚上"></asp:ListItem>
                                        </asp:DropDownList>
                                        <font color="red">*</font>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        请假截止日期：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="qjjssj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="63%"></asp:TextBox>
                                        <asp:DropDownList ID="qjjssd" runat="server">
                                            <asp:ListItem Text="上午" Value="上午"></asp:ListItem>
                                            <asp:ListItem Text="下午" Value="下午"></asp:ListItem>
                                            <asp:ListItem Text="晚上" Value="晚上"></asp:ListItem>
                                        </asp:DropDownList>
                                        <font color="red">*</font>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        请假天数：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="qjts" runat="server" CssClass="mytext" Width="90%"></asp:TextBox><font
                                            color="red">*</font>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        请假理由：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblqjly" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        工作调整情况：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblgztzqk" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        请假附件：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="fujian" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        申请部门：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqbmmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        申请人：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        变更原因：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bgyy" runat="server" Width="96%" TextMode="MultiLine" Rows="2" CssClass="mytextarea" /><font
                                            color="red">*</font>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="确认变更" OnClick="Save_Click"
                                ></asp:Button>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click"
                                 OnClientClick="return confirm('确认要删除该张请假单吗？')"></asp:Button>
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="qjkssj"
        ErrorMessage="请选择请假开始日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="qjjssj"
        ErrorMessage="请选择请假截止日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="qjts"
        ErrorMessage="请输入请假天数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="qjts"
        Display="none" ErrorMessage="请假天数必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bgyy"
        ErrorMessage="请输入变更原因">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
