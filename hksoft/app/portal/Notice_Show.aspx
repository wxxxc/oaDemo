<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notice_Show.aspx.cs" Inherits="hkpro.app.portal.Notice_Show" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/global.css" rel="stylesheet" />
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
        <div data-role="page" id="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='Notice.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>查看公告</h1>
                    </div>
                </div>
            </div>
            <div data-role="content" data-theme="d" class="mycontent_detail">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="ggid">
                    <ItemTemplate>
                        <li class="list-group-item">
                            <div class="row con_div">
                                <div class="col-12 text-left" style="text-align: center !important;">
                                    <h4 class="listtitle">
                                        <asp:Label ID="lblggzt" runat="server" Text='<%# Eval("ggzt")%>' /></h4>
                                </div>
                            </div>
                            <div class="separated_line"></div>

                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>创建人：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lbllrr" runat="server" Text='<%# Eval("lrrmc") %>' />
                                </div>
                            </div>
                            <div class="separated_line"></div>
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>公告分类：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lblggfl" runat="server" Text='<%# Eval("ggfl_mc") %>' />
                                </div>
                            </div>
                            <div class="separated_line"></div>
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>生效日期：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lblkssj" runat="server" Text='<%# Bind("kssj", "{0:yyyy-MM-dd}") %>' />至<asp:Label ID="lbljssj" runat="server" Text='<%# Bind("jssj", "{0:yyyy-MM-dd}") %>' />
                                </div>
                            </div>
                            <div class="separated_line"></div>
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>创建时间：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lbllrsj" runat="server" Text='<%# Bind("lrsj", "{0:yyyy-MM-dd HH:mm}")%>' />
                                </div>
                            </div>
                            <div class="separated_line"></div>
                            <hr />
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>内容：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lblggnr" runat="server" Text='<%# Eval("ggnr") %>' Style="word-break: break-all; overflow: hidden;" />
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="contentList" runat="server" data-role="listview" class="list-group">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <div style="margin-left: 5%">
                    <br />
                    <%--<a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                        <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                        <asp:Label ID="Label2" runat="server"><%=savefj.Text %></asp:Label>
                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"></asp:HyperLink>--%>
                    <img src="../images_a/lj.png" style="width: 22px; height: 24px; margin-top: 1px" />
                    相关附件：<asp:Label ID="fujian" runat="server"></asp:Label>

                </div>
            </div>
        </div>
        <asp:Label ID="fjNumber" runat="server" Visible="false"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    </form>
</body>
</html>
