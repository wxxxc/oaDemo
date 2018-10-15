<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="hksoft.Main" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title id="PageTitle" runat="server"></title>
    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
    <link href="res/css/default.css" rel="stylesheet" type="text/css" />
    <link href="res/css/mymain.css" rel="stylesheet" type="text/css" />
    <style>
     #RegionPanel1_leftRegion_treeMenu .x-grid-cell-inner-treecolumn {
    padding: 4px 10px;
    font-size:16px;
    border-width:1px 0 1px 0;
}
     #RegionPanel1_leftRegion_treeMenu table{
         height:35px;
     }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" AutoSizePanelID="RegionPanel1" runat="server"></f:PageManager>
        <f:RegionPanel ID="RegionPanel1" ShowBorder="false" runat="server">
            <Regions>
                <f:Region ID="Region1" ShowBorder="false" ShowHeader="false"
                    Position="Top" Layout="Fit" runat="server" CssClass="region-top">
                    <Content>
                        <div id="header">
                            <table>
                                <tr>
                                    <td style="width: 50px">
                                        <img src="images/logo.png" alt="Logo" />
                                    </td>
                                    <td>
                                        <a class="title" href="http://www.yn66.com.cn/"><%=strLogo %></a>
                                    </td>
                                    <td align="right">
                                        <%=strDate %>&nbsp;<font color="#ffffff"><script language="javascript" type="text/javascript">
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
</script></font>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </Content>
                    <Toolbars>
                        <f:Toolbar ID="topRegionToolbar" Position="Bottom" CssClass="topbar" runat="server">
                            <Items>
                                <f:ToolbarText ID="txtUser" runat="server" CssStyle="color:#ffff00">
                                </f:ToolbarText>
                                <f:Panel ID="Panel1" runat="server" ShowBorder="false" ShowHeader="false" Title="消息提醒" EnableIFrame="true" IFrameName="iframe_msg" IFrameUrl="MsgRemind.aspx" Width="21px" Height="21px">
                                </f:Panel>
                                <f:ToolbarSeparator ID="ToolbarSeparator1" runat="server" />
                                <f:Label ID="lblMenu" runat="server" EncodeText="false"></f:Label>
                                <f:Label ID="lblTx" runat="server" Text="如果您在试用时界面显示异常，请将浏览器切换为极速(或IE兼容)模式" CssClass="mainLabel" Hidden="true"></f:Label>
                                <f:Image ID="Img1" runat="server" ImageUrl="images/hot.gif" Hidden="true"></f:Image>
                                <f:ToolbarFill ID="ToolbarFill1" runat="server" />
                                <f:Button ID="btnRefresh" runat="server" Icon="Reload" ToolTip="刷新主区域内容" EnablePostBack="false">
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator5" runat="server" />
                                <f:Button ID="btnMenu" Text="个人选项" EnablePostBack="false" runat="server" Icon="Help">
                                    <Menu ID="Menu1" runat="server">
                                    </Menu>
                                </f:Button>
                                <f:ToolbarSeparator ID="ToolbarSeparator6" runat="server" />
                                <f:Button ID="btnExit" runat="server" Icon="UserRed" Text="注销退出" ConfirmText="确定退出系统？"
                                    OnClick="btnExit_Click">
                                </f:Button>
                            </Items>
                        </f:Toolbar>
                    </Toolbars>
                </f:Region>
                <f:Region ID="leftRegion" Split="true" Width="200px" ShowHeader="true" ShowBorder="true"
                    EnableCollapse="true" Layout="Fit" Position="Left" runat="server" CssClass="mymain">
                    <Items>
                        <f:ContentPanel runat="server" ID="userinfo">
                            <div>
                                <div style="border-bottom:1px solid #1475BB;">
                                    <div class="avatar" >
                                        <img src="<%=userImg  %>" />
                                    </div>
                                    <div class="name">
                                        <%=userName  %>
                                    </div>
                                    <div style="clear:both;"></div>
                                </div>
                                <div style="margin-top:1px;">
                                    <div class="item" style="border-right:1px solid #1475BB;">
                                        <div class="title">部门</div>
                                        <div class="value" style="color:#5CB9EB"><%=userDep  %></div>
                                    </div>
                                    <div class="item">
                                        <div class="title">职位</div>
                                        <div class="value" style="color:#5CB9EB"><%=userPos  %></div>
                                    </div>
                                    <div class="item" style="width:190px;border-top:1px solid #1475BB;border-bottom:1px solid #1475BB;">
                                        <div class="title">工作评分</div>
                                        <div class="value"><%=score  %></div>
                                    </div>
                                </div>
                            </div>
                        </f:ContentPanel>
                    </Items>
                </f:Region>
                <f:Region ID="mainRegion" ShowHeader="false" Layout="Fit" ShowBorder="true" Position="Center"
                    runat="server">
                    <Items>
                        <f:TabStrip ID="mainTabStrip" EnableTabCloseMenu="true" ShowBorder="false" runat="server">
                            <Tabs>
                                <f:Tab ID="Tab2" Title="温泉重点工作汇总一览" Layout="Fit" Icon="House" EnableIFrame="true" IFrameUrl="index.aspx" runat="server">
                                    <Items>
                                        <f:ContentPanel ID="ContentPanel2" ShowBorder="false" BodyPadding="5px" ShowHeader="false" AutoScroll="true"
                                            runat="server">
                                        </f:ContentPanel>
                                    </Items>
                                </f:Tab>
                                <f:Tab ID="Tab1" Title="我的任务管理" Layout="Fit" Icon="User" EnableIFrame="true" IFrameUrl="myInitMain.aspx" runat="server">
                                    <Items>
                                        <f:ContentPanel ID="ContentPanel1" ShowBorder="false" BodyPadding="5px" ShowHeader="false" AutoScroll="true"
                                            runat="server">
                                        </f:ContentPanel>
                                    </Items>
                                </f:Tab>
                                <%--<f:Tab ID="Tab2" Title="待办事项" Layout="Fit" Icon="FolderUser" EnableIFrame="true" IFrameUrl="Dbsx.aspx" runat="server">
                                    <Items>
                                        <f:ContentPanel ID="ContentPanel2" ShowBorder="false" BodyPadding="5px" ShowHeader="false" AutoScroll="true"
                                            runat="server">
                                        </f:ContentPanel>
                                    </Items>
                                </f:Tab>--%>
                            </Tabs>
                        </f:TabStrip>
                    </Items>
                </f:Region>
                <f:Region ID="bottomPanel" RegionPosition="Bottom" ShowBorder="false" ShowHeader="false" EnableCollapse="false" runat="server" Layout="Fit">
                    <Items>
                        <f:ContentPanel runat="server" ShowBorder="false" ShowHeader="false">
                            <table class="bottomtable">
                                <tr>
                                    <td>&nbsp;<asp:Label ID="lblBottom" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </f:ContentPanel>
                    </Items>
                </f:Region>
            </Regions>
        </f:RegionPanel>
        <f:Menu ID="menuSettings" runat="server">
            <f:MenuButton ID="btnExpandAll" IconUrl="~/res/images/expand-all.gif" Text="展开菜单" EnablePostBack="false"
                runat="server">
            </f:MenuButton>
            <f:MenuButton ID="btnCollapseAll" IconUrl="~/res/images/collapse-all.gif" Text="折叠菜单"
                EnablePostBack="false" runat="server">
            </f:MenuButton>
        </f:Menu>
        <a id="toggleheader" href="javascript:;"></a>
    </form>
    <script src="res/js/jquery.min.js"></script>
    <script src="res/js/default.js" type="text/javascript"></script>
    <script>
        window.onload = function () {
            
        }
    </script>
</body>
</html>
