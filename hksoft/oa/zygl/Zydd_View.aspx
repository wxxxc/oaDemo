<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zydd_View.aspx.cs" Inherits="hkpro.oa.zygl.Zydd_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Դ����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �鿴��Դ����
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 35%" class="form-item">
                            ������Դ��
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="sqzy" runat="server" CssClass="mytext" Width="300" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ʹ��ʱ�䣺
                        </td>
                        <td>
                            <asp:TextBox ID="sysj" runat="server" CssClass="mytext" Width="300" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �黹ʱ�䣺
                        </td>
                        <td>
                            <asp:TextBox ID="ghsj" runat="server" CssClass="mytext" Width="300" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ���벿�ţ�
                        </td>
                        <td>
                            <asp:TextBox ID="sqbm" runat="server" CssClass="mytext" Width="300" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��Ҫ˵����
                        </td>
                        <td>
                            <asp:TextBox ID="jysm" runat="server" Width="300" CssClass="mytextarea" TextMode="multiLine"
                                Rows="5" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>�������������
                        </td>
                        <td style="width: 400px; height: 30px">
                            <asp:TextBox ID="spyj" runat="server" TextMode="multiLine" Rows="5" Width="200px"
                                CssClass="mytextarea" />&nbsp;<img src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx?page=xpsp')"
                                    alt="ѡ��ϵͳ�ṩ���������" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" EnableClientScript="false"
                                ControlToValidate="spyj" ErrorMessage="����" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="վ����Ϣ֪ͨ������" />
                            <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ������" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SpBtn" runat="server" Text="ͬ������" OnClick="shenpi_Click" />
                <asp:Button CssClass="mybtn" ID="ThBtn" runat="server" Text="�ܾ�����" OnClick="TuiHui_Click" />
                <asp:Button CssClass="mybtn" ID="ShBtn" runat="server" Text="�ջ�����" OnClick="ShouHui_Click" />
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <!--����label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    </form>
</body>
</html>
