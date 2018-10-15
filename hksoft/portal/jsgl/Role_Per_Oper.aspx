<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role_Per_Oper.aspx.cs"
    Inherits="hkpro.portal.jsgl.Role_Per_Oper" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��ɫ����</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 30">���á�<asp:Label ID="LabelRole" runat="server" />���Ĳ���Ȩ�ޣ�<font color="red">ע��Ŀǰ���в���ģ��֧�ֲ���Ȩ��</font>��
                            </td>
                            <td align="right">
                                <asp:Button ID="OkBtn" runat="server" OnClick="Ok_Click" CssClass="mybtn" Text="�� ��" />
                                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript: location.href = 'Role.aspx';" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td width="65" class="td_base">���ٶ�λ��
                                        </td>
                                        <td class="td_base">
                                            <asp:Label ID="lbldw" runat="server" ForeColor="Yellow"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 20">
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">ȫѡ</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">ȫ��</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">��ѡ</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" AllowPaging="false" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="һ��ģ��">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "modu_mc1")%>
                                                <a name="<%# DataBinder.Eval(Container.DataItem, "modu_id1")%>"></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����ģ��">
                                            <HeaderStyle Width="100px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "modu_mc")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����Ȩ��">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="o_full" runat="server" Text="ȫ��" />
                                                <asp:Label ID="o_fullid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_full") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_add" runat="server" Text="����" />
                                                <asp:Label ID="o_addid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_add") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_mod" runat="server" Text="�޸�" />
                                                <asp:Label ID="o_modid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_mod") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_del" runat="server" Text="ɾ��" />
                                                <asp:Label ID="o_delid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_del") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_exp" runat="server" Text="����" />
                                                <asp:Label ID="o_expid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_exp") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_aud" runat="server" Text="����" />
                                                <asp:Label ID="o_audid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_aud") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_exe" runat="server" Text="ִ��" />
                                                <asp:Label ID="o_exeid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_exe") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:CheckBox ID="o_que" runat="server" Text="�鿴" />
                                                <asp:Label ID="o_queid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "o_que") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��ѯȨ��">
                                            <ItemStyle Width="230px" />
                                            <ItemTemplate>
                                                <asp:RadioButton ID="corp" runat="server" GroupName="1" Text="��˾" />
                                                <asp:Label ID="corpid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "d_corp") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:RadioButton ID="dept" runat="server" GroupName="1" Text="����" />
                                                <asp:Label ID="deptid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "d_dept") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:RadioButton ID="indi" runat="server" GroupName="1" Text="����" />
                                                <asp:Label ID="indiid" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "d_indi") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 25">
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">ȫѡ</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">ȫ��</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">��ѡ</a>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
