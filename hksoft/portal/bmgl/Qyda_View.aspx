<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qyda_View.aspx.cs" Inherits="hkpro.portal.bmgl.Qyda_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>������λά��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>������λ��Ϣ
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>��λ���룺
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="gsbm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>��λ���ƣ�
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="gsmc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>��λ��ƣ�
                        </td>
                        <td>
                            <asp:TextBox ID="gsjc" runat="server" CssClass="mytext" Width="90%" MaxLength="6"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            ��λ��ַ��
                        </td>
                        <td>
                            <asp:TextBox ID="gsdz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
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
                            ���䣺
                        </td>
                        <td>
                            <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �绰��
                        </td>
                        <td>
                            <asp:TextBox ID="gsdh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            ���棺
                        </td>
                        <td>
                            <asp:TextBox ID="gscz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
<%--                    <tr>
                        <td class="form-item">
                            �������У�
                        </td>
                        <td>
                            <asp:TextBox ID="khyh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            �����ʺţ�
                        </td>
                        <td>
                            <asp:TextBox ID="yhzh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false" />
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                <input type="button" name="CloseBtn" value="�ر�" class="btn btn-warning" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gsbm"
        ErrorMessage="�����뵥λ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="gsmc"
        ErrorMessage="�����뵥λ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gsjc"
        ErrorMessage="�����뵥λ���">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
