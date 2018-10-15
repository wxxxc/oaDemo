<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index_a.aspx.cs" Inherits="hksoft.app.Index_a" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <title>春城泉镇-重点工作</title>
    <link href="cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="cssjs_a/global.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
    <link href="css/myapp.css" rel="stylesheet">
    <link href="cssjs_a/mydibu.css" rel="stylesheet" />
    <link href="cssjs_a/frame/global.css" rel="stylesheet" />
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/waves.js"></script>
    <script src="cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="cssjs_a/global.js"></script>
    <script src="js/myselfjs.js"></script>
    <style></style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div data-role="page" id="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='Main_A.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>温泉重点工作一览</h1>
                    </div>
                </div>
            </div>

            <div class="myradio_index">
                <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true"
                    data-theme="e">
                    <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <div class="col-3 text-center btn_my active" onclick="gettask_index(this,'bl');">
                            办理中任务
                        </div>
                        <div class="col-3 text-center btn_my" onclick="gettask_index(this,'jj');">
                            高度紧急任务
                        </div>
                        <div class="col-3 text-center btn_my" onclick="gettask_index(this,'ls');">
                            限时任务
                        </div>
                        <div class="col-3 text-center btn_my" onclick="gettask_index(this,'bj');">
                            已完成任务
                        </div>
                    </div>
                </fieldset>
            </div>

            <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                <asp:UpdatePanel runat="server" ID="up1">
                    <ContentTemplate>
                        <asp:Button runat="server" ID="btn_query" OnClick="Query_Click" Style="display: none;" />
                        <asp:TextBox runat="server" ID="txt_query" Text="bl" Style="display: none;"></asp:TextBox>
                        <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">
                                    <a href="Index_a_show.aspx?rwid=<%#Eval("rwid")%>" data-ajax="false" title='<%# Eval("rwbt") %>'>
                                        <h4 class="listtitle">
                                            <asp:Label ID="lblrwbt" runat="server" Text='<%# Eval("rwbt").ToString().Length>17?Eval("rwbt").ToString().Substring(0,17)+"…":Eval("rwbt").ToString()%>' />
                                        </h4>
                                        <div class="info">
                                            <span>责任人：</span>
                                            <asp:Label ID="lblzrr" runat="server" Text='<%# getnamebyid(Eval("zrr").ToString()).Length>17?getnamebyid(Eval("zrr").ToString()).Substring(0,17)+"…":getnamebyid(Eval("zrr").ToString())%>' />
                                        </div>
                                        <div style="clear: both;"></div>
                                        <div class="info">
                                            <span>发布时间：</span>
                                            <asp:Label ID="lblfbsj" runat="server" Text='<%# Eval("fbsj", "{0:yyyy-MM-dd}") %>' />
                                        </div>
                                        <div style="clear: both;"></div>
                                    </a>
                                </li>
                                <br />
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul id="contentList" runat="server" data-role="listview" data-inset="false"
                                    class="list-group">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                            </LayoutTemplate>
                        </asp:ListView>
                        <div class="size_list">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                OnPageChanged="AspNetPager1_PageChanged"
                                ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false"
                                CustomInfoHTML="&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="pagination"
                                ShowBoxThreshold="5"
                                InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到"
                                LayoutType="Ul"
                                PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                            </webdiyer:AspNetPager>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <%--固定底部--%>
            <div class="dibu">
                <nav class="mynav navbar navbar-default navbar-fixed-bottom">
                    <div class="mycon container">
                        <div class="myheader navbar-header">
                            <ul class="page_bottom">
                                <li onclick="dj(this)">
                                    <a class="navbar-brand font-light m-b-0" onclick="window.location='portal/Msg.aspx'">
                                        <span class="my_bottom_icon icon-bubble"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">消息</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='Index_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon  icon-screen-desktop end"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light end" onclick="dj(this)">汇总</h6>
                                    </a>
                                </li>

                                <li>
                                    <a class="navbar-brand" onclick="window.location='Main_A.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon   icon-grid"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">首页</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='task/rwyj_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon   icon-bell"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">预警</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='portal/Set.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon  icon-user"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">设置</h6>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>

        </div>
    </form>
</body>
</html>
