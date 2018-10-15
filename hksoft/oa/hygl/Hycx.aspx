<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hycx.aspx.cs" Inherits="hkpro.oa.hygl.Hycx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����ѯ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <table cellspacing="0" cellpadding="0" width="98%" border="0">
                        <tr>
                            <td style="height: 40px" colspan="2">&nbsp;���ټ�����<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="id">�������</asp:ListItem>
                                <asp:ListItem Value="hyzt">��������</asp:ListItem>
                                <asp:ListItem Value="hylx">��������</asp:ListItem>
                                <asp:ListItem Value="a.zt">״̬</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('hycx_view.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="hyzt" HeaderText="��������">
                                             <HeaderStyle CssClass="mwp40"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zt" HeaderText="״̬">
                                           <HeaderStyle CssClass="mw60"  />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kssj" HeaderText="��ʼʱ��" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw100"  />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jssj" HeaderText="����ʱ��" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                          <HeaderStyle CssClass="mw100"  />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hys_mc" HeaderText="�ٿ��ص�">
                                            <HeaderStyle CssClass="mw150"  />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle CssClass="mw80"  />
                                            <ItemTemplate>
                                                <asp:Label ID="labelfrq" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fqsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle CssClass="mw80"  />
                                            <ItemTemplate>
                                                <asp:Label ID="labelspr" runat="server" Text='<%# Bind("ui_desc2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="spsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                       <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spyj" HeaderText="�������">
                                             <HeaderStyle CssClass="mwp30"  />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                       </div>
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
