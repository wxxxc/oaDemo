<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rwyujing.aspx.cs" Inherits="hksoft.oa.rwgl.rwyujing" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>任务预警</title>
    <style>
        td {
            text-align: center;
        }

        #AspNetPager1_btn {
            width: 50px;
            height: 25px;
        }
    </style>

</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row" style="line-height: 40px;">
                            <div class="col-12">
                                <div style="float: left; line-height: 40px;">
                                 <p  onclick="click_block1(1);" style="float:left"> &nbsp;&nbsp;<asp:Image ID="Image2" runat="server" ImageUrl="../../images/wz.gif"  />&nbsp;&nbsp;未接收任务预警&nbsp;&nbsp;</p>
                                 <p  onclick="click_block1(2);" style="float:left;">  &nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/yes.gif" />&nbsp;&nbsp;超时任务预警&nbsp;&nbsp;</p>
                           
                                </div>
                                </div>
                            </div>
                            </div>
                        </div>


                        <div id="one" class="row" style="margin-top: 10px; display:block">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="up1">
                                    <ContentTemplate>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView1" runat="server"
                                                AutoGenerateColumns="False" DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="被提醒人">
                                                        <HeaderStyle CssClass="mw300" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="jsdx" runat="server"  Text='<%# getnamebyid(Eval("jsr").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>   
                                                    <asp:TemplateField HeaderText="超出时间">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw180" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljlsj"  style="color:red; font-weight:900;opacity: 5.8;font-size: 17px; border-radius: 3px;" runat="server" Text=""></asp:Label>
                                                            <asp:Label ID="Labeljlsj_temp" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>' Style="display: none;"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="任务标题">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('indexshview.aspx?rwid=<%# Eval("rwid") %>')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label ID="Labelrwbt" runat="server" Text='<%# Eval("rwbt").ToString().Length>50?Eval("rwbt").ToString().Substring(0,50)+"…":Eval("rwbt").ToString() %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mw300" />
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField HeaderText="发布时间">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw180" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="11">
                                        </webdiyer:AspNetPager>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                  <div id="two" class="row" style="margin-top: 10px; display:none">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                                    <ContentTemplate>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView2" runat="server"
                                                AutoGenerateColumns="False" DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="被提醒人">
                                                        <HeaderStyle CssClass="mw300" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="jsdx" runat="server"  Text='<%# getnamebyid(Eval("jsr").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>   
                                                    <asp:TemplateField HeaderText="超出时间">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw180" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljlsj1"  style="color:red; font-weight:900;opacity: 5.8;font-size: 17px; border-radius: 3px;" runat="server" Text=""></asp:Label>
                                                            <asp:Label ID="Labeljlsj_temp1" runat="server" Text='<%# Bind("jzrq", "{0:yyyy-MM-dd HH:mm:ss}") %>' Style="display: none;"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="任务标题">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('indexshview.aspx?rwid=<%# Eval("rwid") %>')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label ID="Labelrwbt" runat="server" Text='<%# Eval("rwbt").ToString().Length>50?Eval("rwbt").ToString().Substring(0,50)+"…":Eval("rwbt").ToString() %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mw300" />
                                                    </asp:TemplateField>
                                                    
                                                    <asp:TemplateField HeaderText="发布时间">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw180" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                     <asp:TemplateField HeaderText="截止日期">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw180" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljzsj" runat="server" Text='<%# Bind("jzrq", "{0:yyyy-MM-dd HH:mm:ss}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server" OnPageChanged="AspNetPager2_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="11">
                                        </webdiyer:AspNetPager>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                </div>
    </form>
</body>
<script>
    function click_block1(num) {
        if (num == 1) {
            $('#one').css("display", "block");
            $('#two').css("display", "none");
        }else {
            $('#two').css("display", "block");
            $('#one').css("display", "none");
        }
    }
    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }
    var time = setInterval('showTime()', 500);
    //showTime();
    function showTime() {
        $("span[id$='_Labeljlsj_temp']").each(function () {
            //var time_start = $(this).text();
            var timedate = new Date($(this).text());
            var now = new Date();                                         //获取当前时间
            var date = parseInt(now.getTime() - timedate.getTime()) / 1000; //得出的为秒数；
            //if (date <= 0) {
            //    document.getElementById("txtshow").innerHTML = "倒计时已经结束";
            //    clearInterval(time);
            //}
            var day = parseInt(date / 60 / 60 / 24);
            var hour = parseInt(date / 60 / 60 % 24);
            var minute = parseInt(date / 60 % 60);
            var second = parseInt(date % 60);
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            var leftTime = day + "天" + hour + "时" + minute + "分" + second + "秒";
            $(this).prev().text(leftTime);
        });
        $("span[id$='_Labeljlsj_temp1']").each(function () {
            //var time_start = $(this).text();
            var timedate = new Date($(this).text());
            var now = new Date();                                         //获取当前时间
            var date = parseInt(now.getTime() - timedate.getTime()) / 1000; //得出的为秒数；
            //if (date <= 0) {
            //    document.getElementById("txtshow").innerHTML = "倒计时已经结束";
            //    clearInterval(time);
            //}
            var day = parseInt(date / 60 / 60 / 24);
            var hour = parseInt(date / 60 / 60 % 24);
            var minute = parseInt(date / 60 % 60);
            var second = parseInt(date % 60);
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);
            var leftTime = day + "天" + hour + "时" + minute + "分" + second + "秒";
            $(this).prev().text(leftTime);
        });
    }

</script>
</html>
