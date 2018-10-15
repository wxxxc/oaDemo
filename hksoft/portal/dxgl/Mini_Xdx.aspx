<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mini_Xdx.aspx.cs" Inherits="hkpro.portal.dxgl.Mini_Xdx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
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
<body class="main">
    <form id="form1" runat="server">
    <table border="0" width="100%">
        <tr>
            <td colspan="2" style="height: 10">
            </td>
        </tr>
        <tr style="height: 25px;">
            <td align="right" style="width: 80">
                <font color="red">*</font>手机号码：
            </td>
            <td>
                <asp:TextBox ID="jsr" runat="server" CssClass="mytextarea" Width="90%" ToolTip="多个接收号码之间请用,号分开"
                    TextMode="multiLine" Rows="3"></asp:TextBox><img src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/yddhview.aspx');"
                        alt="请选择接收号码" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <font color="#999999">提示：多个手机号码间请用,号分开</font>
            </td>
        </tr>
        <tr>
            <td align="right">
                <font color="red">*</font>短信内容：
            </td>
            <td>
                <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                    Rows="7" onkeydown="gbcount(this.form.nr,this.form.total,this.form.used,this.form.remain);"
                    onkeyup="gbcount(this.form.nr,this.form.total,this.form.used,this.form.remain);"></asp:TextBox><img
                        src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/cydxview.aspx');"
                        alt="选择常用短信" /><br />
                已用字符<input disabled maxlength="4" name="used" size="2" value="0" class="wordtext">剩余字符<input
                    disabled maxlength="4" name="remain" size="2" value="180" class="wordtext">
                最多字符<input disabled maxlength="4" name="total" size="2" value="180" class="wordtext">
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="height: 30px">
                <asp:Button ID="button1" CssClass="mybtn" Text="发 送" runat="server" OnClick="Send_Click"
                    CausesValidation="true" />
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jsr"
        ErrorMessage="请选择接收号码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nr"
        ErrorMessage="请输入短信内容">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
