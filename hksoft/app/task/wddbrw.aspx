<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wddbrw.aspx.cs" Inherits="hksoft.app.task.wddbrw" %>

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
        /*办理按钮*/
        .hf_btn_coloc .ui-btn-active {
            background-image: linear-gradient( #5295EE /*{global-active-background-start}*/, #5295EE /*{global-active-background-end}*/ );
        }

        .hf_btn_coloc .ui-controlgroup-horizontal .ui-radio .ui-mini .ui-btn-inner {
            padding: .5em 13px 1.5em;
        }   

        .abb {
            display: initial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage" class="indexPage">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="d" style="border-bottom-color: white; background: #5295EE; height: 58px">
                    <a onclick="window.location='../../Main_A.aspx'"  class="ui-btn-up-a  ui-btn" data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1em 30% 0.8em;">我的待办任务</h1>
                </div>
            </div>
            <div class="hf_btn_coloc">
                <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true"
                    data-theme="e">
                    <asp:RadioButtonList ID="rwjszt" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                        AutoPostBack="true" data-theme="e" OnSelectedIndexChanged="Query_Click">
                        <asp:ListItem Text="未接收" Value="w" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="办理中" Value="b"></asp:ListItem>
                        <asp:ListItem Text="送审中" Value="s"></asp:ListItem>
                        <asp:ListItem Text="已办结" Value="y"></asp:ListItem>
                    </asp:RadioButtonList>
                </fieldset>
            </div>
            <div class="container-fluid">
                <div class="hw_xl" style="">
                    <img id="" src="../../images/yes.gif" /><span>已超时&nbsp;&nbsp;</span>
                    <img id="Image2" src="../../images/no.gif" /><span>未超时&nbsp;&nbsp;</span>
                    <span>紧急程度：</span>
                    <%--     <select style="width: 25%">
                        <option selected="selected" value="">&nbsp;全部&nbsp;</option>
                        <option value="高">&nbsp;高&nbsp;</option>
                        <option value="中">&nbsp;中&nbsp;</option>
                        <option value="低">&nbsp;低&nbsp;</option>
                    </select>--%>

                    <fieldset style="display: inline-block;" data-type="horizontal" data-mini="true" data-corners="true">
                        <%--<div style="line-height: 20px" class="abb">--%>
                        <fieldset style="display: inline-block;" data-type="horizontal" data-mini="true" class="btn btn-default dropdown-toggle">
                            <asp:DropDownList ID="jjcdzt" runat="server" AutoPostBack="true" data-theme="c" OnSelectedIndexChanged="Query_Click">
                                <asp:ListItem Text="全部" Value="" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="高" Value=""></asp:ListItem>
                                <asp:ListItem Text="中" Value=""></asp:ListItem>
                                <asp:ListItem Text="低" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </fieldset>
                        <%--</div>--%>
                    </fieldset>
                    <br />
                </div>
                <div data-role="content" data-theme="d">
                    <asp:ListView ID="ListView1" runat="server">
                        <ItemTemplate>
                            <li class="qu">

                                <%if (rwjszt.SelectedValue == "w") %>

                                <%{ %>

                                <a href="wddbrw_jsshow.aspx?rwid=<%#Eval("rwid")%>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>" data-ajax="false">
                                    <h3 class="listtitle">
                                        <asp:Label ID="lblrwdh" runat="server" Text='<%# Eval("rwdh") %>' Font-Bold="true" onerror="errpic(this)"
                                            class="head" />
                                        <asp:Label ID="lblsource" runat="server" Text='<%# Eval("source") %>' Font-Bold="true" />
                                        <asp:Label ID="lblrwbt" runat="server" Text='<%# Eval("rwbt") %>' Font-Bold="true" />
                                        <asp:Label ID="lbljjcd" runat="server" Text='<%# Eval("jjcd") %>' Font-Bold="true" />

                                    </h3>
                                    <span style="color: gray; font-size: small">发布人：</span>
                                    <asp:Label ID="lblyh" runat="server" Text='<%# Eval("ui_desc") %>' ForeColor="Gray"
                                        Font-Size="Small" />&nbsp;&nbsp;
                                    <span style="color: gray; font-size: small">发布时间：</span>
                                    <asp:Label ID="lblfbsj" runat="server" Text='<%# Eval("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>' ForeColor="Gray"
                                        Font-Size="Small" />
                                </a>
                                <%} %>
                                <%else if (rwjszt.SelectedValue == "b") %>
                                <%{ %>
                                <a href="wddbrw_ssshow.aspx?rwid=<%#Eval("rwid")%>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=yjs" data-ajax="false">
                                    <h3 class="listtitle">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("rwdh") %>' Font-Bold="true" onerror="errpic(this)"
                                            class="head" />
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("source") %>' Font-Bold="true" />
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("rwbt") %>' Font-Bold="true" />
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("jjcd") %>' Font-Bold="true" />
                                    </h3>
                                    <span style="color: gray; font-size: small">发布人：</span>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("ui_desc") %>' ForeColor="Gray"
                                        Font-Size="Small" />&nbsp;&nbsp;
                                    <span style="color: gray; font-size: small">发布时间：</span>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>' ForeColor="Gray"
                                        Font-Size="Small" />
                                </a>
                                <%} %>
                                <%else if (rwjszt.SelectedValue == "s") %>
                                <%{ %>
                                <a href="wddbrw_ssshow.aspx?rwid=<%#Eval("rwid")%>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=ssz" data-ajax="false">
                                    <h3 class="listtitle">
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("rwdh") %>' Font-Bold="true" onerror="errpic(this)"
                                            class="head" />
                                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("source") %>' Font-Bold="true" />
                                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("rwbt") %>' Font-Bold="true" />
                                        <asp:Label ID="Label10" runat="server" Text='<%# Eval("jjcd") %>' Font-Bold="true" />
                                    </h3>
                                    <span style="color: gray; font-size: small">发布人：</span>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("ui_desc") %>' ForeColor="Gray"
                                        Font-Size="Small" />&nbsp;&nbsp;
                                    <span style="color: gray; font-size: small">发布时间：</span>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>' ForeColor="Gray"
                                        Font-Size="Small" />
                                </a>
                                <%} %>
                                <%else if (rwjszt.SelectedValue == "y") %>
                                <%{ %>
                                <a href="wddbrw_bjshow.aspx?rwid=<%#Eval("rwid")%>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=ybj" data-ajax="false">
                                    <h3 class="listtitle">
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("rwdh") %>' Font-Bold="true" onerror="errpic(this)"
                                            class="head" />
                                        <asp:Label ID="Label14" runat="server" Text='<%# Eval("source") %>' Font-Bold="true" />
                                        <asp:Label ID="Label15" runat="server" Text='<%# Eval("rwbt") %>' Font-Bold="true" />
                                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("jjcd") %>' Font-Bold="true" />
                                    </h3>
                                    <span style="color: gray; font-size: small">发布人：</span>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("ui_desc") %>' ForeColor="Gray"
                                        Font-Size="Small" />&nbsp;&nbsp;
                                    <span style="color: gray; font-size: small">发布时间：</span>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>' ForeColor="Gray"
                                        Font-Size="Small" />
                                </a>
                                <%} %>
                            </li>
                            <br />
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
                        PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="pagination" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                        PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                        ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false">
                    </webdiyer:AspNetPager>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

