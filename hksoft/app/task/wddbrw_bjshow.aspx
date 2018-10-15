<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wddbrw_bjshow.aspx.cs" Inherits="hksoft.app.task.wddbrw_bjshow" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>

    <script>
        $(document).ready(function () {
            var b = "<%=savefj_yh.NavigateUrl %>";
            var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
                $('#ff').css("display", "none");
            }
            if (b == "../.." || b == "") {
                $('#f').css("display", "none");
            }
        })
        function openAddressList(stringfiled) {
            window.open(stringfiled, "选择用户", 'width=600,height=450,top=' + (screen.height - 450) / 2 + ',left=' + (screen.width - 600) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
        }
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
                        <a onclick="window.location='nr.aspx?rwid=<%=rw_nr%>'">
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




                <div class="row con_div">
                    <div class="col-12 text-center">
                        <span>完成情况</span>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>完成说明：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lblwcqk" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>完成附件：</span>
                    </div>
                    <div class="col-8 text-left">
                        <a href="<%=qy_fjylurl.Text %><%=savefj_yh.NavigateUrl %>" target="_blank" id="f">在线预览</a>
                        <asp:Label ID="Label1" runat="server"><%=savefj.Text %></asp:Label>
                        <asp:HyperLink ID="savefj_yh" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                            ToolTip="附件下载" Visible="false" />
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>完成人：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="wcrmc" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>完成时间：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="wcsjmc" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>



                <div class="row con_div">
                    <div class="col-12 text-center">
                        <span>审批情况</span>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>审批意见：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lblspyj" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>审批评价：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="lblsppj" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>审核人：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="sprmc" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>审核时间：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="spsjmc" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>
            </div>
        </div>
    </form>
</body>

</html>
