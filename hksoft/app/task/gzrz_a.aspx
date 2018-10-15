<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gzrz_a.aspx.cs" Inherits="hksoft.app.task.gzrz_a" %>


<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>春城泉镇-重点工作</title>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../CssJs_A/frame/jquery.mobile-1.3.2.css" />

    <link href="../cssjs_a/myapp.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CssJs_A/global.css" />
    <link href="../cssjs_a/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="../CssJs_A/frame/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../bootstrap/js/bootstrap.min.js"></script>

        <style>
        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 7px 0;
            border-radius: 4px;
            padding-left: 30px;
            margin-top: 0px;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="d" style="border-bottom-color: white; background: #5295EE; height: 58px">
                    <a onclick="window.location='../Main_A.aspx'" class="ui-btn-up-a  ui-btn" data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1em 30% 0.8em;">工作日志</h1>
                    <a onclick="window.location='gzrz_a_add.aspx'" data-role="button" data-inline="true" data-ajax="false" data-theme="b" class="ui-btn-up-a  ui-btn" style="border: none; background: #5295EE; top: 19px; right: 10px;" data-iconpos="left">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
            <div data-role="content" data-theme="d" class="ne_cx_tb  ds_top">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <li class="qu">
                            <a href="gzrz_a_show.aspx?rcid=<%#Eval("rcid")%>" data-ajax="false">
                                <h3 class="listtitle">
                                    <%--<asp:Label ID="lblrwdh" runat="server" Text='<%# Eval("rwdh") %>' Font-Bold="true" onerror="errpic(this)"
                                        class="head" />--%>
                                    <%-- <asp:Label ID="lblsource" runat="server" Text='<%# Eval("source") %>' Font-Bold="true" />--%>
                                    <asp:Label ID="lblrwbt" runat="server" Text='<%# Eval("rczt") %>' Font-Bold="true" />
                                    <%--<asp:Label ID="lbljjcd" runat="server" Text='<%# Eval("jjcd") %>' Font-Bold="true" />--%>

                                </h3>
                                <%--<span style="color: gray; font-size: small">发布人：</span>--%>
                                <asp:Label ID="lblyh" runat="server" Text='<%# Eval("syz") %>' ForeColor="Gray"
                                    Font-Size="Small" />&nbsp;&nbsp;
                                  <%--  <span style="color: gray; font-size: small">发布时间：</span>--%>
                                <asp:Label ID="lblfbsj" runat="server" Text='<%# Eval("cjsj", "{0:MM/dd HH:mm}") %>' ForeColor="Gray"
                                    Font-Size="Small" />
                            </a>
                        </li>
                        <br />
                    </ItemTemplate>
                     <LayoutTemplate>
                        <ul id="contentList" runat="server" data-role="listview" data-inset="false" data-filter="true" data-filter-placeholder="请输入关键词" class="contentList">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                    ShowCustomInfoSection="Right" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                    NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                    PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="pagination" ShowBoxThreshold="11"
                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                    PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                    ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false">
                </webdiyer:AspNetPager>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>" />
        </div>
    </form>
</body>
</html>
