<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdkq.aspx.cs" Inherits="hkpro.oa.kqgl.Wdkq" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>�ҵĿ���</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Wdkq.aspx" class="mail_top">�ϰ�/�°�</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Qjdlr.aspx" class="black">��ٵ�</a>
                            </td>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kqsmlr.aspx" class="black">����˵��</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td style="height: 25px" colspan="2">ѡ���·ݣ�<asp:TextBox ID="cxyf" runat="server" CssClass="mytext" Width="100" onclick="SelectDate(this,'yyyy-MM')"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click" />
                                ��Ӧ����ID��<asp:Label ID="lblkqid" runat="server" Font-Bold="true"></asp:Label>
                                ��ְ���ڣ�<asp:Label ID="lblrzrq" runat="server" Font-Bold="true"></asp:Label>&nbsp;
                            <a href="#" onclick="javascript:popView('Wdkq_Gzr.aspx')" class="gvlink">�鿴�ҵĹ�����</a>&nbsp;
                            <a href="#" onclick="javascript:popView('Wdkq_Bc.aspx')" class="gvlink">�鿴�ҵİ��</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��������">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("kqrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="xq" HeaderText="����">
                                            <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sb1" HeaderText="�����ϰ�"></asp:BoundField>
                                        <asp:BoundField DataField="xb2" HeaderText="�����°�"></asp:BoundField>
                                        <asp:BoundField DataField="sb3" HeaderText="�����ϰ�"></asp:BoundField>
                                        <asp:BoundField DataField="xb4" HeaderText="�����°�"></asp:BoundField>
                                        <asp:BoundField DataField="sb5" HeaderText="�����ϰ�"></asp:BoundField>
                                        <asp:BoundField DataField="xb6" HeaderText="�����°�"></asp:BoundField>
                                        <asp:BoundField DataField="cdcs" HeaderText="�ٵ�����">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ztcs" HeaderText="���˴���">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kgcs" HeaderText="��������">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wqdcs" HeaderText="δǩ������">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wqtcs" HeaderText="δǩ�˴���">
                                            <ItemStyle Wrap="false" HorizontalAlign="Right" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="cxyf"
            ErrorMessage="��ѡ���ѯ�·�">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
