<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shdbrw.aspx.cs" Inherits="hkpro.oa.rwgl.shdbrw" %>

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
    <title>审核待办任务</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row" style="line-height: 40px;">
                            <div class="col-12">
                                <span>快速检索：</span>
                                <asp:DropDownList ID="query_tj" runat="server" CssClass="custom-select" Style="width: 130px; margin-top: -3px;">
                                    <asp:ListItem Value="rwdh">任务单号</asp:ListItem>
                                    <asp:ListItem Value="rwbt">任务标题</asp:ListItem>
                                    <asp:ListItem Value="c.mc">任务等级</asp:ListItem>
                                    <asp:ListItem Value="rwzt">任务状态</asp:ListItem>
                                    <asp:ListItem Value="rwnr">任务内容</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" Width="120" Height="39" CssClass="form-control"></asp:TextBox>&nbsp;
                                <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <span>紧急程度：</span>
                                <span class="label label-danger">高</span>
                                <span class="label label-warning">中</span>
                                <span class="label label-info">低</span>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 10px;">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="up1">
                                    <ContentTemplate>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
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
                                                            <a href="#" onclick="javascript:popView('shdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="接收人">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="紧急程度">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                            </font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="限时">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:ImageField DataImageUrlField="fjmc" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderImageUrl="../../images/y.gif" HeaderText="附件标志">
                                                        <ItemStyle HorizontalAlign="center" CssClass="v-m" />
                                                        <HeaderStyle CssClass="mw30 v-m" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="任务等级">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="rwzt" HeaderText="状态">
                                                        <HeaderStyle CssClass="mw60" />
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
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="12">
                                        </webdiyer:AspNetPager>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
