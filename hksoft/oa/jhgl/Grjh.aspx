<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grjh.aspx.cs" Inherits="hkpro.oa.jhgl.Grjh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>���˼ƻ�����</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">��ݣ�<asp:TextBox ID="jhnf" runat="server" Width="60" CssClass="mytext" onclick="SelectDate(this,'yyyy')"></asp:TextBox>
                                ״̬��<asp:DropDownList ID="zt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                                    <asp:ListItem Text="�����" Value="�����"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="���" Value="���"></asp:ListItem>
                                </asp:DropDownList>
                                &nbsp; �ƻ����ڣ�<asp:TextBox ID="jhcq" runat="server" Width="60" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                  <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="jhid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="jhid" HeaderText="����">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jhnf" HeaderText="�ƻ����">
                                            <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jhyf" HeaderText="�ƻ�����">
                                             <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="����Ŀ��">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle Wrap="false" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('grjh_mod.aspx?id=<%# Eval("jhid") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ztmb") %>'></asp:Label></a>
                                            </ItemTemplate>
                                             <HeaderStyle CssClass="mwp40" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="mc" HeaderText="�ƻ�����">
                                           <HeaderStyle CssClass="mw120" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="�ƻ���">
                                          <HeaderStyle CssClass="mw100" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sprNames" HeaderText="����������">
                                             <HeaderStyle CssClass="mwp40" />
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
