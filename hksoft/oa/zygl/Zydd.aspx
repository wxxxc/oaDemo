<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zydd.aspx.cs" Inherits="hkpro.oa.zygl.Zydd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资源调度</title>
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
                            <td style="height: 40px">请选择资源分类：<asp:DropDownList ID="zyflxz" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeType">
                            </asp:DropDownList>
                                &nbsp;<asp:CheckBox ID="CBygq" runat="server" Text="只显示已过期申请" AutoPostBack="true"
                                    OnCheckedChanged="CTCB" />
                            </td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                      <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="sqid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                          <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sqid" HeaderText="申请ID">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="申请资源">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('zydd_view.aspx?id=<%# Eval("sqid") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("zymc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                                <HeaderStyle CssClass="mw200"  />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sysj" HeaderText="使用时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                          <HeaderStyle CssClass="mw100"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ghsj" HeaderText="归还时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                               <HeaderStyle CssClass="mw00"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ztmc" HeaderText="状态">
                                              <HeaderStyle CssClass="mw60"  />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="申请人">
                                               <HeaderStyle CssClass="mw80"  />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sqsj" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                               <HeaderStyle CssClass="mw100"  />
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
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
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
