<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fbdbrw.aspx.cs" Inherits="hksoft.app.task.fbdbrw" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="../cssjs_a/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <link href="../cssjs_a/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../cssjs_a/frame/jquery-1.8.2.min.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
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
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage" class="indexPage">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="d" style="border-bottom-color: white; background: #5295EE; height: 58px">
                    <a onclick="window.location='../Main_A.aspx'" class="ui-btn-up-a  ui-btn" data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1em 34% 0.8em;">发布任务</h1>
                    <a onclick="window.location='Add_fbdbrw.aspx'" data-role="button" data-inline="true" data-ajax="false" data-theme="b"
                        class="ui-btn-up-a  ui-btn" style="border: none; background: #5295EE; top: 19px; right: 20px;" data-iconpos="left">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
            <%--    <table>
                <tr>
                    <td>&nbsp;快速检索：<asp:DropDownList ID="query_tj" runat="server">
                        <asp:ListItem Value="rwdh">任务单号</asp:ListItem>
                        <asp:ListItem Value="rwbt">任务标题</asp:ListItem>
                        <asp:ListItem Value="c.mc">任务性质</asp:ListItem>
                        <asp:ListItem Value="rwzt">任务状态</asp:ListItem>
                        <asp:ListItem Value="rwnr">任务内容</asp:ListItem>
                    </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                        <asp:Button  ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" CausesValidation="False" />
                        
                    </td>
                </tr>
            </table>--%>
            <div data-role="content" data-theme="d" class="ds_top">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <li class="qu">
                            <a href="fbdbrw_detail.aspx?rwid=<%#Eval("rwid")%>" data-ajax="false">
                                <h3 class="listtitle">
                                    <asp:Label ID="lblrwbt" runat="server" Text='<%# Eval("rwbt") %>' Font-Bold="true" />
                                </h3>
                                <%-- <span style="color: gray; font-size: small">发布人：</span>
                                    <asp:Label ID="lblyh" runat="server" Text='<%# Eval("ui_id") %>' ForeColor="Gray">
                                        Font-Size="Small" />--%>
                                <span style="color: gray; font-size: small">接收人：
                                 <asp:Label ID="lbljjcd" runat="server" Text='<%# Eval("ui_desc") %>' Font-Bold="true" />
                                    &nbsp;&nbsp;
                                    <span style="color: gray; font-size: small">发布时间：</span>
                                    <asp:Label ID="lblfbsj" runat="server" Text='<%# Eval("fbsj", "{0:yyyy-MM-dd}") %>' ForeColor="Gray"
                                        Font-Size="Small" />
                            </a>
                        </li>
                        <br />
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="contentList">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <div class="row">
                    <div class="col-12">
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                            ShowCustomInfoSection="Right" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                            PrevPageText="上页" CustomInfoSectionWidth="200px" CssClass="pagination" ShowBoxThreshold="11"
                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                            PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false">
                        </webdiyer:AspNetPager>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
