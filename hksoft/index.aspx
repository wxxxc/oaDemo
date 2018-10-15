<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="hksoft.index" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="cssjs/mypc.css" />
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="CssJs/Choose.js"></script>
    <script type="text/javascript" src="js/myselfjs.js"></script>

    <script type="text/javascript" src="CssJs/jquery-1.4.4.min.js"></script>
    <title>重点工作汇总</title>

    <style type="text/css">

        .pagebtn {
            width: 40px !important;
            height: 23px;
        }
    </style>
    <script type="text/javascript">

        function click_block1(num) {
            if (num == 1) {
                $('#query_tj').val("rwzt");
                $('#query_content').val("已发布");
            } else if (num == 2) {
                $('#query_tj').val("jjcd");
                $('#query_content').val("高");
            } else if (num == 3) {
                $('#query_tj').val("ynxs");
                $('#query_content').val("是");
            } else {
                $('#query_tj').val("rwzt");
                $('#query_content').val("已完成");
            }
            $('#QueryBtn').click();
        }
    </script>
</head>
<body class="main card-no-border">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div class="row">
            <!-- Column -->
            <div class="col-lg-8 col-md-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row index_title_card" style="margin-top:-5px;">

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block1(1);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-info"><i class="fa fa-spin fa-refresh"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num1 %></h3>
                                                <h5 class="text-muted m-b-0">办理中任务</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block1(2);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-danger"><i class="fa  fa-warning"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num2 %></h3>
                                                <h5 class="text-muted m-b-0">高度紧急任务</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block1(3);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-warning"><i class="mdi mdi-alarm"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num3 %></h3>
                                                <h5 class="text-muted m-b-0">限时任务</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block1(4);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-success"><i class="ti-check"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num4 %></h3>
                                                <h5 class="text-muted m-b-0">已完成任务</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <asp:UpdatePanel runat="server" ID="up1">
                            <ContentTemplate>
                                <div class="row" style="text-align: center; line-height: 40px;">
                                    <div class="col-lg-12">
                                        <span>快速检索：</span>
                                        <asp:DropDownList ID="query_tj" runat="server" Style="height: 30px; border-radius: 2px">
                                            <%--<asp:ListItem Value="rwdh">任务单号</asp:ListItem>--%>
                                            <asp:ListItem Value="rwbt">任务标题</asp:ListItem>
                                            <%--<asp:ListItem Value="c.mc">任务性质</asp:ListItem>--%>
                                            <asp:ListItem Value="jjcd">紧急程度</asp:ListItem>
                                            <asp:ListItem Value="ynxs">是否限时</asp:ListItem>
                                            <asp:ListItem Value="rwzt" Selected="true">任务状态</asp:ListItem>
                                            <%--<asp:ListItem Value="jsdx">接收对象</asp:ListItem>
                                        <asp:ListItem Value="zrr">责任人</asp:ListItem>
                                        <asp:ListItem Value="zrld">责任领导</asp:ListItem>--%>
                                            <%--<asp:ListItem Value="rwnr">任务内容</asp:ListItem>--%>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="180" Height="30" Style="border-radius: 2px" Text="已发布"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-info" Style="height: 30px; border: none; margin-left: 10px" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                            CausesValidation="False" />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:ImageField DataImageUrlField="wz" DataImageUrlFormatString="../../images/{0}.gif"
                                                                    HeaderText="被问责">
                                                                    <ItemStyle HorizontalAlign="center" />
                                                                    <HeaderStyle CssClass="mw10" />
                                                                </asp:ImageField>--%>
                                                    <asp:TemplateField HeaderText="任务标题">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/indexshview.aspx?rwid=<%# Eval("rwid") %>')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label ID="Labelrwbt" Style="color: #15A7E2; overflow: hidden; text-align: center; max-width: 200px; display: block; white-space: nowrap; text-overflow: ellipsis;" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="牵头领导">
                                                        <HeaderStyle CssClass="" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbr_qtld" runat="server" Style="text-overflow: ellipsis; overflow: hidden; width: 100px; display: block; white-space: nowrap;" Text='<%# getnamebyid(Eval("qtld").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="责任领导">
                                                        <HeaderStyle CssClass="" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbr_zrld" runat="server" Style="text-overflow: ellipsis; overflow: hidden; width: 100px; display: block; white-space: nowrap;" Text='<%# getnamebyid(Eval("zrld").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="责任人">
                                                        <HeaderStyle CssClass="" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbr_zrr" runat="server" Style="text-overflow: ellipsis; overflow: hidden; width: 100px; display: block; white-space: nowrap;" Text='<%# getnamebyid(Eval("zrr").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="接收人">
                                                        <HeaderStyle CssClass="" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="jsdx" runat="server" Style="text-overflow: ellipsis; overflow: hidden; width: 100px; display: block; white-space: nowrap;" Text='<%# getnamebyid(Eval("jsdx").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="紧急程度">
                                                        <HeaderStyle CssClass="" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                            </font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:BoundField DataField="rwzt" HeaderText="状态">
                                                        <HeaderStyle CssClass="" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>--%>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="限时">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="" />
                                                    </asp:ImageField>
                                                    <%-- <asp:BoundField DataField="fbr" HeaderText="发布人">
                                                        <HeaderStyle CssClass="mw70" />
                                                    </asp:BoundField>--%>
                                                    <asp:TemplateField HeaderText="发布时间">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="" />
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
                                    </div>
                                </div>

                                <div class="row" style="margin-top:-5px;">
                                    <div class="col-12">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="10">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="card">
                    <div class="card-body">
                        <ul class="nav nav-pills m-t-15 m-b-15">
                            <li class="nav-item"><a href="#navpills-2" class="nav-link active" data-toggle="tab" aria-expanded="false">工作评分排行</a> </li>
                            <li class=" nav-item"><a href="#navpills-1" class="nav-link" data-toggle="tab" aria-expanded="false">问责通报</a> </li>
                        </ul>
                        <div class="tab-content br-n pn">
                            <div id="navpills-1" class="tab-pane">
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="mytable table-responsive">
                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                        DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table" style="margin-bottom:10px;">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="序号">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="任务标题">
                                                                <ItemTemplate>
                                                                    <a href="#" onclick="javascript:popView('/oa/rwgl/indexwenze.aspx?rwid=<%# Eval("rwid") %>')"
                                                                        class="gvlink" title="<%# Eval("rwbt") %>">
                                                                        <asp:Label ID="Labelrwbt" Style="color: #15A7E2; overflow: hidden; text-align: center; display: block; white-space: nowrap; text-overflow: ellipsis;"
                                                                            runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                                </ItemTemplate>
                                                                <HeaderStyle  />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="发布时间">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle />
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
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <webdiyer:AspNetPager ID="AspNetPager2" runat="server" OnPageChanged="AspNetPager2_PageChanged"
                                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                                    NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="10">
                                                </webdiyer:AspNetPager>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div id="navpills-2" class="tab-pane active">
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate>
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="mytable table-responsive">
                                                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                        DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="table" style="margin-bottom:10px;">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="序号">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView3.Rows.Count+ 1 %>"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle  />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="头像">
                                                                <ItemTemplate>
                                                                    <img src="<%# Eval("photo").ToString().Equals("")?"/photo/default_avatar.jpg":Eval("photo").ToString() %>"
                                                                        class="index_table_img" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="ui_desc" HeaderText="姓名">
                                                                <HeaderStyle  />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="zw" HeaderText="职位">
                                                                <HeaderStyle  />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="score" HeaderText="分数">
                                                                <HeaderStyle  />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <RowStyle CssClass="hkRowStyle" />
                                                        <HeaderStyle CssClass="hkHeadStyle" />
                                                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                    </asp:GridView>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-12">
                                                <webdiyer:AspNetPager ID="AspNetPager3" runat="server" OnPageChanged="AspNetPager3_PageChanged"
                                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                                    NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="10">
                                                </webdiyer:AspNetPager>
                                            </div>
                                        </div>
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
