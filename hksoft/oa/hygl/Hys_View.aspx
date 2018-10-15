<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hys_View.aspx.cs" Inherits="hkpro.oa.hygl.Hys_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�����ҹ���</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>������
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 35%" class="form-item">
                            <font color="red">*</font>���������ƣ�
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox CssClass="mytext" ID="mc" runat="server" Width="300" MaxLength="25"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>������Ա��
                        </td>
                        <td>
                            <asp:DropDownList ID="glry" runat="server" Width="300">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ģ������
                        </td>
                        <td>
                            <asp:TextBox ID="gmrl" runat="server" CssClass="mytext" Width="300" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��ϵ�绰��
                        </td>
                        <td>
                            <asp:TextBox ID="lxdh" runat="server" CssClass="mytext" Width="300" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            <asp:CheckBox ID="fwy" runat="server" Text="�Ƿ��з�����Ա" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �������ţ�
                        </td>
                        <td>
                            <asp:DropDownList ID="ssbm" runat="server" Width="300">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��飺
                        </td>
                        <td>
                            <asp:TextBox ID="jj" runat="server" CssClass="mytextarea" Width="300" TextMode="multiLine"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button class="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button class="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <asp:Button class="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"
                    Visible="false" OnClick="Del_Click"></asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mc"
        ErrorMessage="���������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="glry"
        ErrorMessage="��ѡ�������Ա">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="gmrl"
        Display="none" ErrorMessage="��ģ��������Ϊ����" ValidationExpression="^\d+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="lxdh"
        Display="none" ErrorMessage="��ϵ�绰��ʽ���󣬲ο���ʽ010-62288888��62288888��010-62288888-815"
        ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}" runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
