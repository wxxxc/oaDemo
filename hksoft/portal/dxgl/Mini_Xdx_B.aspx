<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mini_Xdx_B.aspx.cs" Inherits="hkpro.portal.dxgl.Mini_Xdx_B" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>发短信</title>
    <script type="text/javascript">
<!--
        //文本域验证
        function gbcount(message, total, used, remain) {
            var max;
            max = total.value;
            if (message.value.length > max) {
                message.value = message.value.substring(0, max);
                used.value = max;
                remain.value = 0;
                alert('短信内容不能超过180个字符！');
            }
            else {
                used.value = message.value.length;
                remain.value = max - used.value;
            }
        }
        //-->
-->
    </script>
</head>
<body class="main" onload="self.status='系统目前限制每次批量发送短信最高为1000个号码！'">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                发送手机短信
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                    <tr style="height: 25px">
                        <td class="form-item">
                            <font color="red">*</font>接收号码：
                        </td>
                        <td>
                            <asp:TextBox ID="jsr" runat="server" CssClass="mytextarea" Width="500px" ToolTip="多个接收号码之间请用,号分开"
                                TextMode="multiLine" Rows="3"></asp:TextBox>&nbsp;<img src="../../images/choose.gif"
                                    onclick="javascript:openAddressList('../../choose/vip/yddhview_hy.aspx');" alt="请选择会员" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jsr"
                                ErrorMessage="请选择接收号码">&nbsp;
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td class="form-item">
                            <font color="red">*</font>短信内容：<br />
                            (最多<input disabled maxlength="4" name="total" size="2" value="180" class="wordtext">个字符)
                        </td>
                        <td>
                            <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="500px" TextMode="multiLine"
                                Rows="5" onkeydown="gbcount(this.form.nr,this.form.total,this.form.used,this.form.remain);"
                                onkeyup="gbcount(this.form.nr,this.form.total,this.form.used,this.form.remain);"></asp:TextBox>
                            <img src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/cydxview.aspx');"
                                alt="选择常用短信" /><br />
                            已用字符<input disabled maxlength="4" name="used" size="2" value="0" class="wordtext">剩余字符<input
                                disabled maxlength="4" name="remain" size="2" value="180" class="wordtext">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            &nbsp;
                        </td>
                        <td style="height: 20px">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="width: 160">
                                        <asp:CheckBox ID="dsfs" runat="server" Text="定时发送" AutoPostBack="true" OnCheckedChanged="Dsfs_Click" />
                                    </td>
                                    <asp:Panel ID="ds" runat="server">
                                        <td style="width: 125px">
                                            <asp:Label ID="sj" runat="server" Text="时间："></asp:Label><asp:TextBox ID="txtSdate"
                                                onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                        </td>
                                        <td style="width: 70">
                                            <asp:DropDownList ID="xs" runat="server" Width="60">
                                                <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="00点" Value="00:"></asp:ListItem>
                                                <asp:ListItem Text="01点" Value="01:"></asp:ListItem>
                                                <asp:ListItem Text="02点" Value="02:"></asp:ListItem>
                                                <asp:ListItem Text="03点" Value="03:"></asp:ListItem>
                                                <asp:ListItem Text="04点" Value="04:"></asp:ListItem>
                                                <asp:ListItem Text="05点" Value="05:"></asp:ListItem>
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
                                                <asp:ListItem Text="23点" Value="23:"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="fz" runat="server" Width="60">
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
                                    </asp:Panel>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            <font color="red">提示1：手机短信每条限60个字！</font><br />
                            <font color="red">提示2：系统将自动滤除档案"是否允许接收短信"属性为"否"的会员！</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button ID="button1" Text=" 发送 " CssClass="mybtn" runat="server" OnClick="Send_Click"
                    CausesValidation="true" />
                <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nr"
        ErrorMessage="请输入短信内容">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="请输入定时发送时间（日期）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="xs"
        ErrorMessage="请选择定时发送时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fz"
        ErrorMessage="请选择定时发送时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
