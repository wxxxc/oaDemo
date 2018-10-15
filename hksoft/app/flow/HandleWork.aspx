<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork.aspx.cs" Inherits="hkpro.app.flow.HandleWork" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WebAPP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />
    <link rel="stylesheet" href="../../CssJs_A/frame/Mycss.css" />
    <link rel="stylesheet" href="../../CssJs_A/global.css" />

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/global.js"></script>

    <style>
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="d" style="border-bottom-color: white; background: #5295EE;">
                    <a href="#" onclick="goTo('../../Main_A.aspx')" class="ui-btn-up-a  ui-btn" data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 200; color: white; font-size: 22px; text-shadow: none;">待办工作</h1>
                    <div class="hf_btn_coloc">
                        <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true"
                            data-theme="e">
                            <asp:RadioButtonList ID="rblBl" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                AutoPostBack="true" data-theme="e" OnSelectedIndexChanged="rblBl_SelectedIndexChanged">
                                <asp:ListItem Text="未办理" Value="n"></asp:ListItem>
                                <asp:ListItem Text="已办理" Value="y" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                        </fieldset>
                    </div>
                </div>
            </div>
            <div data-role="content" data-theme="">
                <%--                <asp:TextBox ID="wTitle" runat="server" placeholder="请输入标题关键字" data-clear-btn="true"
                    data-inline="true" data-mini="true"></asp:TextBox>
                <div data-role="controlgroup" data-type="horizontal">
                    <asp:Button ID="QueBtn" runat="server" Text="查询" OnClick="Query_Click" data-inline="true" data-theme="b" data-mini="true" data-icon="search" />
                </div>
                <asp:DropDownList ID="dp_fname" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Query_Click" data-mini="true">
                </asp:DropDownList>--%>

                <table style="width: 330px">
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
                                <asp:TextBox ID="wTitle" runat="server" placeholder="请输入标题关键字" data-clear-btn="true"
                                    data-inline="true" data-mini="true"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr style="height: 60px">
                        <td colspan="2" valign="top" align="center">
                            <div style="width: 120px;" class="hw_xl">
                                <asp:DropDownList ID="dp_fname" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Query_Click"
                                    data-mini="true" data-theme="c">
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </table>
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <li class="qu"><a href="HandleWork_Audi.aspx?id=<%# DataBinder.Eval(Container.DataItem, "wID") %>&UpNodeId=<%# DataBinder.Eval(Container.DataItem, "NextNodeID") %>&FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FK_wfno") %>&FormId=<%# DataBinder.Eval(Container.DataItem, "FK_fid") %>" data-ajax="false">
                            <h3 class="listtitle">
                                <asp:Label ID="lblwTitle" runat="server" Text='<%# Eval("wTitle") %>' Font-Bold="true" /></h3>
                            <asp:Label ID="lblyh" runat="server" Text='<%# Eval("ui_desc") %>' ForeColor="Gray"
                                Font-Size="Small" />&nbsp;&nbsp;
                        <asp:Label ID="lblNextNode" runat="server" Text='<%# Eval("NextNodeName") %>' ForeColor="Gray"
                            Font-Size="Small" />
                        </a></li>
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
                    PrevPageText="上页" CustomInfoSectionWidth="200px" CssClass="pagination" ShowBoxThreshold="11"
                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                    PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                    ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false">
                </webdiyer:AspNetPager>
            </div>
        <%--    <div class="btn_dh_coloc">
                <div id="footer" class="nav-style" data-role="footer" data-theme="b" data-position="fixed">
                    <div data-role="navbar" data-grid="c" class="nav-style">
                        <ul>
                            <li><a href="../../Main_A.aspx" id="home" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="../portal/Msg.aspx" id="msg" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="../portal/Notice.aspx" id="notice" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="../portal/Set.aspx" id="work" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                        </ul>
                    </div>
                </div>
            </div>--%>
        </div>
    </form>
</body>
</html>
