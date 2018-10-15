<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cldd_View.aspx.cs" Inherits="hkpro.oa.clgl.Cldd_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>车辆调度</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                查看车辆申请
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
                                    <td style="width: 20%" class="form-item">
                                        发车地点：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="fcdd" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td style="width: 20%" class="form-item">
                                        到达地点：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="dddd" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        申请部门：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sqbm" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        乘坐人数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czrs" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        行驶时间(自)：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        行驶时间(至)：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="jssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        乘车形式：
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="ccxs" runat="server" RepeatLayout="Flow" RepeatDirection="horizontal">
                                            <asp:ListItem Text="包车" Value="包车" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="普通" Value="普通"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        出车事由：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ccsy" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        申请车辆：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xycl" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        申请驾驶员：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="jsy" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <hr class="hr1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>分配车辆：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xzcl" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        分配驾驶员：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xzjsy" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>审批意见：
                                    </td>
                                    <td colspan="3" style="width: 400px; height: 30px">
                                        <asp:TextBox ID="spyj" runat="server" TextMode="multiLine" Rows="2" Width="340px"
                                            CssClass="mytextarea" />&nbsp;<img src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx?page=xpsp')"
                                                alt="选择系统提供的审批意见" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" EnableClientScript="false"
                                            ControlToValidate="spyj" ErrorMessage="必输">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <asp:Panel ID="Panelghsm" runat="server" Visible="false">
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>归还说明：
                                        </td>
                                        <td colspan="3" style="width: 400px; height: 30px">
                                            <asp:TextBox ID="ghsm" runat="server" TextMode="multiLine" Rows="2" Width="340px"
                                                CssClass="mytextarea" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="false"
                                                ControlToValidate="ghsm" ErrorMessage="必输">
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知申请人" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知申请人" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SpBtn" runat="server" Text="同意使用" OnClick="shenpi_Click" />
                            <asp:Button CssClass="mybtn" ID="ThBtn" runat="server" Text="拒绝使用" OnClick="TuiHui_Click"
                                CausesValidation="false" />
                            <asp:Button CssClass="mybtn" ID="QRGH" runat="server" Text="确认归还" CausesValidation="false"
                                OnClick="QRGH_Click" Visible="false"></asp:Button>
                            <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="xzcl"
        ErrorMessage="请选择车辆">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
