<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Msg.aspx.cs" Inherits="hkpro.app.portal.Msg" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />

    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/mydibu.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div data-role="page" id="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='../Main_A.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>消息</h1>
                    </div>
                    <a onclick="window.location='Msg_add.aspx'" data-role="button" data-inline="true" data-ajax="false" data-theme="b"
                        class="ui-btn-up-a  ui-btn" style="border: none; background: #1e88e5; top: -9px; right: 8px;" data-iconpos="left">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="color: #fff"></span>
                    </a>
                </div>
            </div>
            <div class="myradio_index">
                <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true"
                    data-theme="e">
                    <div class="row" style="margin-left: 0px; margin-right: 0px;">
                        <div class="col-6 text-center btn_my active" onclick="gettask_msg(this,'sj');">
                            消息收件箱
                        </div>
                        <div class="col-6 text-center btn_my" onclick="gettask_msg(this,'fj');">
                            消息发件箱
                        </div>
                    </div>
                </fieldset>
            </div>
            <%--    <div class="hw_xl">
                <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true">
                    <asp:DropDownList ID="ddlZt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                        data-theme="c">
                        <asp:ListItem Text="未读消息" Value="new" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="全部消息" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </fieldset>
            </div>--%>
            <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                <asp:UpdatePanel runat="server" ID="up1">
                    <ContentTemplate>
                        <asp:Button runat="server" ID="btn_query" OnClick="Query_Click" Style="display: none;" />
                        <asp:TextBox runat="server" ID="txt_query" Text="sj" Style="display: none;"></asp:TextBox>
                        <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">

                                    <a href="Msg_Show.aspx?id=<%#Eval("id")%>" data-ajax="false" title='<%# Eval("id") %>'>
                                        <h4 class="listtitle">
                                            <%--<img id="headpic" src="../images_A/<%# Eval("zt") %>.gif" />--%>
                                            <i class='<%# Eval("zt").ToString()=="0"?"fa fa-envelope":"fa fa-envelope-open" %>'></i>
                                            <asp:Label ID="lblnr" runat="server" Text='<%# Eval("nr").ToString().Length>17?Eval("nr").ToString().Substring(0,19)+"…":Eval("nr").ToString() %>' />
                                        </h4>
                                        <div class="info">
                                            <asp:Label ID="lblyh" runat="server" Text='<%# Eval("ui_desc") %>' />
                                        </div>
                                        <div class="info">
                                            <asp:Label ID="lblfssj" runat="server" Text='<%# Eval("fssj") %>' />
                                        </div>
                                    </a>
                                </li>
                                <br />
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                            </LayoutTemplate>
                        </asp:ListView>
                        <div class="size_list">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="pagination" ShowBoxThreshold="5"
                                InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5" >
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
                                    <a class="navbar-brand font-light m-b-0" onclick="window.location='Msg.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon icon-bubble end"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light end">消息</h6>
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
                                    <a class="navbar-brand" onclick="window.location='../task/rwyj_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon   icon-bell"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">预警</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='Set.aspx'">
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
