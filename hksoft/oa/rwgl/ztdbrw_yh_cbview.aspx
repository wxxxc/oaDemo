<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ztdbrw_yh_cbview.aspx.cs" Inherits="hksoft.oa.rwgl.ztdbrw_yh_cbview" ValidateRequest="false"%>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>催办历史记录</title>
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
                                    AutoGenerateColumns="False"  EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="催办原因">
                                            <HeaderStyle CssClass="mw90" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelwzyy" runat="server" Text='<%# Bind("reason") %>'></asp:Label></font>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="催办建人">
                                            <HeaderStyle CssClass="mw60" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelcjr" runat="server" Text='<%# Bind("createuser") %>'></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="催办时间">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw70" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelcjsj" runat="server" Text='<%# Bind("createtime", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="接收人">
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
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
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