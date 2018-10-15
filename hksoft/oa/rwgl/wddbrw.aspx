<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wddbrw.aspx.cs" Inherits="hkpro.oa.rwgl.wddbrw" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>我的待办任务</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs rwgl_nav" role="tablist" style="float: left;">
                                    <li class="nav-item"><a class="nav-link active" href="wddbrw.aspx?i=2">未接收任务</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="wddbrwy.aspx">办理中任务</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="wddbrws.aspx">送审中任务</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="wddbrwj.aspx">已办结任务</a> </li>
                                </ul>
                                <div style="float: left; line-height: 40px;">
                                    &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/yes.gif" />已超时任务&nbsp;&nbsp;
                                <asp:Image ID="Image2" runat="server" ImageUrl="../../images/no.gif" />未超时任务&nbsp;&nbsp;
                                        紧急程度：
                                        <asp:DropDownList ID="query_tj" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                                            <asp:ListItem Value="" Selected="true">&nbsp;全部&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="高">&nbsp;高&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="中">&nbsp;中&nbsp;</asp:ListItem>
                                            <asp:ListItem Value="低">&nbsp;低&nbsp;</asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 10px;">
                            <div class="col-12">
                                <div class="mytable table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw30" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="jsid" HeaderText="接收编码">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                            </asp:BoundField>
                                            <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                HeaderText="超时">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle CssClass="mw40" />
                                            </asp:ImageField>
                                            <asp:TemplateField HeaderText="任务单号">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="任务来源">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelrwly" runat="server" Text='<%# Bind("source") %>'></asp:Label></font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="任务标题">
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popView('jsdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jsid=<%# Eval("jsid") %>&jszt=<%# Eval("jszt")%>')"
                                                        class="gvlink" title="<%# Eval("rwbt") %>">
                                                        <asp:Label ID="Labelrwbt" runat="server" 
                                                            Text='<%# Eval("rwbt").ToString().Length>20?Eval("rwbt").ToString().Substring(0,20)+"…":Eval("rwbt").ToString() %>'> </asp:Label></a>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="mwp50" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="紧急程度">
                                                <HeaderStyle CssClass="mw60" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                    </font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <%--                                        <asp:ImageField DataImageUrlField="jjcd" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderText="紧急程度">
                                            <ItemStyle HorizontalAlign="center" />
                                            <HeaderStyle Width="70px" />
                                        </asp:ImageField>--%>
                                            <asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                HeaderImageUrl="../../images/y.gif" HeaderText="附件标志">
                                                <ItemStyle HorizontalAlign="center" CssClass="v-m" />
                                                <HeaderStyle CssClass="mw30 v-m" />
                                            </asp:ImageField>
                                            <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                HeaderText="限时">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle CssClass="mw30" />
                                            </asp:ImageField>
                                            <asp:BoundField DataField="jszt" HeaderText="办理状态">
                                                <HeaderStyle CssClass="mw60" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jsdxmc" HeaderText="接收人">
                                                <HeaderStyle CssClass="mw120" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="mc" HeaderText="任务等级">
                                                <HeaderStyle CssClass="mw80" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ui_desc" HeaderText="发布人">
                                                <HeaderStyle CssClass="mw80" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="发布时间">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="thcs" HeaderText="退回次数">
                                                <HeaderStyle CssClass="mw60" />
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="hkRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" />
                                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    </asp:GridView>
                                </div>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="10">
                                </webdiyer:AspNetPager>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
