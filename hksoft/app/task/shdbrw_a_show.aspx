<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shdbrw_a_show.aspx.cs" Inherits="hksoft.app.task.shdbrw_a_show" %>


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
    <link href="../cssjs_a/frame/global.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="../js/custom.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>

    <script src="../cssjs_a/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
                $('#ff').css("display", "none");
            }
        })
    </script>

    <style>
        .btn {
            padding: 7px 16px;
        }

        #gv td {
            height: auto;
            text-align: center;
        }

        #GridView1 th {
            text-align: center;
            width: 22%;
        }

        #exampleModal {
            top: 30%;
        }

        [type="checkbox"]:not(:checked), [type="checkbox"]:checked {
            position: inherit;
            left: 0;
            opacity: 1;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div data-role="page" id="indexPage">
            <%-- 导航条--%>
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='shdbrw.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>查看任务</h1>
                    </div>
                </div>
            </div>



            <%-- 模态框 --%>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">查看完成说明</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <span id="p" style="word-break: break-all; overflow: hidden;"></span>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        </div>
                    </div>
                </div>
            </div>


            <div data-role="content" data-theme="d" class="mycontent_detail">

                <div class="row con_div" style="display: none">
                    <div class="col-12 text-center">
                        <span>查看[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]待办任务</span>
                    </div>

                </div>

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


                <table width="93%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr style="display: none;">
                        <td colspan="4" style="height: 25px;" class="td_base"></td>
                    </tr>

                    <tr id="gv">
                        <td colspan="4" align="center">
                            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Height="100%" Width="100%">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="jsid" EmptyDataText="" Width="98%" CssClass="hkgv">
                                    <Columns>

                                        <asp:TemplateField>
                                            <HeaderStyle Width="20px"></HeaderStyle>
                                            <ItemStyle Width="20px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="办理人"></asp:BoundField>
                                        <asp:BoundField DataField="jszt" HeaderText="状态">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="clsj" HeaderText="时间" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False" ReadOnly="True">
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="说明">
                                            <ItemTemplate>
                                                <div class="sm_tooltip">
                                                    <span data-toggle="tooltip" data-placement="top" 
                                                        data-original-title='<%# Eval("bzsm") %>' style="color:#007bff;"><%# Eval("bzsm").ToString().Length>3?Eval("bzsm").ToString().Substring(0,3)+"…":Eval("bzsm").ToString() %></span>
                                                </div>
                                                <%--<asp:Label data-toggle="tooltip" data-placement="top" title='<%# Bind("bzsm") %>' ID="Label3" CssClass="my_desc" runat="server" Text='<%# Bind("bzsm") %>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="附件">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="<%=qy_fjylurl.Text %><%# Eval("fjlj") %><%# Eval("fjmc") %>" style='<%# isshowfj(Eval("fjlj").ToString()+Eval("fjlj").ToString()) %>' target="_blank" id="f">预览</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>

                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="" Width="98%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall1" type="checkbox" onclick="chkAll1();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del1" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="牵头领导"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="" Width="98%" CssClass="hkgv">
                                    <Columns>
                                        <%--  <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView3.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="40px" />
                                                </asp:TemplateField>--%>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall2" type="checkbox" onclick="chkAll2();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del2" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="责任领导"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="" Width="98%" CssClass="hkgv">
                                    <Columns>

                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall3" type="checkbox" onclick="chkAll3();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del3" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="责任人"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>

                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>



                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>审批意见：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:TextBox ID="spyj" runat="server" Width="95%" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>审批评价：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:DropDownList ID="sppj" runat="server" Width="95%" CssClass="form-control">
                            <asp:ListItem Text="优" Value="优" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="良" Value="良"></asp:ListItem>
                            <asp:ListItem Text="中" Value="中"></asp:ListItem>
                            <asp:ListItem Text="差" Value="差"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>问责原因：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:TextBox ID="reason" runat="server" Width="95%" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div" style="display: none">
                    <div class="col-12 text-center">
                        <a href="#" onclick="javascript:popWin_s('ztdbrw_yh_wzview.aspx?rwid=<%=rwidstr.Text %>')"
                            class="gvlink">
                            <asp:Label ID="rwid" runat="server" hidden="true"></asp:Label>问责记录</a>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div" style="display: none">
                    <div class="col-12 text-center">
                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知办理人" />
                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知办理人" />
                    </div>
                </div>
                <div class="separated_line"></div>

                <div align="center" style="margin-bottom: 5%" class="btn_color">
                    <asp:Button CssClass="btn btn-success" ID="YesBtn" runat="server" Text="审核通过" OnClick="Yes_Click"
                        OnClientClick="return confirm('系统不会更新[未接收]状态的任务，确认要审核通过吗？')" />
                    <asp:Button CssClass="btn btn-primary" ID="NoBtn" runat="server" Text="审核退回" OnClick="No_Click"
                        OnClientClick="return confirm('系统不会更新[未接收]状态的任务，确认要审核退回吗？')" />
                    <asp:Button CssClass="btn btn-warning " ID="Button1" runat="server" Text="问责" OnClick="Send_Click1"
                        OnClientClick="return confirm('问责之后不能撤回，确认要问责吗？')" />
                    <asp:Button CssClass="btn btn-info" ID="OkBtn" runat="server" Text="任务完成" OnClick="Ok_Click"
                        OnClientClick="return confirm('标记为完成的任务将不能再审核，确认该任务已完成了吗？')" />

                </div>
            </div>
        </div>
    </form>
</body>
</html>

<script>
    function chkAll() {
        var chkall = document.all["chkall"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView1') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll1() {
        var chkall = document.all["chkall1"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView2') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll2() {
        var chkall = document.all["chkall2"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView3') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll3() {
        var chkall = document.all["chkall3"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView4') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
</script>




