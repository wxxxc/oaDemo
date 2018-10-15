<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index_a_show.aspx.cs" Inherits="hksoft.app.Index_a_show" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/myapp.css" rel="stylesheet" />
    <link href="cssjs_a/frame/global.css" rel="stylesheet" />
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="js/waves.js"></script>
    <script src="cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="cssjs_a/global.js"></script>
    <script src="js/myselfjs.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
                $('#ff').css("display", "none");
            }
            <%--            var b = "<%# Eval("fjlj") %><%# Eval("fjmc")%>";
            if (b == "../.." || b == "") {
                $('#f').css("display", "none");
            }--%>
        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <%-- 导航条--%>
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="javascript:history.back(-1);">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>查看任务</h1>
                    </div>
                </div>
            </div>
            <div data-role="content" data-theme="d" class="mycontent_detail">
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务来源：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="rwly" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务标题：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>接收人：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lbljsdx" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>牵头领导：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="qtld" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>责任领导：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="zrld" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>责任人：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="zrr" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务等级：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>紧急程度：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <asp:Panel ID="Panelrq" runat="server" Visible="false">
                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <span>开始日期：</span>
                        </div>
                        <div class="col-8 text-left">
                            <asp:Label ID="lblksrq" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="separated_line"></div>

                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <span>截止日期：</span>
                        </div>
                        <div class="col-8 text-left">
                            <asp:Label ID="lbljzrq" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="separated_line"></div>
                </asp:Panel>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务内容：</span>
                    </div>
                    <div class="col-8 text-left">
                        <a onclick="window.location='task/nr.aspx?rwid=<%=rw_nr%>'">
                            <asp:Label ID="lblnr" runat="server" Style="color: #15A7E2; text-overflow: ellipsis; overflow: hidden; max-width: 180px; display: block; white-space: nowrap;" Text='<%# Bind("rwnr") %>'></asp:Label>
                        </a>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>限时待办：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lblynxs" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务附件：</span>
                    </div>
                    <div class="col-8 text-left">
                        <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                        <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                        <asp:Label ID="Label2" runat="server"><%=savefj.Text %></asp:Label>
                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                            ToolTip="附件下载" Visible="false" />
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>发布人：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="fbrmc" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>发布时间：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="fqsj" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row" style="margin-top: 10px;">
                    <div class="col-12 mylistcard">
                        <asp:ListView ID="ListView1" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item">
                                    <div class="ribbon-wrapper card">
                                        <div class="ribbon ribbon-info"><%# Eval("ui_desc") %></div>
                                        <div class="ribbon-content">
                                            <div class="info">
                                                <span>办理人：</span>
                                                <asp:Label Style="color: #808080" ID="lbljjcd" runat="server" Text='<%# Eval("ui_desc") %>' />
                                            </div>
                                            <div class="info">
                                                <span>状态：</span>
                                                <asp:Label Style="color: #808080" ID="Label1" runat="server" Text='<%# Eval("jszt") %>' />
                                            </div>
                                            <div class="info">
                                                <span>送审时间：</span>
                                                <asp:Label Style="color: #808080" ID="lblfbsj" runat="server" Text='<%# Eval("clsj", "{0:yyyy-MM-dd}") %>' />
                                            </div>
                                            <div class="info">
                                                <span>完成说明：</span>
                                                <asp:Label Style="color: #808080" ID="Label3" runat="server" Text='<%# Eval("bzsm") %>' />
                                            </div>
                                            <div class="row con_div">
                                                <div class="col-4 text-left">
                                                    <span>附件：</span>
                                                </div>
                                                <div class="col-8 text-left">
                                                    <a href="<%=qy_fjylurl.Text %><%# Eval("fjlj") %><%# Eval("fjmc") %>" style='<%# isshowfj(Eval("fjlj").ToString()+Eval("fjlj").ToString()) %>' target="_blank" id="f">预览</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                    <li runat="server" id="itemPlaceholder" />
                                </ul>
                            </LayoutTemplate>
                        </asp:ListView>
                    </div>
                    <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

