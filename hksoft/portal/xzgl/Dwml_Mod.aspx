<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dwml_Mod.aspx.cs" Inherits="hkpro.portal.xzgl.Dwml_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>��λ��¼</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                �޸ĵ�λ��¼
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>��λ���ƣ�
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="dwmc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>��λ���ͣ�
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="dwlx" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>��λ����
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="dwjb" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ϼ����ţ�
                        </td>
                        <td>
                            <asp:TextBox ID="sjbm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            �����ˣ�
                        </td>
                        <td>
                            <asp:TextBox ID="fzr" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>��λ��ַ��
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="dwdz" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �������룺
                        </td>
                        <td>
                            <asp:TextBox ID="yzbm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            ��λ�绰��
                        </td>
                        <td>
                            <asp:TextBox ID="dwdh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ������룺
                        </td>
                        <td>
                            <asp:TextBox ID="czhm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            �����ʼ���
                        </td>
                        <td>
                            <asp:TextBox ID="dzyj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �򵥽��ܣ�
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="jdjs" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dwmc"
        ErrorMessage="�����뵥λ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dwdz"
        ErrorMessage="�����뵥λ��ַ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dwlx"
        ErrorMessage="�����뵥λ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dwjb"
        ErrorMessage="�����뵥λ����">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
