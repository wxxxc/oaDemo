<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Clda.aspx.cs" Inherits="hkpro.oa.clgl.Clda" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px"></td>
                            <td align="right">
                                <input type="button" name="AddBtn" value="����" class="mybtn" onclick="javascript: popAdd('clda_view.aspx');" />
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
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
                                           <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="���">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="���ƺ�">
                                          <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('clda_view.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cph") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="clmc" HeaderText="��������">
                                             <HeaderStyle CssClass="mwp80"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="clzt" HeaderText="����״̬">
                                           <HeaderStyle CssClass="mw60"  />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��������Ա">
                                       <HeaderStyle CssClass="mw100"  />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="zdzs" HeaderText="�������(��)">
                                           <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="cz" HeaderText="��ֵ(��)">
                                            <HeaderStyle CssClass="mw80"  />
                                            <ItemStyle HorizontalAlign="right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qyrq" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw80"  />
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