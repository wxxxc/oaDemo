<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ggkjfs.aspx.cs" Inherits="hkpro.portal.kjfs.Ggkjfs" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��ݷ�ʽ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="Kjfstb.aspx" class="black">��ݷ�ʽͼ��</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                <a href="Ggkjfs.aspx" class="mail_top">������ݷ�ʽ</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td>
                                <font color="red">��ʾ��������ݷ�ʽ���������û��ɼ���</font>
                            </td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="�� ��" class="mybtn" onclick="javascript: popAdd('ggkjfs_view.aspx');" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td bgcolor="#ffffff" valign="top">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="qid" DataSourceID="SqlDataSource1"
                                                EmptyDataText="�����κι�����ݷ�ʽ��" Width="100%" ShowHeader="False" OnRowDataBound="Item_Bound" CssClass="hkgv">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ͼ��">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("qtb", "../../attach/portal/quick/{0}") %>' />
                                                            <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("qmc") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="����·��">
                                                        <ItemTemplate>
                                                            <font color="#999999">
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("qlj") %>'></asp:Label></font>
                                                            <a href="#" onclick="javascript:popMod('ggkjfs_view.aspx?id=<%# Eval("qid") %>')">
                                                                <asp:Image ID="Image111" runat="server" ImageUrl='../../images/edit.gif' ToolTip="�޸Ĵ˹�����ݷ�ʽ" /></a>
                                                            <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                                                OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" ImageUrl="../../images/del.gif" AlternateText="ɾ���˹�����ݷ�ʽ" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���" Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="dp_id" runat="server" Text='<%# Eval("qid")%>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle BackColor="#F7F7F7" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                <AlternatingRowStyle BackColor="#E6E6E6" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
    </form>
</body>
</html>
