<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ztdbrw_yh_cbview.aspx.cs" Inherits="hksoft.oa.rwgl.ztdbrw_yh_cbview" ValidateRequest="false"%>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�߰���ʷ��¼</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
      <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/jquery-1.4.4.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <table width="100%" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                          <td colspan="2">
                                <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server"
                                    AutoGenerateColumns="False"  EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="�߰�ԭ��">
                                            <HeaderStyle CssClass="mw90" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelwzyy" runat="server" Text='<%# Bind("reason") %>'></asp:Label></font>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="�߰콨��">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelcjr" runat="server" Text='<%# Bind("createuser") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�߰�ʱ��">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw70" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelcjsj" runat="server" Text='<%# Bind("createtime", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="������">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelcjsr" runat="server" Text='<%# Bind("person") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
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
        </div>
    </form>
      <asp:Label ID="rwidstr" runat="server" hidden="true"></asp:Label>
</body>

</html>