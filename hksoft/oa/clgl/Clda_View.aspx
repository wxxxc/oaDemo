<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clda_View.aspx.cs" Inherits="hkpro.oa.clgl.Clda_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��������
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
                                        <font color="red">*</font>���ƺţ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="cph" runat="server" CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>�������ƣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="clmc" runat="server" Width="90%" CssClass="mytext" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�������(��)��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zdzs" runat="server" CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>�������ڣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="qyrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����(��)��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmj" runat="server" CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ��ֵ(��)��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cz" runat="server" Width="90%" CssClass="mytext" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����ͺţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cpxh" runat="server" CssClass="mytext" Width="90%" MaxLength="25"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �������ţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fdjh" runat="server" Width="90%" CssClass="mytext" MaxLength="25"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ܺţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cjh" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ��ʻ֤�ţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xszh" runat="server" Width="90%" CssClass="mytext" MaxLength="25"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>������Ա��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="glry" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        ����״̬��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="clzt" runat="server" Width="90%" CssClass="mytext" Enabled="false"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="jdr_label" runat="server" Enabled="false"></asp:Label>
                                        <asp:Label ID="jdsj" runat="server" Enabled="false"></asp:Label>
                                        <asp:Label ID="jdr" runat="server" Enabled="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                                Visible="false"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" Visible="false"
                                OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" OnClick="Del_Click"></asp:Button>
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cph"
        ErrorMessage="�����복�ƺ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="clmc"
        ErrorMessage="�����복������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator111" runat="server" ControlToValidate="glry"
        ErrorMessage="��ѡ�������Ա">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="qyrq"
        ErrorMessage="��ѡ����������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="zdzs"
        Display="none" ErrorMessage="�������(��)����Ϊ����" ValidationExpression="^\d+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="qyrq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="�������ڸ�ʽ���󣬸�ʽ�ο�1980-07-07��1980/07/07" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="gmj"
        Display="none" ErrorMessage="�����(��)����Ϊ��ֵ��" ValidationExpression="(^\d+\.\d+$)|(^\d+$)"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="cz"
        Display="none" ErrorMessage="��ֵ(��)����Ϊ��ֵ��" ValidationExpression="(^\d+\.\d+$)|(^\d+$)"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="bz"
        Display="none" ErrorMessage="��ע���ݲ��ܳ���50����" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
