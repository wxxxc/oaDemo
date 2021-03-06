<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fbdbrw_yhadd.aspx.cs" Inherits="hkpro.oa.rwgl.fbdbrw_yhadd"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>新增待办任务</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script>
        function openAddressList(stringfiled) {
            window.open(stringfiled, "选择用户", 'width=600,height=450,top=' + (screen.height - 450) / 2 + ',left=' + (screen.width - 600) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="width: 80%; height: 25px">新增待办任务
                </td>
                <td class="td_base" style="width: 20%">&nbsp;
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
                                            任务来源：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="rwly" runat="server" CssClass="mytext" Width="93%" style="color:red; font-weight:bold"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>任务标题：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="rwbt" runat="server" CssClass="mytext" Width="93%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>选择接收人：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="jsdx" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="580" ToolTip="多个之间请用,号分开"></asp:TextBox>
                                            <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview_yh.aspx');" alt="选择用户" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <%--<font color="red">*</font>--%>选择牵头领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="qtld" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="580" ToolTip="多个之间请用,号分开"></asp:TextBox>
                                            <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview1.aspx');" alt="选择" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <%--<font color="red">*</font>--%>选择责任领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="zrld" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="580" ToolTip="多个之间请用,号分开"></asp:TextBox>
                                            <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview2.aspx');" alt="选择" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <%--<font color="red">*</font>--%>选择责任人：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="zrr" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="580" ToolTip="多个之间请用,号分开"></asp:TextBox>
                                            <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview3.aspx');" alt="选择" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <%--<font color="red">*</font>--%>选择牵头部门：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="qtbm" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="580" ToolTip="多个之间请用,号分开"></asp:TextBox>
                                            <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview_dw.aspx');" alt="选择" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <%--<font color="red">*</font>--%>选择责任部门：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="zrbm" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="580" ToolTip="多个之间请用,号分开"></asp:TextBox>
                                            <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview4.aspx');" alt="选择" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" style="width: 15%">
                                            <font color="red">*</font>任务等级：
                                        </td>
                                        <td style="width: 35%">
                                            <asp:DropDownList ID="rwxz" runat="server" Width="90%">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="form-item" style="width: 20%">
                                            <font color="red">*</font>紧急程度：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:DropDownList ID="jjcd" runat="server" Width="90%">
                                                <asp:ListItem Text="高" Value="高"></asp:ListItem>
                                                <asp:ListItem Text="中" Value="中" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="低" Value="低"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item"></td>
                                        <td colspan="2">
                                            <asp:CheckBox ID="ynxs" runat="server" AutoPostBack="true" OnCheckedChanged="ynxs_click"
                                                Text="是否限时待办"></asp:CheckBox>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <asp:Panel ID="Panelrq" runat="server" ScrollBars="Auto">
                                        <tr>
                                            <td class="form-item">
                                                <font color="red">*</font>开始日期：
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
                                                <font color="red">*</font>截止日期：
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
                                                        <td></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td class="form-item">任务内容：
                                        </td>
                                        <td colspan="3">
                                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%; height: 180px;"></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">附件名：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="fjname" runat="server" CssClass="mytext" Width="10%"></asp:TextBox>
                                            附件：<input id="fj" runat="server" type="file" style="width: 80%" class="mytext" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height: 30">
                                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"></asp:Button>
                                <asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                    class="btn btn-warning" />
                                <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rwbt"
            ErrorMessage="请输入任务标题">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jjcd"
            ErrorMessage="请选择紧急程度">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rwxz"
            ErrorMessage="请选择任务等级">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="jsdx"
            ErrorMessage="请选择接收人">&nbsp;
        </asp:RequiredFieldValidator>
        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="zrbm"
            ErrorMessage="请选择责任部门">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="qtld"
            ErrorMessage="请选择牵头领导">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="zrld"
            ErrorMessage="请选择责任领导">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="zrr"
            ErrorMessage="请选择责任人">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="qtbm"
            ErrorMessage="请选择牵头部门">&nbsp;
        </asp:RequiredFieldValidator>--%>
        <script type="text/javascript">
            var ue = UE.getEditor('editor');
        </script>
    </form>
</body>
</html>
