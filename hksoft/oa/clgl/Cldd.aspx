<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cldd.aspx.cs" Inherits="hkpro.oa.clgl.Cldd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            ��ʻʱ��(��)��<asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                CssClass="mytext" Width="130"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
                                ErrorMessage="��������ѵʱ��(��)">&nbsp;
                            </asp:RequiredFieldValidator>&nbsp;��ʻʱ��(��)��<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                runat="server" CssClass="mytext" Width="130"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
                                ErrorMessage="��������ѵʱ��(��)">&nbsp;
                            </asp:RequiredFieldValidator>
                            ״̬��<asp:DropDownList ID="zt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeType">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                <asp:ListItem Text="��ͬ��" Value="��ͬ��"></asp:ListItem>
                                <asp:ListItem Text="�Ѿܾ�" Value="�Ѿܾ�"></asp:ListItem>
                                <asp:ListItem Text="�ѹ黹" Value="�ѹ黹"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            <asp:Button CssClass="mybtn" ID="RefBtn" runat="server" Text="��ѯ" OnClick="ChangeType"
                                CausesValidation="False"  />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="mytable table-responsive">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                 DataKeyNames="id"  EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                <Columns>
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id" HeaderText="���">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="·��">
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:popMod('cldd_view.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fcdd") %>'></asp:Label>-<asp:Label
                                                    ID="Label38" runat="server" Text='<%# Bind("dddd") %>'></asp:Label></a>
                                        </ItemTemplate>
                                         <HeaderStyle CssClass="mwp8"  />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="���벿��">
                                      <HeaderStyle CssClass="mw80"  />
                                        <ItemTemplate>
                                            <asp:Label ID="Label37" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="������">
                                         <HeaderStyle CssClass="mw80"  />
                                        <ItemTemplate>
                                            <asp:Label ID="Label39" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="czrs" HeaderText="��������">
                                        <HeaderStyle CssClass="mw80"  />
                                        <ItemStyle HorizontalAlign="right" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zt" HeaderText="״̬">
                                         <HeaderStyle CssClass="mw60"  />
                                        <ItemStyle HorizontalAlign="Center" />
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
