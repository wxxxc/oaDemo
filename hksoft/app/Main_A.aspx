<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main_A.aspx.cs" Inherits="hkpro.Main_A" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>春城泉镇</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="cssjs_a/global.css" rel="stylesheet" />
    <link href="cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/myapp.css" rel="stylesheet" />
    <link href="cssjs_a/mydibu.css" rel="stylesheet" />
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="cssjs_a/global.js"></script>
    <script src="js/waves.js"></script>
    <script src="js/myselfjs.js"></script>
    <style>
        /*轮播样式*/

        .carousel-indicators li {
            width: 15px;
            height: 2px;
        }

        .carousel-indicators .active {
            width: 15px;
            height: 2px;
        }

        .nav-link {
            display: block;
            padding: 0.5rem 20rem;
        }
      
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage" style="height: 640px">
            <%--顶部--%>
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <div class="div_h1">
                        <h1 style="margin-top: 0px;">温泉重点工作综合管理平台</h1>
                        <a href="task/gryj_a.aspx" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display: initial; position: fixed; top: 0px; right: 10px;"><i class="icon-bell"></i>
                            <div class="notify"><%=msgicon %></div>
                        </a>
                    </div>
                </div>
            </div>

            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="margin-top: 60px;" align="center">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images_a/app/Banner-1.jpg" alt="..." style="width: 99%; height: 150px;" />
                    </div>
                    <div class="carousel-item">
                        <img src="images_a/app/Banner-2.jpg" alt="..." style="width: 99%; height: 150px;" />
                    </div>
                    <div class="carousel-item">
                        <img src="images_a/app/Banner-3.jpg" alt="..." style="width: 99%; height: 150px;" />
                    </div>
                </div>
            </div>
            <div style="margin-top: 10px;">
                <table width="100%" height="360px" class="table">
                    <tr style="border: 1px solid #e4dada;">
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="portal/Msg.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/1.png" style="width: 60px; height: 60px;" border="0" alt="" />
                                    <asp:Panel ID="p_msg_sub" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="lblMsgCount" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>

                                    <span style="color:#455A64">我的消息</span>
                                </a>
                            </div>
                        </td>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="portal/Notice.aspx" data-ajax="false">
                                    <img src="images_A/tb/2.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="p_notice_sub" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="lblNoticeCount" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">公告管理</span>
                                </a>
                            </div>
                        </td>

                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/dbrwwjs_a.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_A/tb/6.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel2" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label2" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">未接收任务</span>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr style="border: 1px solid #e4dada;">
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/dbrwblz_a.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/7.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel1" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label1" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">办理中任务</span>
                                </a>
                            </div>
                        </td>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/dbrwssz_a.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/8.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel4" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label5" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">送审中任务</span>
                                </a>
                            </div>
                        </td>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/dbrwybj_a.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_A/tb/9.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel7" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label6" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">已办结任务</span>
                                </a>
                            </div>
                        </td>

                    </tr>
                    <tr style="border: 1px solid #e4dada;">


                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/Add_fbdbrw.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/10.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel5" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label7" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">发布任务</span>
                                </a>
                            </div>
                        </td>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/shdbrw.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/11.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel8" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label8" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">审核任务</span>
                                </a>
                            </div>
                        </td>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/gzpf.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_A/tb/5.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel3" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label3" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">工作评分</span>
                                </a>
                            </div>
                        </td>
                    </tr>

                    <tr style="border: 1px solid #e4dada;">
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/wztb.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_A/tb/4.png" style="width: 60px; height: 60px;" />
                                    <span style="color:#455A64">问责通报</span>
                                </a>
                            </div>
                        </td>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="Index_a.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/3.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel6" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label4" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">汇总一览</span>
                                </a>
                            </div>
                        </td>

                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/rwyj_a.aspx" data-ajax="false" style="text-decoration: none">
                                    <img src="images_a/tb/12.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel9" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label9" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span style="color:#455A64">任务预警</span>
                                </a>
                            </div>
                        </td>
                        <%--                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/gzrz.aspx" data-ajax="false">
                                    <img src="images_a/tb/rzyl.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel9" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label9" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span>日志一览</span>
                                </a>
                            </div>
                        </td>--%>
                    </tr>
                    <%--                    <tr>
                        <td align="center" valign="middle" style="border: 1px solid #e4dada;">
                            <div style="width: 66px; height: 84px; position: relative;">
                                <a href="task/gzrz_a.aspx" data-ajax="false">
                                    <img src="images_a/tb/rz.png" style="width: 60px; height: 60px;" />
                                    <asp:Panel ID="Panel10" runat="server" Visible="false">
                                        <sub class="menu_sub" style="display: block;">
                                            <asp:Label ID="Label10" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                        </sub>
                                    </asp:Panel>
                                    <span>工作日志</span>
                                </a>
                            </div>
                        </td>
                    </tr>--%>
                </table>


                <%-- <ul class="mn_list">
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/wddbrw.aspx" data-ajax="false">
                                <img src="images_a/tb/5.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="Panel1" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="Label1" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/portal/Notice.aspx" data-ajax="false">
                                <img src="images_A/tb/b.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="p_notice_sub" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="lblNoticeCount" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>

                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/portal/Msg.aspx" data-ajax="false">
                                <img src="images_a/tb/a.png" style="width: 60px; height: 60px;" border="0" alt="" />
                                <asp:Panel ID="p_msg_sub" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="lblMsgCount" runat="server"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                </ul>
                <ul class="mn_tilct">
                    <li><a href="app/portal/Msg.aspx" data-ajax="false" style="color: #000000;">我的消息</a></li>
                    <li><a href="app/portal/Notice.aspx" data-ajax="false" style="color: #000000;">公告管理</a></li>
                    <li><a href="app/task/wddbrw.aspx" data-ajax="false" style="color: #000000;">待办任务</a></li>
                </ul>
                <br /><br /><br /> <br />
                <ul class="mn_list">
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/fbdbrw.aspx" data-ajax="false">
                                <img src="images_A/tb/6.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="Panel2" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="Label2" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/qxdbrw.aspx" data-ajax="false">
                                <img src="images_A/tb/7.png" style="width: 60px; height: 60px;" />
                            </a>
                        </div>
                    </li>
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/cxjsqk.aspx" data-ajax="false">
                                <img src="images_A/tb/8.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="Panel3" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="Label3" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                </ul>
                <ul class="mn_tilct">
                    <li><a href="app/task/fbdbrw.aspx" data-ajax="false" style="color: #000000;">发布任务</a></li>
                    <li><a href="app/task/qxdbrw.aspx" data-ajax="false" style="color: #000000;">取消任务</a></li>
                    <li><a href="app/task/cxjsqk.aspx" data-ajax="false" style="color: #000000;">任务状态</a></li>
                </ul> <br /><br /><br /> <br />
                <ul class="mn_list">
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/shdbrw.aspx" data-ajax="false">
                                <img src="images_a/tb/9.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="Panel4" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="Label5" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/dbrwcx.aspx" data-ajax="false">
                                <img src="images_A/tb/10.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="Panel7" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="Label6" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div style="width: 55px; height: 55px; position: relative;">
                            <a href="app/task/rwfbdw.aspx" data-ajax="false">
                                <img src="images_a/tb/9.png" style="width: 60px; height: 60px;" />
                                <asp:Panel ID="Panel6" runat="server" Visible="false">
                                    <sub class="menu_sub" style="display: block;">
                                        <asp:Label ID="Label4" runat="server" ForeColor="#FFFFFF"></asp:Label>
                                    </sub>
                                </asp:Panel>
                            </a>
                        </div>
                    </li>
                </ul>
                <ul class="mn_tilct">
                    <li><a href="app/task/shdbrw.aspx" data-ajax="false" style="color: #000000;">审核任务</a></li>
                    <li><a href="app/task/dbrwcx.aspx" data-ajax="false" style="color: #000000;">查询任务</a></li>
                    <li><a href="app/task/rwfbdw.aspx" data-ajax="false" style="color: #000000;">任务发布单位</a></li>
                </ul>
                --%>
            </div>
            <%--固定底部--%>
            <div class="dibu">
                <nav class="mynav navbar navbar-default navbar-fixed-bottom">
                    <div class="mycon container">
                        <div class="myheader navbar-header">
                            <ul class="page_bottom">
                                <li>
                                    <a class="navbar-brand font-light m-b-0" onclick="window.location='portal/Msg.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon icon-bubble"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">消息</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='Index_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon  icon-screen-desktop"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light" onclick="dj(this)">汇总</h6>
                                    </a>
                                </li>

                                <li>
                                    <a class="navbar-brand" onclick="window.location='Main_A.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon   icon-grid end"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light end" onclick="dj(this)">首页</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='task/rwyj_a.aspx'">
                                        <span onclick="dj(this)" class="my_bottom_icon icon-bell"
                                            aria-hidden="true"></span>
                                        <h6 class="my_bottom_text font-light">预警</h6>
                                    </a>
                                </li>
                                <li>
                                    <a class="navbar-brand" onclick="window.location='portal/Set.aspx'">
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
