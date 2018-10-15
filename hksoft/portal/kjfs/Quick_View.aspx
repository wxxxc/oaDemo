<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Quick_View.aspx.cs" Inherits="hkpro.portal.kjfs.Quick_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�ҵĿ�ݷ�ʽ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>��ݷ�ʽ
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>���ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="mc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ���
                        </td>
                        <td>
                            <asp:RadioButtonList ID="qlb" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                Width="90%">
                                <asp:ListItem Text="��ַ" Value="1" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="��ִ���ļ�" Value="2"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ͼ�꣺
                        </td>
                        <td>
                            <asp:DropDownList ID="tb" runat="server" Width="90%" AutoPostBack="true" OnSelectedIndexChanged="View_Pic">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>���ʵ�ַ��
                        </td>
                        <td>
                            <asp:TextBox ID="fj" runat="server" CssClass="mytextarea" Width="90%" Rows="3" TextMode="MultiLine"
                                ToolTip="��Ϊ��ִ���ļ�,��¼��������.exe����·��"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
                <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" stretch="true" ImageAlign="AbsMiddle" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mc"
        ErrorMessage="�������ݷ�ʽ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb"
        ErrorMessage="��ѡ��һ�����ʵ�ͼ��">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fj"
        ErrorMessage="��������ʵ�ַ">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
