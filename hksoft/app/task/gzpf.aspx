<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gzpf.aspx.cs" Inherits="hksoft.app.task.gzpf" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/global.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/mydibu.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>

    <style>
        .pagination {
            display: block;
            padding-left: 3px;
            margin-top: -10px;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
            <%-- 导航条--%>

            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='../Main_A.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>工作评分</h1>
                    </div>
                </div>
            </div>
            <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 60px;">
                <asp:UpdatePanel runat="server" ID="up1">
                    <ContentTemplate>
                        <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">

                                    <h4 class="listtitle">
                                        <img src="<%# Eval("photo").ToString().Equals("")?"/photo/default_avatar.jpg":Eval("photo").ToString() %>"
                                            style="border-radius: 50%; width: 40px; height: 40px; overflow: hidden; float: left; margin-top: 5px; margin-bottom: 5px; margin-right: 15px;" />
                                        <asp:Label ID="lblus" runat="server" Text='<%# Eval("ui_desc")%>' />
                                    </h4>
                                    <div class="info">
                                        <span>职位：</span>
                                        <asp:Label ID="lblzw" runat="server" Text='<%# Eval("zw")%>' />
                                        <br />
                                        <span style="margin-left: 55px">分数:</span>
                                        <asp:Label ID="lbscore" runat="server" Text='<%# Eval("score")%>' />
                                    </div>
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
                            <webdiyer:AspNetPager ID="AspNetPager3" runat="server"
                                OnPageChanged="AspNetPager3_PageChanged"
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
                                <li>
                                    <a class="navbar-brand font-light m-b-0" onclick="window.location='../portal/Msg.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon icon-bubble"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">消息</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='../Index_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon  icon-screen-desktop"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light" onclick="dj(this)">汇总</h6>
                                    </a>
                                </li>

                                <li>
                                    <a class="navbar-brand" onclick="window.location='../Main_A.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon   icon-grid"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light" onclick="dj(this)">首页</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='rwyj_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon   icon-bell"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">预警</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='../portal/Set.aspx'">
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
