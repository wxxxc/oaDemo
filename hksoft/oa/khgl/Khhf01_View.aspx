<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Khhf01_View.aspx.cs" Inherits="hkpro.oa.khgl.Khhf01_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�ͻ��ط�</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>�ͻ��ط�
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �����ˣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="gmr" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        ʡ�ݣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sf" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���У�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cs" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��λ��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrdw" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ���ң�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrbs" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ְ��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrzw" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �������ڣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrq" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��Ʒ���ƣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="spmc" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ����������
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmsl" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        Email��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="email" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ������ַ��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yzdz" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="gmbz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ʹ���ˣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syr" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syrdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��λ��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syrdw" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �ϼ����ܣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sjzg" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ַ��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="syrdz" runat="server" CssClass="mytext" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ʹ�ñ�ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="sybz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        30���ڻط������
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="RBL1hfqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        180���ڻط������
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="RBL2hfqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        300���ڻط������
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="RBL3hfqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                            <asp:ListItem Text=" �� " Value="��"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
