<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_fbdbrw.aspx.cs" Inherits="hksoft.app.task.Add_fbdbrw" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../bootstrap/css/base.css" rel="stylesheet" />
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
    <script src="../cssjs_a/WebCalendar.js"></script>
    <style>
        input {
            width: 100%;
        }

        .table-bordered tr, td {
            border-bottom: 1px solid #e4dada; /* 整体表格边框 */
            height: 50px;
            font-size: 15px;
        }

        .modal-dialog {
            margin-top: 20%;
        }
        .mycontent_index li.list-group-item .info_chk {
    float: left;
    height: 30px;
    line-height: 30px;
}
     
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div data-role="page" id="indexPage">
            <%-- 导航条--%>
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='../Main_A.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>新增待办任务</h1>
                    </div>
                </div>
            </div>
            <div data-role="content" data-theme="d" class="mycontent_detail">
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务来源：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="rwly" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <font color="red">*</font><span>任务标题：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="rwbt" runat="server" CssClass="form-control" ValidationGroup="g_tj"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <font color="red">*</font><span>接收人：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="jsdx" runat="server" CssClass="form-control" TextMode="multiLine" Rows="2"
                            ValidationGroup="g_tj"></asp:TextBox>

                        <asp:TextBox runat="server" ID="jsdx_real" Style="display: none;" ValidationGroup="g_tj"></asp:TextBox>
                    </div>
                    <i class="col-2 mdi mdi-account-multiple-plus" data-toggle="modal" data-target="#select_user" alt="选择用户" style="font-size: 30px; padding-top: 5%"></i>
                    <%-- <img src="../images_a/app/add.png"
                            data-toggle="modal" data-target="#select_user" alt="选择用户" style="font-size:30px" />--%>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>牵头领导：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="qtld" runat="server" CssClass="form-control" TextMode="multiLine"
                            Rows="2" ToolTip="多个之间请用,号分开"></asp:TextBox>
                        <asp:TextBox runat="server" ID="qtld_real" Style="display: none" ValidationGroup="g_tj"></asp:TextBox>
                    </div>
                    <i class="col-2 mdi mdi-account-multiple-plus" data-toggle="modal" data-target="#select_qtld" alt="选择" style="font-size: 30px; padding-top: 5%"></i>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>责任领导：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="zrld" runat="server" CssClass="form-control" TextMode="multiLine"
                            Rows="2" ToolTip="多个之间请用,号分开"></asp:TextBox>
                        <asp:TextBox runat="server" ID="zrld_real" Style="display: none" ValidationGroup="g_tj"></asp:TextBox>
                    </div>
                    <i class="col-2 mdi mdi-account-multiple-plus" data-toggle="modal" data-target="#select_zrld" alt="选择" style="font-size: 30px; padding-top: 5%"></i>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>责任人：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="zrr" runat="server" CssClass="form-control" TextMode="multiLine"
                            Rows="2" ToolTip="多个之间请用,号分开"></asp:TextBox>
                        <asp:TextBox runat="server" ID="zrr_real" Style="display: none" ValidationGroup="g_tj"> </asp:TextBox>
                    </div>
                    <i class="col-2 mdi mdi-account-multiple-plus" data-toggle="modal" data-target="#select_zrr" alt="选择" style="font-size: 30px; padding-top: 5%"></i>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>牵头部门：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="qtbm" runat="server" CssClass="form-control" TextMode="multiLine"
                            Rows="2" ToolTip="多个之间请用,号分开"></asp:TextBox>
                        <asp:TextBox runat="server" ID="qtbm_real" Style="display: none" ValidationGroup="g_tj"> </asp:TextBox>
                    </div>
                    <i class=" col-2 mdi mdi-account-multiple-plus" data-toggle="modal" data-target="#select_qtbm" alt="选择" style="font-size: 30px; padding-top: 5%"></i>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>责任部门：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="zrbm" runat="server" CssClass="form-control" TextMode="multiLine"
                            Rows="2" ToolTip="多个之间请用,号分开"></asp:TextBox>
                        <asp:TextBox runat="server" ID="zrbm_real" Style="display: none" ValidationGroup="g_tj"></asp:TextBox>
                    </div>
                    <i class="col-2 mdi mdi-account-multiple-plus" data-toggle="modal" data-target="#select_zrbm" alt="选择" style="font-size: 30px; padding-top: 5%"></i>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <font color="red">*</font><span>任务等级：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:DropDownList ID="rwxz" runat="server" Style="width: 100%" CssClass="form-control" ValidationGroup="g_tj"></asp:DropDownList>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <font color="red">*</font><span>紧急程度：</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:DropDownList ID="jjcd" runat="server" Width="100%" CssClass="form-control" ValidationGroup="g_tj">
                            <asp:ListItem Text="高" Value="高"></asp:ListItem>
                            <asp:ListItem Text="中" Value="中" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="低" Value="低"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                    </div>
                    <div class="col-6 text-left">
                        <asp:CheckBox ID="ynxs" runat="server" AutoPostBack="true" OnCheckedChanged="ynxs_click"
                            Text="是否限时待办"></asp:CheckBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <asp:Panel ID="Panelrq" runat="server" ScrollBars="Auto">
                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <font color="red">*</font>开始日期：
                        </div>
                        <div class="col-6 text-left">
                            <%--                <div class="container">
                           <div class="row">
                                <div class='col-sm-6'>
                                    <div class="form-group">
                                        <div class='input-group date'>
                                            <asp:TextBox type='text' class="form-control" ID="txtSdate" runat="server" />
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    $(function () {
                                        $('#txtSdate').datetimepicker({
                                            locale: 'zh-cn', viewMode: 'days', format: 'YYYY/MM/DD'
                                        });
                                    });
                                </script>
                            </div>
                        </div>--%>

                            <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                Width="100%" MaxLength="10" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row con_div">
                        <div class="col-4 text-left">
                        </div>
                        <div class="col-4 text-left">
                            <asp:DropDownList ID="sxs" runat="server" Width="80" CssClass="form-control">
                                <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="06点" Value="06:"></asp:ListItem>
                                <asp:ListItem Text="07点" Value="07:"></asp:ListItem>
                                <asp:ListItem Text="08点" Value="08:"></asp:ListItem>
                                <asp:ListItem Text="09点" Value="09:"></asp:ListItem>
                                <asp:ListItem Text="10点" Value="10:"></asp:ListItem>
                                <asp:ListItem Text="11点" Value="11:"></asp:ListItem>
                                <asp:ListItem Text="12点" Value="12:"></asp:ListItem>
                                <asp:ListItem Text="13点" Value="13:"></asp:ListItem>
                                <asp:ListItem Text="14点" Value="14:"></asp:ListItem>
                                <asp:ListItem Text="15点" Value="15:"></asp:ListItem>
                                <asp:ListItem Text="16点" Value="16:"></asp:ListItem>
                                <asp:ListItem Text="17点" Value="17:"></asp:ListItem>
                                <asp:ListItem Text="18点" Value="18:"></asp:ListItem>
                                <asp:ListItem Text="19点" Value="19:"></asp:ListItem>
                                <asp:ListItem Text="20点" Value="20:"></asp:ListItem>
                                <asp:ListItem Text="21点" Value="21:"></asp:ListItem>
                                <asp:ListItem Text="22点" Value="22:"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-4 text-left">
                            <asp:DropDownList ID="sfz" runat="server" Width="80" CssClass="form-control">
                                <asp:ListItem Text="分钟" Value="" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="00分" Value="00:"></asp:ListItem>
                                <asp:ListItem Text="05分" Value="05:"></asp:ListItem>
                                <asp:ListItem Text="10分" Value="10:"></asp:ListItem>
                                <asp:ListItem Text="15分" Value="15:"></asp:ListItem>
                                <asp:ListItem Text="20分" Value="20:"></asp:ListItem>
                                <asp:ListItem Text="25分" Value="25:"></asp:ListItem>
                                <asp:ListItem Text="30分" Value="30:"></asp:ListItem>
                                <asp:ListItem Text="35分" Value="35:"></asp:ListItem>
                                <asp:ListItem Text="40分" Value="40:"></asp:ListItem>
                                <asp:ListItem Text="45分" Value="45:"></asp:ListItem>
                                <asp:ListItem Text="50分" Value="50:"></asp:ListItem>
                                <asp:ListItem Text="55分" Value="55:"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <font color="red">*</font>截止日期：
                        </div>
                        <div class="col-6 text-left">
                            <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                Width="100%" MaxLength="10" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row con_div">
                        <div class="col-4 text-left">
                        </div>
                        <div class="col-4 text-left">
                            <asp:DropDownList ID="exs" runat="server" Width="80" CssClass="form-control">
                                <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="06点" Value="06:"></asp:ListItem>
                                <asp:ListItem Text="07点" Value="07:"></asp:ListItem>
                                <asp:ListItem Text="08点" Value="08:"></asp:ListItem>
                                <asp:ListItem Text="09点" Value="09:"></asp:ListItem>
                                <asp:ListItem Text="10点" Value="10:"></asp:ListItem>
                                <asp:ListItem Text="11点" Value="11:"></asp:ListItem>
                                <asp:ListItem Text="12点" Value="12:"></asp:ListItem>
                                <asp:ListItem Text="13点" Value="13:"></asp:ListItem>
                                <asp:ListItem Text="14点" Value="14:"></asp:ListItem>
                                <asp:ListItem Text="15点" Value="15:"></asp:ListItem>
                                <asp:ListItem Text="16点" Value="16:"></asp:ListItem>
                                <asp:ListItem Text="17点" Value="17:"></asp:ListItem>
                                <asp:ListItem Text="18点" Value="18:"></asp:ListItem>
                                <asp:ListItem Text="19点" Value="19:"></asp:ListItem>
                                <asp:ListItem Text="20点" Value="20:"></asp:ListItem>
                                <asp:ListItem Text="21点" Value="21:"></asp:ListItem>
                                <asp:ListItem Text="22点" Value="22:"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="col-4 text-left">
                            <asp:DropDownList ID="efz" runat="server" Width="80" CssClass="form-control">
                                <asp:ListItem Text="分钟" Value="" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="00分" Value="00:"></asp:ListItem>
                                <asp:ListItem Text="05分" Value="05:"></asp:ListItem>
                                <asp:ListItem Text="10分" Value="10:"></asp:ListItem>
                                <asp:ListItem Text="15分" Value="15:"></asp:ListItem>
                                <asp:ListItem Text="20分" Value="20:"></asp:ListItem>
                                <asp:ListItem Text="25分" Value="25:"></asp:ListItem>
                                <asp:ListItem Text="30分" Value="30:"></asp:ListItem>
                                <asp:ListItem Text="35分" Value="35:"></asp:ListItem>
                                <asp:ListItem Text="40分" Value="40:"></asp:ListItem>
                                <asp:ListItem Text="45分" Value="45:"></asp:ListItem>
                                <asp:ListItem Text="50分" Value="50:"></asp:ListItem>
                                <asp:ListItem Text="55分" Value="55:"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </asp:Panel>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务内容:</span>
                    </div>
                    <div class="col-6 text-left">
                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="height: 100px; width: 100%" class="form-control"></textarea>
                    </div>
                </div>

                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>附件名:</span>
                    </div>
                    <div class="col-6 text-left">
                        <asp:TextBox ID="fjname" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                    </div>
                    <div class="col-8 text-left">
                        附件：<input id="fj" runat="server" type="file" style="width: 88%" class="form-control" />
                    </div>
                </div>
                <div style="margin-top: 5%;">
                    <div class="row con_div" style="margin-left: 8%;">
                        <div class="col-5 text-left">
                            <div class="btn_color">
                                <asp:Button CssClass="btn btn-info" ID="SaveBtn" runat="server" Text="发布" OnClick="Save_Click"></asp:Button>
                            </div>
                        </div>

                        <div class="col-1 text-left"></div>
                        <div class="col-5 text-left">
                            <div class="btn_color">
                                <asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                    CssClass="btn btn-googleplus" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rwbt"
            ErrorMessage="请输入任务标题" ValidationGroup="g_tj">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jjcd"
            ErrorMessage="请选择紧急程度" ValidationGroup="g_tj">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rwxz"
            ErrorMessage="请选择任务性质" ValidationGroup="g_tj">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="jsdx"
            ErrorMessage="请选择接收人" ValidationGroup="g_tj">&nbsp;
        </asp:RequiredFieldValidator>
        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="zrbm"
            ErrorMessage="请选择责任部门">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="qtld"
            ErrorMessage="请选择牵头领导">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="zrld"
            ErrorMessage="请选择责任领导">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="zrr"
            ErrorMessage="请选择责任人">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="qtbm"
            ErrorMessage="请选择牵头部门">&nbsp;
        </asp:RequiredFieldValidator>--%>
        <script type="text/javascript">
            var ue = UE.getEditor('editor');
        </script>

        <%-- 接收人模态--%>

        <div class="modal fade" id="select_user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel1">选择用户</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="up1">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user" class="cum_index adddb_jsr">
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col-7 text-left">
                                            <asp:TextBox CssClass="form-control" ID="cxtj" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                                data-inline="true" data-mini="true" Width="210px"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" CssClass="col-2 text-center btn btn-info" OnPreRender="Query_Click" Text="搜索" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-1 text-left">
                                        </div>
                                        <div class="col-8 text-left">
                                            <asp:DropDownList ID="bm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                                data-mini="true" data-theme="d" CssClass="form-control" Width="240px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                                        <asp:ListView ID="ListView1" runat="server">
                                            <ItemTemplate>
                                                <li class="list-group-item">
                                                    <div class="info info_chk">
                                                        <input name="chk" id='<%# Eval("ui_id") %>' data-desc='<%# Eval("ui_desc") %>' type="checkbox" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h4 class="listtitle">
                                                            <asp:Label ID="lblui_desc" runat="server" Text='<%# Eval("ui_desc") %>' Font-Size="Small" />
                                                        </h4>
                                                    </div>
                                                    <div style="clear: both;"></div>
                                                    <div class="info">
                                                        <asp:Label ID="lblbm_mc" runat="server" Text='<%# Eval("bm_mc") %>' />
                                                    </div>
                                                    <div class="info">
                                                        <asp:Label ID="lblzwmc" runat="server" Text='<%# Eval("zwmc") %>' />
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="myfy pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="mywc modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_user();">完成</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <%-- 牵头领导--%>
        <div class="modal fade" id="select_qtld" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel2">选择牵头领导</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user1" class="cum_index adddb_jsr">
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col-7 text-left">
                                            <asp:TextBox CssClass="form-control" ID="cxtj1" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                                data-inline="true" data-mini="true" Width="210px"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" CssClass="col-2 text-center btn btn-info" OnPreRender="Query_Click1" Text="搜索" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-1 text-left">
                                        </div>
                                        <div class="col-8 text-left">
                                            <asp:DropDownList ID="bm1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click1"
                                                data-mini="true" data-theme="d" CssClass="form-control" Width="240px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                                        <asp:ListView ID="ListView2" runat="server">
                                            <ItemTemplate>
                                                <li class="list-group-item">
                                                    <div class="info info_chk">
                                                        <input name="chk" id="<%# Eval("ui_id") %>" type="checkbox" data-desc="<%# Eval("ui_desc") %>" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h4 class="listtitle">
                                                            <asp:Label ID="lblui_desc" runat="server" Text='<%# Eval("ui_desc") %>' />
                                                        </h4>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                    <div class="info">
                                                        <asp:Label ID="lblbm_mc" runat="server" Text='<%# Eval("bm_mc") %>' />
                                                    </div>
                                                    <div class="info">
                                                        <asp:Label ID="lblzwmc" runat="server" Text='<%# Eval("zwmc") %>' />
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server" OnPageChanged="AspNetPager2_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="myfy pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="mywc modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_qtld();">完成</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <%--责任领导 --%>

        <div class="modal fade" id="select_zrld" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel3">选择责任领导</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user2" class="cum_index adddb_jsr">
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col-7 text-left">
                                            <asp:TextBox CssClass="form-control" ID="cxtj2" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                                data-inline="true" data-mini="true" Width="210px"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" CssClass="col-2 text-center btn btn-info" OnPreRender="Query_Click2" Text="搜索" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-1 text-left">
                                        </div>
                                        <div class="col-8 text-left">
                                            <asp:DropDownList ID="bm2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click2"
                                                data-mini="true" data-theme="d" CssClass="form-control" Width="240px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                                        <asp:ListView ID="ListView3" runat="server">
                                            <ItemTemplate>
                                                <li class="list-group-item">
                                                    <div class="info info_chk">
                                                        <input name="chk" id="<%# Eval("ui_id") %>" type="checkbox" data-desc="<%# Eval("ui_desc")%>" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h4 class="listtitle">
                                                            <asp:Label ID="lblui_desc" runat="server" Text='<%# Eval("ui_desc") %>' Font-Bold="true" />
                                                        </h4>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                    <div class="info">
                                                        <asp:Label ID="lblbm_mc" runat="server" Text='<%# Eval("bm_mc") %>' />
                                                    </div>
                                                    <div class="info">
                                                        <asp:Label ID="lblzwmc" runat="server" Text='<%# Eval("zwmc") %>' />
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <%-- <webdiyer:AspNetPager ID="AspNetPager3" runat="server" OnPageChanged="AspNetPager3_PageChanged"
                                            ShowCustomInfoSection="Right" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="pagination" ShowBoxThreshold="11"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                                            PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                                        </webdiyer:AspNetPager>--%>
                                        <webdiyer:AspNetPager ID="AspNetPager3" runat="server" OnPageChanged="AspNetPager3_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="myfy pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="mywc modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_zrld();">完成</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <%--选择责任人 --%>
        <div class="modal fade" id="select_zrr" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel4">选择责任人</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user3" class="cum_index adddb_jsr">
                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col-7 text-left">
                                            <asp:TextBox CssClass="form-control" ID="cxtj3" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                                data-inline="true" data-mini="true" Width="210px"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" CssClass="col-2 text-center btn btn-info" OnPreRender="Query_Click3" Text="搜索" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-1 text-left">
                                        </div>
                                        <div class="col-8 text-left">
                                            <asp:DropDownList ID="bm3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click3"
                                                data-mini="true" data-theme="d" CssClass="form-control" Width="240px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                                        <asp:ListView ID="ListView4" runat="server">
                                            <ItemTemplate>
                                                <li class="list-group-item">
                                                    <div class="info info_chk">
                                                        <input name="chk" id="<%# Eval("ui_id") %>" type="checkbox" data-desc="<%# Eval("ui_desc") %>" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h4 class="listtitle">
                                                            <asp:Label ID="lblui_desc" runat="server" Text='<%# Eval("ui_desc") %>' Font-Bold="true" />
                                                        </h4>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                    <div class="info">
                                                        <asp:Label ID="lblbm_mc" runat="server" Text='<%# Eval("bm_mc") %>' />
                                                    </div>
                                                    <div class="info">
                                                        <asp:Label ID="lblzwmc" runat="server" Text='<%# Eval("zwmc") %>' />
                                                    </div>
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <webdiyer:AspNetPager ID="AspNetPager4" runat="server" OnPageChanged="AspNetPager4_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="myfy pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="mywc modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_zrr();">完成</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <%-- 选择牵头部门--%>
        <div class="modal fade" id="select_qtbm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel5">选择牵头部门</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user4" class="cum_index adddb_jsr">

                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col-7 text-left">
                                            <asp:TextBox CssClass="form-control" ID="cxtj4" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                                data-inline="true" data-mini="true" Width="210px"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" CssClass="col-2 text-center btn btn-info" OnPreRender="Query_Click4" Text="搜索" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-1 text-left">
                                        </div>
                                        <div class="col-8 text-left" style="display: none">
                                            <asp:DropDownList ID="bm4" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click4"
                                                data-mini="true" data-theme="d" CssClass="form-control" Width="240px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                                        <asp:ListView ID="ListView5" runat="server">
                                            <ItemTemplate>
                                                <li class="list-group-item">
                                                    <div class="info info_chk">
                                                        <input name="chk" id="<%# Eval("id") %>" type="checkbox"
                                                            data-desc="<%# Eval("name")%>" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h4 class="listtitle">
                                                            <asp:Label ID="lblui_name" runat="server" Text='<%# Eval("name") %>' />
                                                        </h4>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <webdiyer:AspNetPager ID="AspNetPager5" runat="server" OnPageChanged="AspNetPager5_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="myfy pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="10">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="mywc modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_qtbm();">完成</button>
                                </div>
                            </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <%--责任部门--%>
        <div class="modal fade" id="select_zrbm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel6">选择责任部门</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user5" class="cum_index adddb_jsr">

                                    <div class="row">
                                        <div class="col-1"></div>
                                        <div class="col-7 text-left">
                                            <asp:TextBox CssClass="form-control" ID="cxtj5" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                                data-inline="true" data-mini="true" Width="210px"></asp:TextBox>
                                        </div>
                                        <asp:Button runat="server" CssClass="col-2 text-center btn btn-info" OnPreRender="Query_Click5" Text="搜索" />
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-1 text-left">
                                        </div>
                                        <div class="col-8 text-left" style="display: none">
                                            <asp:DropDownList ID="bm5" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click5"
                                                data-mini="true" data-theme="d" CssClass="form-control" Width="240px">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div data-role="content" data-theme="d" class="mycontent_index" style="margin-top: 10px;">
                                        <asp:ListView ID="ListView6" runat="server">
                                            <ItemTemplate>
                                                <li class="list-group-item">
                                                    <div class="info info_chk">
                                                        <input name="chk" id="<%# Eval("bm_id") %>" type="checkbox" data-desc="<%# Eval("bm_mc")%>" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h4 class="listtitle">
                                                            <asp:Label ID="lblui_name" runat="server" Text='<%# Eval("bm_mc") %>' Font-Bold="true" />
                                                        </h4>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                </li>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="list-group">
                                                    <li runat="server" id="itemPlaceholder" />
                                                </ul>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                        <webdiyer:AspNetPager ID="AspNetPager6" runat="server" OnPageChanged="AspNetPager6_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="160px" CssClass="myfy pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="10">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="mywc modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_zrbm();">完成</button>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
