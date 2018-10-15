<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjcjqk.aspx.cs" Inherits="hkpro.oa.kqgl.Qjcjqk" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>��ٳ������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table id="hkshow2" cellspacing="0" cellpadding="2" width="800" border="0">
                        <tr>
                            <td align="right">ͳ���·ݣ�
                            </td>
                            <td>
                                <asp:TextBox ID="kqrq" onclick="SelectDate(this,'yyyy-MM')" runat="server" CssClass="mytext"
                                    Width="150"></asp:TextBox>
                            </td>
                            <td align="right">ѡ���ţ�
                            </td>
                            <td>
                                <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="150" AutoPostBack="true"
                                    OnSelectedIndexChanged="bm_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td align="right">ѡ����Ա��
                            </td>
                            <td>
                                <asp:DropDownList ID="ry" runat="server" CssClass="mytext" Width="150">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">&nbsp;
                            </td>
                            <td colspan="5">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ"
                                    OnClick="Ref_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="ExpBtn" runat="server" Text="����" OnClick="Exp_Click" />
                                <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="���"
                                    CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                <font color="red">ע���������ʾ���ڹ���Ա��ȷ��ͨ������ټ�¼</font>
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" ShowFooter="false" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sqbmmc" HeaderText="����"></asp:BoundField>
                                        <asp:BoundField DataField="sqrid" HeaderText="�û�����"></asp:BoundField>
                                        <asp:BoundField DataField="sqrmc" HeaderText="����"></asp:BoundField>
                                        <asp:BoundField DataField="qjlx" HeaderText="�������">
                                            <HeaderStyle Width="70" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��ʼ����">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("qjkssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                                    ID="Label7" runat="server" Text='<%# Bind("qjkssd") %>'></asp:Label>)
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��ֹ����">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("qjjssj", "{0:yyyy-MM-dd}") %>'></asp:Label>(<asp:Label
                                                    ID="Label8" runat="server" Text='<%# Bind("qjjssd") %>'></asp:Label>)
                                            </ItemTemplate>
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qjts" HeaderText="�������">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ShengYuTS" HeaderText="����ʣ������">
                                            <ItemStyle HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
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
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kqrq"
            ErrorMessage="��ѡ��ͳ���·�">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
