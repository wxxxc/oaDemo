<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mini_Xdx_B.aspx.cs" Inherits="hkpro.portal.dxgl.Mini_Xdx_B" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>������</title>
    <script type="text/javascript">
<!--
        //�ı�����֤
        function gbcount(message, total, used, remain) {
            var max;
            max = total.value;
            if (message.value.length > max) {
                message.value = message.value.substring(0, max);
                used.value = max;
                remain.value = 0;
                alert('�������ݲ��ܳ���180���ַ���');
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
<body class="main" onload="self.status='ϵͳĿǰ����ÿ���������Ͷ������Ϊ1000�����룡'">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �����ֻ�����
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                    <tr style="height: 25px">
                        <td class="form-item">
                            <font color="red">*</font>���պ��룺
                        </td>
                        <td>
                            <asp:TextBox ID="jsr" runat="server" CssClass="mytextarea" Width="500px" ToolTip="������պ���֮������,�ŷֿ�"
                                TextMode="multiLine" Rows="3"></asp:TextBox>&nbsp;<img src="../../images/choose.gif"
                                    onclick="javascript:openAddressList('../../choose/vip/yddhview_hy.aspx');" alt="��ѡ���Ա" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jsr"
                                ErrorMessage="��ѡ����պ���">&nbsp;
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td class="form-item">
                            <font color="red">*</font>�������ݣ�<br />
                            (���<input disabled maxlength="4" name="total" size="2" value="180" class="wordtext">���ַ�)
                        </td>
                        <td>
                            <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="500px" TextMode="multiLine"
                                Rows="5" onkeydown="gbcount(this.form.nr,this.form.total,this.form.used,this.form.remain);"
                                onkeyup="gbcount(this.form.nr,this.form.total,this.form.used,this.form.remain);"></asp:TextBox>
                            <img src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/cydxview.aspx');"
                                alt="ѡ���ö���" /><br />
                            �����ַ�<input disabled maxlength="4" name="used" size="2" value="0" class="wordtext">ʣ���ַ�<input
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
                                        <asp:CheckBox ID="dsfs" runat="server" Text="��ʱ����" AutoPostBack="true" OnCheckedChanged="Dsfs_Click" />
                                    </td>
                                    <asp:Panel ID="ds" runat="server">
                                        <td style="width: 125px">
                                            <asp:Label ID="sj" runat="server" Text="ʱ�䣺"></asp:Label><asp:TextBox ID="txtSdate"
                                                onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                        </td>
                                        <td style="width: 70">
                                            <asp:DropDownList ID="xs" runat="server" Width="60">
                                                <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="00��" Value="00:"></asp:ListItem>
                                                <asp:ListItem Text="01��" Value="01:"></asp:ListItem>
                                                <asp:ListItem Text="02��" Value="02:"></asp:ListItem>
                                                <asp:ListItem Text="03��" Value="03:"></asp:ListItem>
                                                <asp:ListItem Text="04��" Value="04:"></asp:ListItem>
                                                <asp:ListItem Text="05��" Value="05:"></asp:ListItem>
                                                <asp:ListItem Text="06��" Value="06:"></asp:ListItem>
                                                <asp:ListItem Text="07��" Value="07:"></asp:ListItem>
                                                <asp:ListItem Text="08��" Value="08:"></asp:ListItem>
                                                <asp:ListItem Text="09��" Value="09:"></asp:ListItem>
                                                <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                <asp:ListItem Text="11��" Value="11:"></asp:ListItem>
                                                <asp:ListItem Text="12��" Value="12:"></asp:ListItem>
                                                <asp:ListItem Text="13��" Value="13:"></asp:ListItem>
                                                <asp:ListItem Text="14��" Value="14:"></asp:ListItem>
                                                <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                <asp:ListItem Text="16��" Value="16:"></asp:ListItem>
                                                <asp:ListItem Text="17��" Value="17:"></asp:ListItem>
                                                <asp:ListItem Text="18��" Value="18:"></asp:ListItem>
                                                <asp:ListItem Text="19��" Value="19:"></asp:ListItem>
                                                <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                <asp:ListItem Text="21��" Value="21:"></asp:ListItem>
                                                <asp:ListItem Text="22��" Value="22:"></asp:ListItem>
                                                <asp:ListItem Text="23��" Value="23:"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="fz" runat="server" Width="60">
                                                <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="00��" Value="00:"></asp:ListItem>
                                                <asp:ListItem Text="05��" Value="05:"></asp:ListItem>
                                                <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                <asp:ListItem Text="25��" Value="25:"></asp:ListItem>
                                                <asp:ListItem Text="30��" Value="30:"></asp:ListItem>
                                                <asp:ListItem Text="35��" Value="35:"></asp:ListItem>
                                                <asp:ListItem Text="40��" Value="40:"></asp:ListItem>
                                                <asp:ListItem Text="45��" Value="45:"></asp:ListItem>
                                                <asp:ListItem Text="50��" Value="50:"></asp:ListItem>
                                                <asp:ListItem Text="55��" Value="55:"></asp:ListItem>
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
                            <font color="red">��ʾ1���ֻ�����ÿ����60���֣�</font><br />
                            <font color="red">��ʾ2��ϵͳ���Զ��˳�����"�Ƿ�������ն���"����Ϊ"��"�Ļ�Ա��</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button ID="button1" Text=" ���� " CssClass="mybtn" runat="server" OnClick="Send_Click"
                    CausesValidation="true" />
                <input type="button" name="BackBtn" value=" �ر� " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nr"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="�����붨ʱ����ʱ�䣨���ڣ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="xs"
        ErrorMessage="��ѡ��ʱ����ʱ�䣨Сʱ��">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fz"
        ErrorMessage="��ѡ��ʱ����ʱ�䣨���ӣ�">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
