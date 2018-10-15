<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grjh_Mod.aspx.cs" Inherits="hkpro.oa.jhgl.Grjh_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�鿴�����ƻ�</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="height: 25px">
                    <asp:Button CssClass="mybtn" ID="SpBtn" runat="server" Text="�������" OnClick="Sp_Click"
                        Visible="false" />
                    <asp:Button CssClass="mybtn" ID="PjBtn" runat="server" Text="�������" OnClick="Pj_Click"
                        Visible="false" />
                    <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript: window.close()" />&nbsp;
                </td>
                <td class="td_base"></td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                        <tr>
                            <td colspan="4" align="center" style="height: 25">
                                <asp:Label ID="ny" runat="server" Font-Size="12pt"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">����Ŀ�꣺
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="ztmb" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                    ReadOnly="true" Rows="2"></asp:TextBox>
                            </td>
                        </tr>
                        <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                            <tr>
                                <td class="form-item" style="width: 20%">
                                    <font color="red">*</font>���������
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="96%" ReadOnly="true"
                                        TextMode="multiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="zgpjpanel" runat="server" Visible="false">
                            <tr>
                                <td class="form-item" style="width: 20%">�������ۣ�
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="zwpj" runat="server" CssClass="mytextarea" Width="96%" ReadOnly="true"
                                        TextMode="multiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-item" style="width: 20%">
                                    <font color="red">*</font>�������ۣ�
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="zgpjnr" runat="server" CssClass="mytextarea" Width="85%" ReadOnly="true"
                                        TextMode="multiLine" Rows="2"></asp:TextBox>
                                    <asp:DropDownList ID="df" runat="server" Width="55">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                        <asp:ListItem Text="0��" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="5��" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                        <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                        <asp:ListItem Text="25��" Value="25"></asp:ListItem>
                                        <asp:ListItem Text="30��" Value="30"></asp:ListItem>
                                        <asp:ListItem Text="35��" Value="35"></asp:ListItem>
                                        <asp:ListItem Text="40��" Value="40"></asp:ListItem>
                                        <asp:ListItem Text="45��" Value="45"></asp:ListItem>
                                        <asp:ListItem Text="50��" Value="50"></asp:ListItem>
                                        <asp:ListItem Text="55��" Value="55"></asp:ListItem>
                                        <asp:ListItem Text="60��" Value="60"></asp:ListItem>
                                        <asp:ListItem Text="65��" Value="65"></asp:ListItem>
                                        <asp:ListItem Text="70��" Value="70"></asp:ListItem>
                                        <asp:ListItem Text="75��" Value="75"></asp:ListItem>
                                        <asp:ListItem Text="80��" Value="80"></asp:ListItem>
                                        <asp:ListItem Text="85��" Value="85"></asp:ListItem>
                                        <asp:ListItem Text="90��" Value="90"></asp:ListItem>
                                        <asp:ListItem Text="95��" Value="95"></asp:ListItem>
                                        <asp:ListItem Text="100��" Value="100"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="songshen" runat="server" Visible="false">
                            <tr>
                                <td class="form-item" style="height: 25; width: 20%">&nbsp;
                                </td>
                                <td colspan="2">
                                    <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ�ƻ���" Checked="true" />
                                    <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ�ƻ���" />
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                            DataKeyNames="id" EmptyDataText="��ʱû����ϸ�ƻ�" Width="100%" CssClass="hkgv">
                            <Columns>
                                <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="����">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                    <FooterStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="��������">
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popView('grjh_gzx.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                            <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("gzzt") %>'></asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="jhkssj" HeaderText="�ƻ���ʼʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                    HtmlEncode="False">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="jhwcsj" HeaderText="�ƻ����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                    HtmlEncode="False">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="hkRowStyle" />
                            <HeaderStyle CssClass="hkHeadStyle" />
                            <AlternatingRowStyle CssClass="hkAltRowStyle" />
                            <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                        </asp:GridView>
                    </table>
                </td>
            </tr>
        </table>
        <!--����label-->
        <asp:Label ID="zt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="spyj"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="zgpjnr"
            ErrorMessage="������������������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="df"
            ErrorMessage="��ѡ�����۷���">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
