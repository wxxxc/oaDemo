<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yh.aspx.cs" Inherits="hkpro.portal.yhgl.Yh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>�û�ά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">�������ţ�<asp:DropDownList ID="ssbm" runat="server">
                            </asp:DropDownList>
                                ���ټ�����<asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="a.ui_id" Selected="True">�û�����</asp:ListItem>
                                    <asp:ListItem Value="a.ui_desc">����</asp:ListItem>
                                    <asp:ListItem Value="a.ui_sex">�Ա�</asp:ListItem>
                                    <asp:ListItem Value="a.ui_status">״̬</asp:ListItem>
                                    <asp:ListItem Value="a.ui_yddh">�ƶ��绰</asp:ListItem>
                                    <asp:ListItem Value="a.ui_bgdh">�칫�绰</asp:ListItem>
                                    <asp:ListItem Value="b.zwmc">ְλ</asp:ListItem>
                                    <asp:ListItem Value="c.role_name">��ɫ</asp:ListItem>
                                    <asp:ListItem Value="e.qy_qc">������˾</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click" CausesValidation="False" />
                                <input type="button" id="AddBtn" name="AddBtn" value="�� ��" class="btn btn-success" onclick="javascript:popView('yh_add.aspx');" runat="server" />
                                <asp:Button CssClass="btn btn-info" ID="ExpBtn" runat="server" Text="�� ��" OnClick="Exp_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('yh_mod.aspx?id=<%# Eval("ui_id") %>')" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="����">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_sex" HeaderText="�Ա�">
                                            <HeaderStyle Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="����">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zwmc" HeaderText="ְλ">
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="role_name" HeaderText="��ɫ"></asp:BoundField>
                                        <asp:BoundField DataField="ui_yddh" HeaderText="�ƶ��绰"></asp:BoundField>
                                        <asp:BoundField DataField="ui_status" HeaderText="״̬">
                                            <HeaderStyle Width="35px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qy_qc" HeaderText="������˾"></asp:BoundField>
                                        <asp:BoundField DataField="cjsj" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="160" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('Yh_Bm.aspx?id=<%# Eval("ui_id") %>')" class="gvlink">���Ӳ���(<asp:Label ID="lblbmsl" runat="server" Text='<%# Bind("bmsl") %>'></asp:Label>)</a>
                                                <a href="#" onclick="javascript:popView('Yh_Js.aspx?id=<%# Eval("ui_id") %>')" class="gvlink">���ӽ�ɫ(<asp:Label ID="lbljssl" runat="server" Text='<%# Bind("jssl") %>'></asp:Label>)</a>
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
                            <td colspan="2" style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                    NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                    PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
