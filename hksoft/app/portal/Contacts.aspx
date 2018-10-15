<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="hkpro.app.portal.Contacts" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
</head>

<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" style="border-bottom-color: white; background: #5295EE;">
                    <a href="#" onclick="goTo('../../Main_A.aspx')" class="ui-btn-up-a  ui-btn" data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 200; color: white; font-size: 22px">员工通讯录</h1>
                </div>
                <div data-role="content" data-theme="d" class="myset">
                    <%--<div data-role="controlgroup" data-type="horizontal">
                        <asp:Button ID="QueryBtn" runat="server" Text="搜索" data-inline="true" data-theme="e" data-icon="search" data-mini="true" OnClick="Query_Click" />
                    </div>
                    <asp:TextBox ID="tj" runat="server" placeholder="请输入关键词" data-clear-btn="true" data-inline="true" data-mini="true"></asp:TextBox>--%>
                    <table style="width: 330px; height: 60px;">
                        <tr>
                            <td valign="top" style="width: 30px">
                                <%--<asp:ImageButton ID="ImageButton1" ImageUrl="/images_a/app/suo.png" data-clear-btn="true"
                                data-inline="true" data-mini="true" runat="server" OnClick="Query_Click"/>--%>
                                <div class="hw_cx">
                                    <asp:ImageButton ID="imagebutton1" runat="server"
                                        AlternateText="ImageButton 1"
                                        ImageAlign="left"
                                        ImageUrl="/images_a/app/suo.png"
                                        OnPreRender="Query_Click" />
                                </div>
                            </td>
                            <td valign="top">
                                <div class="hw_cx_txt">
                                    <asp:TextBox ID="tj" runat="server" placeholder="请输入关键字" data-clear-btn="true"
                                        data-inline="true" data-mini="true"></asp:TextBox>
                                </div>
                            </td>
                        </tr>
                    </table>

                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id">
                        <ItemTemplate>
                            <li>
                                <a href="Contacts_Show.aspx?id=<%# Eval("id") %>" style="background-color: #FFFFFF">
                                    <h3 class="listtitle">
                                        <asp:Label ID="lblxm" runat="server" Text='<%# Eval("Name") %>' Font-Bold="true" /></h3>
                                    <asp:Label ID="lblzw" runat="server" Text='<%# Eval("post") %>' ForeColor="Gray" Font-Size="Small" />&nbsp;&nbsp;
                                <asp:Label ID="lblbm" runat="server" Text='<%# Eval("unit") %>' ForeColor="Gray" Font-Size="Small" />
                                </a>
                            </li>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="contentList">
                                <li runat="server" id="itemPlaceholder" />
                            </ul>
                        </LayoutTemplate>
                    </asp:ListView>

                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="Right" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                        NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="200px" CssClass="pagination" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                        PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                        ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false">
                    </webdiyer:AspNetPager>
                </div>
                <div class="btn_dh_coloc">
                    <div id="footer" class="nav-style" data-role="footer" data-theme="b" data-position="fixed">
                        <div data-role="navbar" data-grid="c" class="nav-style">
                            <ul>
                                <li><a href="../../Main_A.aspx" id="home" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                                <li><a href="Msg.aspx" id="msg" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                                <li><a href="Notice.aspx" id="notice" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                                <li><a href="Set.aspx" id="work" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
