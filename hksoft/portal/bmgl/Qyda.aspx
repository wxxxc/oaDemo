<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qyda.aspx.cs" Inherits="hkpro.portal.bmgl.Qyda" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��λ��Ϣ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" colspan="2">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td align="right" style="height: 30">
                                <input type="button" id="AddBtn" name="AddBtn" value="����ӵ�λ" class="btn btn-primary" onclick="javascript: popAdd('qyda_view.aspx');"
                                    runat="server" visible="false" />
                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click"></asp:Button>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                    <tr>
                                        <td width="20%" class="form-item">
                                            <font color="red">*</font>��λ���룺
                                        </td>
                                        <td width="30%">
                                            <asp:TextBox CssClass="mytext" ID="qybm" runat="server" Width="90%" Enabled="false"
                                                MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td width="20%" class="form-item">
                                            <font color="red">*</font>��λ��д��
                                        </td>
                                        <td width="30%">
                                            <asp:TextBox CssClass="mytext" ID="pp" runat="server" Width="90%" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>��λȫ�ƣ�
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="qc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>��λ��ƣ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="jc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">Ӣ�����ƣ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ywmc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">��λ���ͣ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lx" runat="server" CssClass="mytext" Width="90%" />
                                        </td>
                                        <td class="form-item">����������
                                        </td>
                                        <td>
                                            <asp:TextBox ID="sshy" runat="server" CssClass="mytext" Width="90%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">��λ��ַ��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="dz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">�������룺
                                        </td>
                                        <td>
                                            <asp:TextBox ID="yzbm" runat="server" CssClass="mytext" Width="90%" MaxLength="6"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">��λ�绰��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="dh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">������룺
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">��λ��վ��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="wz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">�������䣺
                                        </td>
                                        <td>
                                            <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
<%--                                    <tr>
                                        <td class="form-item">���˴���
                                        </td>
                                        <td>
                                            <asp:TextBox ID="frdb" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">ע��ʱ�䣺
                                        </td>
                                        <td>
                                            <asp:TextBox ID="zcsj" runat="server" CssClass="mytext" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                       <%-- <td class="form-item">ע���ʽ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="zczj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>--%>
                                        <td class="form-item">Ա��������
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ygrs" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                         <td class="form-item">��������Ԥ����ַ��
                                        </td>
                                        <td>
                                            <asp:TextBox ID="qy_fjylurl" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
<%--                                    <tr>
                                        <td class="form-item">��˰�ţ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="gsh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">��˰�ţ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="dsh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�������У�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="khyh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">�����ʺţ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="yhzh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="form-item">��λ��飺
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="qyjj" runat="server" CssClass="mytext" Width="96%" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                             <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False" DataKeyNames="qy_id"
                                    EmptyDataText="�����κ�������λ��¼��" Width="100%" CssClass="hkgv" AllowPaging="false" Visible="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qy_id" HeaderText="������λ����">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="������λ����">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('qyda_view.aspx?id=<%# Eval("qy_id") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("qy_qc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qy_dh" HeaderText="�绰"></asp:BoundField>
                                        <asp:BoundField DataField="qy_cz" HeaderText="����"></asp:BoundField>
                                        <asp:BoundField DataField="qy_dz" HeaderText="��ַ"></asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pp"
            ErrorMessage="�����뵥λƷ��">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="qc"
            ErrorMessage="�����뵥λȫ��">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jc"
            ErrorMessage="�����뵥λ���">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="qybm"
            Display="none" ErrorMessage="��λ�������Ϊ���֡���ĸ��������" ValidationExpression="^\w+$"
            runat="server">
        </asp:RegularExpressionValidator>
<%--        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="zczj"
            Display="none" ErrorMessage="ע���ʽ����Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}"
            runat="server">
        </asp:RegularExpressionValidator>--%>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="ygrs"
            Display="none" ErrorMessage="Ա����������Ϊ����0������" ValidationExpression="^[1-9]{1}[\d]*$"
            runat="server">
        </asp:RegularExpressionValidator>
    </form>
</body>
</html>
