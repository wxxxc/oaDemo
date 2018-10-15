<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myMain.aspx.cs" Inherits="hksoft.myMain" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>温泉街道办重点工作 & 绩效考核综合管理平台</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
    <link href="css/bootstrap.addtabs.css" rel="stylesheet">
    <link href="css/mybootstrap.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
<![endif]-->
</head>

<body class="fix-header fix-sidebar card-no-border">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_mymain"></asp:ScriptManager>
        <asp:Button runat="server" ID="fsk_logout" OnClick="btnExit_Click" Style="display: none;" />
        <asp:TextBox runat="server" ID="txt_msgid" Style="display: none;" Text="0"></asp:TextBox>
        <asp:UpdatePanel runat="server" ID="up2">
            <ContentTemplate>
                <asp:Button runat="server" ID="btn_readmsg" OnClick="btn_readmsg_Click" Style="display: none;" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
            </svg>
        </div>
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar">
                <nav class="navbar top-navbar navbar-expand-md navbar-light">
                    <!-- ============================================================== -->
                    <!-- Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-header">
                        <a class="navbar-brand" href="myMain.aspx?from=O">
                            <!-- Logo icon -->
                            <b>
                                <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                                <!-- Dark Logo icon -->
                                <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo icon -->
                                <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo" />
                            </b>
                            <!--End Logo icon -->
                            <!-- Logo text -->
                            <span>
                                <!-- dark Logo text -->
                                <img src="assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                                <!-- Light Logo text -->
                                <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Logo -->
                    <!-- ============================================================== -->
                    <div class="navbar-collapse">
                        <!-- ============================================================== -->
                        <!-- toggle and nav items -->
                        <!-- ============================================================== -->
                        <ul class="navbar-nav mr-auto mt-md-0">
                            <!-- This is  -->
                            <li class="nav-item"><a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a></li>
                            <li class="nav-item"><a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a></li>
                            <!-- ============================================================== -->
                        </ul>
                        <!-- ============================================================== -->
                        <!-- system info -->
                        <ul class="navbar-nav mr-auto my-lg-0 mytitle">
                            <li class="nav-item" style="font-size: 20px;"><%=strLogo %></li>
                            <li class="nav-item" style="margin-left: 15px; line-height: 30px;"><%=strDate %></li>
                            <li class="nav-item" style="margin-left: 5px; line-height: 30px;"><font color="#ffffff"><script  lang="javascript" type="text/javascript">
                                                                                                                        // JavaScript Document
                                                                                                                        function RunGLNL() {
                                                                                                                            var today = new Date();
                                                                                                                            var d = new Array("周日", "周一", "周二", "周三", "周四", "周五", "周六");
                                                                                                                            var DDDD = d[today.getDay()];
                                                                                                                            DDDD = DDDD + (CnDateofDateStr(today)); //显示农历
                                                                                                                            document.write(DDDD);
                                                                                                                        }
                                                                                                                        function DaysNumberofDate(DateGL) {
                                                                                                                            return parseInt((Date.parse(DateGL) - Date.parse(DateGL.getFullYear() + "/1/1")) / 86400000) + 1;
                                                                                                                        }
                                                                                                                        function CnDateofDate(DateGL) {
                                                                                                                            var CnData = new Array(
                                                                            0x16, 0x2a, 0xda, 0x00, 0x83, 0x49, 0xb6, 0x05, 0x0e, 0x64, 0xbb, 0x00, 0x19, 0xb2, 0x5b, 0x00,
                                                                            0x87, 0x6a, 0x57, 0x04, 0x12, 0x75, 0x2b, 0x00, 0x1d, 0xb6, 0x95, 0x00, 0x8a, 0xad, 0x55, 0x02,
                                                                            0x15, 0x55, 0xaa, 0x00, 0x82, 0x55, 0x6c, 0x07, 0x0d, 0xc9, 0x76, 0x00, 0x17, 0x64, 0xb7, 0x00,
                                                                            0x86, 0xe4, 0xae, 0x05, 0x11, 0xea, 0x56, 0x00, 0x1b, 0x6d, 0x2a, 0x00, 0x88, 0x5a, 0xaa, 0x04,
                                                                            0x14, 0xad, 0x55, 0x00, 0x81, 0xaa, 0xd5, 0x09, 0x0b, 0x52, 0xea, 0x00, 0x16, 0xa9, 0x6d, 0x00,
                                                                            0x84, 0xa9, 0x5d, 0x06, 0x0f, 0xd4, 0xae, 0x00, 0x1a, 0xea, 0x4d, 0x00, 0x87, 0xba, 0x55, 0x04
                                                                            );
                                                                                                                            var CnMonth = new Array();
                                                                                                                            var CnMonthDays = new Array();
                                                                                                                            var CnBeginDay;
                                                                                                                            var LeapMonth;
                                                                                                                            var Bytes = new Array();
                                                                                                                            var I;
                                                                                                                            var CnMonthData;
                                                                                                                            var DaysCount;
                                                                                                                            var CnDaysCount;
                                                                                                                            var ResultMonth;
                                                                                                                            var ResultDay;
                                                                                                                            var yyyy = DateGL.getFullYear();
                                                                                                                            var mm = DateGL.getMonth() + 1;
                                                                                                                            var dd = DateGL.getDate();
                                                                                                                            if (yyyy < 100) yyyy += 1900;
                                                                                                                            if ((yyyy < 1997) || (yyyy > 2020)) {
                                                                                                                                return 0;
                                                                                                                            }
                                                                                                                            Bytes[0] = CnData[(yyyy - 1997) * 4];
                                                                                                                            Bytes[1] = CnData[(yyyy - 1997) * 4 + 1];
                                                                                                                            Bytes[2] = CnData[(yyyy - 1997) * 4 + 2];
                                                                                                                            Bytes[3] = CnData[(yyyy - 1997) * 4 + 3];
                                                                                                                            if ((Bytes[0] & 0x80) != 0) { CnMonth[0] = 12; }
                                                                                                                            else { CnMonth[0] = 11; }
                                                                                                                            CnBeginDay = (Bytes[0] & 0x7f);
                                                                                                                            CnMonthData = Bytes[1];
                                                                                                                            CnMonthData = CnMonthData << 8;
                                                                                                                            CnMonthData = CnMonthData | Bytes[2];
                                                                                                                            LeapMonth = Bytes[3];
                                                                                                                            for (I = 15; I >= 0; I--) {
                                                                                                                                CnMonthDays[15 - I] = 29;
                                                                                                                                if (((1 << I) & CnMonthData) != 0) {
                                                                                                                                    CnMonthDays[15 - I]++;
                                                                                                                                }
                                                                                                                                if (CnMonth[15 - I] == LeapMonth) {
                                                                                                                                    CnMonth[15 - I + 1] = -LeapMonth;
                                                                                                                                }
                                                                                                                                else {
                                                                                                                                    if (CnMonth[15 - I] < 0) { CnMonth[15 - I + 1] = -CnMonth[15 - I] + 1; }
                                                                                                                                    else { CnMonth[15 - I + 1] = CnMonth[15 - I] + 1; }
                                                                                                                                    if (CnMonth[15 - I + 1] > 12) { CnMonth[15 - I + 1] = 1; }
                                                                                                                                }
                                                                                                                            }
                                                                                                                            DaysCount = DaysNumberofDate(DateGL) - 1;
                                                                                                                            if (DaysCount <= (CnMonthDays[0] - CnBeginDay)) {
                                                                                                                                if ((yyyy > 1901) && (CnDateofDate(new Date((yyyy - 1) + "/12/31")) < 0)) {
                                                                                                                                    ResultMonth = -CnMonth[0];
                                                                                                                                }
                                                                                                                                else { ResultMonth = CnMonth[0]; }
                                                                                                                                ResultDay = CnBeginDay + DaysCount;
                                                                                                                            }
                                                                                                                            else {
                                                                                                                                CnDaysCount = CnMonthDays[0] - CnBeginDay;
                                                                                                                                I = 1;
                                                                                                                                while ((CnDaysCount < DaysCount) && (CnDaysCount + CnMonthDays[I] < DaysCount)) {
                                                                                                                                    CnDaysCount += CnMonthDays[I];
                                                                                                                                    I++;
                                                                                                                                }
                                                                                                                                ResultMonth = CnMonth[I];
                                                                                                                                ResultDay = DaysCount - CnDaysCount;
                                                                                                                            }
                                                                                                                            if (ResultMonth > 0) {
                                                                                                                                return ResultMonth * 100 + ResultDay;
                                                                                                                            }
                                                                                                                            else { return ResultMonth * 100 - ResultDay; }
                                                                                                                        }
                                                                                                                        function CnYearofDate(DateGL) {
                                                                                                                            var YYYY = DateGL.getFullYear();
                                                                                                                            var MM = DateGL.getMonth() + 1;
                                                                                                                            var CnMM = parseInt(Math.abs(CnDateofDate(DateGL)) / 100);
                                                                                                                            if (YYYY < 100) YYYY += 1900;
                                                                                                                            if (CnMM > MM) YYYY--;
                                                                                                                            YYYY -= 1864;
                                                                                                                            return CnEra(YYYY) + "年";
                                                                                                                        }
                                                                                                                        function CnMonthofDate(DateGL) {
                                                                                                                            var CnMonthStr = new Array("零", "正", "二", "三", "四", "五", "六", "七", "八", "九", "十", "冬", "腊");
                                                                                                                            var Month;
                                                                                                                            Month = parseInt(CnDateofDate(DateGL) / 100);
                                                                                                                            if (Month < 0) { return "闰" + CnMonthStr[-Month] + "月"; }
                                                                                                                            else { return CnMonthStr[Month] + "月"; }
                                                                                                                        }
                                                                                                                        function CnDayofDate(DateGL) {
                                                                                                                            var CnDayStr = new Array("零",
                                                                                "初一", "初二", "初三", "初四", "初五",
                                                                                "初六", "初七", "初八", "初九", "初十",
                                                                                "十一", "十二", "十三", "十四", "十五",
                                                                                "十六", "十七", "十八", "十九", "二十",
                                                                                "廿一", "廿二", "廿三", "廿四", "廿五",
                                                                                "廿六", "廿七", "廿八", "廿九", "三十");
                                                                                                                            var Day;
                                                                                                                            Day = (Math.abs(CnDateofDate(DateGL))) % 100;
                                                                                                                            return CnDayStr[Day];
                                                                                                                        }
                                                                                                                        function DaysNumberofMonth(DateGL) {
                                                                                                                            var MM1 = DateGL.getFullYear();
                                                                                                                            MM1 < 100 ? MM1 += 1900 : MM1;
                                                                                                                            var MM2 = MM1;
                                                                                                                            MM1 += "/" + (DateGL.getMonth() + 1);
                                                                                                                            MM2 += "/" + (DateGL.getMonth() + 2);
                                                                                                                            MM1 += "/1";
                                                                                                                            MM2 += "/1";
                                                                                                                            return parseInt((Date.parse(MM2) - Date.parse(MM1)) / 86400000);
                                                                                                                        }
                                                                                                                        function CnEra(YYYY) {
                                                                                                                            var Tiangan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
                                                                                                                            //var Dizhi=new Array("子(鼠)","丑(牛)","寅(虎)","卯(兔)","辰(龙)","巳(蛇)",
                                                                                                                            //"午(马)","未(羊)","申(猴)","酉(鸡)","戌(狗)","亥(猪)");
                                                                                                                            var Dizhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
                                                                                                                            return Tiangan[YYYY % 10] + Dizhi[YYYY % 12];
                                                                                                                        }
                                                                                                                        function CnDateofDateStr(DateGL) {
                                                                                                                            if (CnMonthofDate(DateGL) == "零月") return "　请调整您的计算机日期!";
                                                                                                                            else return "【农历" + CnMonthofDate(DateGL) + CnDayofDate(DateGL) + "】";
                                                                                                                        }

                                                                                                                        function CAL()
                                                                                                                        { }
                                                                                                                        RunGLNL();
</script></font></li>
                        </ul>
                        <!-- ============================================================== -->
                        <ul class="navbar-nav my-lg-0">
                            <!-- ============================================================== -->
                            <!-- Comment -->
                            <!-- ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="#OnlineUser.aspx" data-addtab="r_wechat" data-url="OnlineUser.aspx" data-title="在线用户">
                                    <i class="fa fa-wechat"></i>
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onclick="getmsgs();">
                                    <i class="mdi mdi-message"></i>
                                    <div class="notify"><%=msgicon %></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right mailbox scale-up">
                                    <ul>
                                        <li>
                                            <div class="drop-title">消息</div>
                                        </li>
                                        <li>
                                            <div class="message-center">
                                                <asp:UpdatePanel runat="server" ID="up1" ChildrenAsTriggers="true">
                                                    <ContentTemplate>
                                                        <!-- Message -->
                                                        <%=msg %>
                                                        <asp:Button runat="server" ID="btn_getmsgs" OnClick="btn_getmsgs_Click" Style="display: none;" />
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </li>
                                        <li>
                                            <a class="nav-link text-center" href="javascript:void(0);" data-addtab="msghistory" data-title="我的消息" data-url="portal/xxgl/sxx.aspx">
                                                <strong>查看全部消息</strong>
                                                <i class="fa fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <!-- ============================================================== -->
                            <!-- End Comment -->
                            <!-- ============================================================== -->

                            <!-- ============================================================== -->
                            <!-- Profile -->
                            <!-- ============================================================== -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="<%=userImg %>" alt="头像" class="profile-pic" /></a>
                                <div class="dropdown-menu dropdown-menu-right scale-up">
                                    <ul class="dropdown-user myinfo">
                                        <li>
                                            <div class="dw-user-box">
                                                <div class="u-img">
                                                    <img src="<%=userImg %>" alt="头像">
                                                </div>
                                                <div class="u-text">
                                                    <h4><%=userName %></h4>
                                                    <%--<p class="text-muted">varun@gmail.com</p>--%>
                                                    <a data-addtab="rt_myprofile" data-url="Mod_Zl.aspx" href="#Mod_Zl.aspx" class="btn btn-rounded btn-danger btn-sm" style="margin-top: 10px;">个人页面</a>
                                                </div>
                                            </div>
                                        </li>
                                        <li role="separator" class="divider"></li>
                                        <li><a data-addtab="r_myprofile" data-url="Mod_Zl.aspx" href="#Mod_Zl.aspx"><i class="ti-user"></i>个人资料</a></li>
                                        <li><a data-addtab="r_editpw" data-url="Mod_Pwd.aspx" href="#Mod_Pwd.aspx"><i class="ti-key"></i>修改密码</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a data-addtab="r_myset" data-url="MySet.aspx" href="#MySet.aspx"><i class="ti-settings"></i>个人设定</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="#" onclick="logout();"><i class="fa fa-power-off"></i>注销退出</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!-- ============================================================== -->
            <!-- End Topbar header -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <aside class="left-sidebar">
                <!-- Sidebar scroll-->
                <div class="scroll-sidebar">
                    <!-- User profile -->
                    <div class="user-profile" style="background: url(assets/images/background/user-info.jpg) no-repeat;">
                        <!-- User profile image -->
                        <div class="profile-img" style="float: left;">
                            <img src="<%=userImg %>" alt="头像" />
                        </div>
                        <div class="sidebar_userinfo" style="float: left; margin-left: 5px; margin-top: 10px; width: 160px;">
                            <span class="label label-rounded label- mylabel_sidebar_userinfo">部门：<%=userDep %></span>
                            <br>
                            <span class="label label-rounded label- mylabel_sidebar_userinfo">职位：<%=userPos %></span>
                            <br>
                            <span class="label label-rounded label- mylabel_sidebar_userinfo">工作得分：<font color="#fff"><%=score %></font></span>
                        </div>
                        <div style="clear: both;"></div>
                        <!-- User profile text-->
                        <div class="profile-text">
                            <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><%=userName %></a>
                            <div class="dropdown-menu animated flipInY myprofile">
                                <a class="dropdown-item" data-addtab="l_myprofile" data-url="Mod_Zl.aspx" href="#Mod_Zl.aspx"><i class="ti-user"></i>个人资料</a>
                                <a class="dropdown-item" data-addtab="l_editpw" data-url="Mod_Pwd.aspx" href="#Mod_Pwd.aspx"><i class="ti-key"></i>修改密码</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" data-addtab="l_myset" data-url="MySet.aspx" href="#MySet.aspx"><i class="ti-settings"></i>个人设定</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" onclick="logout();"><i class="fa fa-power-off"></i>注销退出</a>
                            </div>
                        </div>
                    </div>
                    <!-- End User profile text-->
                    <!-- Sidebar navigation-->
                    <nav class="sidebar-nav">
                        <ul id="sidebarnav" class="mymenu">
                            <li class="nav-small-cap" style="font-size: 16px; padding: 0 15px;">系统菜单</li>
                            <%=menu %>
                        </ul>
                    </nav>
                    <!-- End Sidebar navigation -->
                </div>
                <!-- End Sidebar scroll-->
                <!-- Bottom points-->
                <div class="sidebar-footer">
                    <!-- item-->
                    <a href="#Mod_Pwd.aspx" class="link" data-toggle="tooltip" title="修改密码" data-addtab="l_editpw" data-url="Mod_Pwd.aspx" data-title="修改密码"><i class="ti-key"></i></a>
                    <!-- item-->
                    <a href="#" class="link" data-toggle="tooltip" title="退出" onclick="logout();"><i class="mdi mdi-power"></i></a>
                </div>
                <!-- End Bottom points-->
            </aside>
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <%--<div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0" id="bread_crumb_title_h3">温泉街道办综合管理平台</h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">首页</a></li>
                            <li class="breadcrumb-item active" id="bread_crumb_title_li">温泉重点工作一览</li>
                        </ol>
                    </div>
                    <div class="col-md-7 col-4 align-self-center">
                        <div class="d-flex m-t-10 justify-content-end">
                            <div class="">
                                <button class="right-side-toggle waves-effect waves-light btn-success btn btn-circle btn-sm pull-right m-l-10" title="设置主题" style="top: 90px;"><i class="ti-settings text-white"></i></button>
                            </div>
                        </div>
                    </div>
                </div>--%>
                    <!-- ============================================================== -->
                    <!-- End Bread crumb and right sidebar toggle -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <div class="row" style="padding-top: 10px;">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div>
                                                <!-- Nav tabs -->
                                                <ul class="nav nav-tabs" id="mytab" role="tablist" style="margin-bottom: 5px;">
                                                    <li class="active" role="presentation" aria-expanded="false">
                                                        <a aria-controls="totalwork" data-toggle="tab" href="#totalwork" role="tab" onclick="mytab_li_init_click(this);" class="active" aria-expanded="true">温泉重点工作一览
                                                        </a>
                                                    </li>
                                                    <li role="presentation" aria-expanded="false">
                                                        <a aria-controls="mywork" data-toggle="tab" href="#mywork" role="tab" onclick="mytab_li_init_click(this);" class="active" aria-expanded="true">我的任务管理
                                                        </a>
                                                    </li>
                                                </ul>
                                                <!-- Tab panes -->
                                                <div class="tab-content" style="width: 100%;">
                                                    <div class="tab-pane active" id="totalwork" role="tabpanel">
                                                        <iframe src="index.aspx" frameborder="0" width="100%" scrolling="auto" height="705"></iframe>
                                                    </div>
                                                    <div class="tab-pane" id="mywork" role="tabpanel">
                                                        <iframe src="myInitMain.aspx" frameborder="0" width="100%" scrolling="auto" height="705"></iframe>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <div class="right-sidebar">
                        <div class="slimscrollright">
                            <div class="rpanel-title">主题切换 <span><i class="ti-close right-side-toggle"></i></span></div>
                            <div class="r-panel-body">
                                <ul id="themecolors" class="m-t-20">
                                    <li><b>浅色菜单</b></li>
                                    <li><a href="javascript:void(0)" data-theme="default" class="default-theme">1</a></li>
                                    <li><a href="javascript:void(0)" data-theme="green" class="green-theme">2</a></li>
                                    <li><a href="javascript:void(0)" data-theme="red" class="red-theme">3</a></li>
                                    <li><a href="javascript:void(0)" data-theme="blue" class="blue-theme working">4</a></li>
                                    <li><a href="javascript:void(0)" data-theme="purple" class="purple-theme">5</a></li>
                                    <li><a href="javascript:void(0)" data-theme="megna" class="megna-theme">6</a></li>
                                    <li class="d-block m-t-30"><b>深色菜单</b></li>
                                    <li><a href="javascript:void(0)" data-theme="default-dark" class="default-dark-theme">7</a></li>
                                    <li><a href="javascript:void(0)" data-theme="green-dark" class="green-dark-theme">8</a></li>
                                    <li><a href="javascript:void(0)" data-theme="red-dark" class="red-dark-theme">9</a></li>
                                    <li><a href="javascript:void(0)" data-theme="blue-dark" class="blue-dark-theme">10</a></li>
                                    <li><a href="javascript:void(0)" data-theme="purple-dark" class="purple-dark-theme">11</a></li>
                                    <li><a href="javascript:void(0)" data-theme="megna-dark" class="megna-dark-theme ">12</a></li>
                                </ul>
                                <ul class="m-t-20 chatonline">
                                    <li><b>Chat option</b></li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/1.jpg" alt="user-img" class="img-circle">
                                            <span>Varun Dhavan <small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/2.jpg" alt="user-img" class="img-circle">
                                            <span>Genelia Deshmukh <small class="text-warning">Away</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/3.jpg" alt="user-img" class="img-circle">
                                            <span>Ritesh Deshmukh <small class="text-danger">Busy</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/4.jpg" alt="user-img" class="img-circle">
                                            <span>Arijit Sinh <small class="text-muted">Offline</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/5.jpg" alt="user-img" class="img-circle">
                                            <span>Govinda Star <small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/6.jpg" alt="user-img" class="img-circle">
                                            <span>John Abraham<small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/7.jpg" alt="user-img" class="img-circle">
                                            <span>Hritik Roshan<small class="text-success">online</small></span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)">
                                            <img src="../assets/images/users/8.jpg" alt="user-img" class="img-circle">
                                            <span>Pwandeep rajan <small class="text-success">online</small></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
                </div>
                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- footer -->
                <!-- ============================================================== -->
                <footer class="footer">
                    © 2018
                <asp:Label ID="lblBottom" runat="server"></asp:Label>
                </footer>
                <!-- ============================================================== -->
                <!-- End footer -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- system modal start -->
        <div id="fsk-alert" class="modal" style="top: 15%;">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header" style="display: block;">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h5 class="modal-title"><i class="fa fa-exclamation-circle" style="margin-right: 5px;"></i>[Title]</h5>
                    </div>
                    <div class="modal-body small">
                        <p>[Message]</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary ok" data-dismiss="modal">[BtnOk]</button>
                        <button type="button" class="btn btn-default cancel" data-dismiss="modal">[BtnCancel]</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <!-- system modal end -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="js/custom.min.js"></script>
    <!--Bootstrap addtabs JavaScript -->
    <script src="js/bootstrap.addtabs.js"></script>
    <script src="js/myselfjs.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
    <script>
        function send_request(url)
        {
            http_request=false;
            if(window.XMLHttpRequest)//Mozilla 浏览器
            {
                http_request=new XMLHttpRequest();
                if(http_request.overrideMimeType)//设置MiME类别
                {
                    http_request.overrideMimeType("text/xml");
                }
            }
            else if(window.ActiveXObject)// IE浏览器
            {
                try
                {
                    http_request=new ActiveXObject("Msxml2.XMLHTTP");
                }
                catch(e)
                {
                    try
                    {
                        http_request=new ActivexObject("Microsoft.XMLHTTP");
                    }
                    catch(e)
                    {}
                }
            }
            if(!http_request)// 异常，创建对象实例失败
            {
                content.innerHTML="不能创建XMLHttpRequest对象实例";
                return false;
            }
            //指定服务器返回信息时处理程序
            http_request.onreadystatechange=processRequest;
            // 确定发送请求的方式和URL以及是否同步执行下段代码
            http_request.open("GET",url,true);
            http_request.send(null);
        }

        function processRequest()
        {
            if(http_request.readyState==4)
            {				
                if(http_request.status==200)
                {			 		

                }
                else
                {

                }
            }
        }
        window.setInterval("send_request('myMsgRemindAjax.aspx?tmp='+Math.random())",<%=RemTimeStr%>);
    </script>
</body>
</html>


