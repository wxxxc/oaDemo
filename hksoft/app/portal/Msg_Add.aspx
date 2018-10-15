<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Msg_Add.aspx.cs" Inherits="hkpro.app.portal.Msg_Add" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/myselfjs.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>

    <script>
      
    </script>
    <style>
        #d_user .input_check {
            width: 15px !important;
            height: 15px !important;
            opacity: 1;
            position: static;
        }

        #d_user li {
            float: left;
            width: 80%;
        }

        .modal-dialog {
            margin-top: 20%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div data-role="page" id="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='Msg.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>写消息</h1>
                    </div>
                </div>
            </div>
            <div style="clear: both;"></div>
            <div class="ma_txtbox">
                <div data-role="content" data-theme="d" style="padding-left: 2%;">
                    <br />
                    <div align="center">
                        <asp:Label ID="lblMsg" runat="server" Font-Size="Medium" ForeColor="Red" />
                    </div>

                    <div data-role="content" data-theme="d" class="mycontent_detail">
                        <div class="row con_div">
                            <div class="col-3 text-right">
                                <span>收件人: </span>
                            </div>
                            <div class="col-8 text-left">
                                <a href="#" data-toggle="modal" data-target="#select_user" data-ajax="false">
                                    <asp:TextBox ID="jsr" TextMode="MultiLine" Height="60" runat="server"
                                        data-inline="true" data-mini="true" CssClass="form-control"></asp:TextBox>
                                    <asp:TextBox runat="server" ID="jsr_real" Style="display: none"> 
                                    </asp:TextBox>
                                </a>
                            </div>
                        </div>
                        <div class="separated_line"></div>
                        <div class="row con_div">
                            <div class="col-3 text-right">
                                <span>消息内容: </span>
                            </div>
                            <div class="col-8 text-left">
                                <asp:TextBox ID="fsnr" runat="server" TextMode="MultiLine" Height="250" placeholder="点击输入文字..." data-clear-btn="true"
                                    data-inline="true" data-mini="true" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="separated_line"></div>
                    </div>

                    <div align="center" class="btn_color">
                        <asp:Button ID="SendBtn" runat="server" Text="发送" data-theme="e" data-mini="true"
                            OnClick="Send_Click" CssClass="btn btn-info" Style="width: 83%;" />
                    </div>
                </div>
            </div>
        </div>
        <%-- 接收人模态--%>
        <div class="modal fade" id="select_user" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel1">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="exampleModalLabel1">选择用户</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                        <ContentTemplate>
                            <div class="modal-body">
                                <div data-role="page" id="d_user" class="cum_index">
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
                                                        <input name="chk" id='<%# Eval("ui_id") %>' type="checkbox" data-desc="<%# Eval("ui_desc") %>" class="input_check" />
                                                    </div>
                                                    <div class="info info_name">
                                                        <h3 class="listtitle">
                                                            <asp:Label ID="lblui_desc" runat="server" Text='<%# Eval("ui_desc") %>' Font-Bold="true" />
                                                        </h3>
                                                    </div>
                                                    <div style="clear: both"></div>
                                                    <div class="info">
                                                        <asp:Label ID="lblbm_mc" runat="server" Text='<%# Eval("bm_mc") %>' ForeColor="Gray"
                                                            Font-Size="Small" />
                                                    </div>
                                                        
                                                    <div class="info">
                                                        <asp:Label ID="lblzwmc" runat="server" Text='<%# Eval("zwmc") %>' ForeColor="Gray"
                                                            Font-Size="Small" />
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
                                            PrevPageText="上页" CustomInfoSectionWidth="200px" CssClass="pagination" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" LayoutType="Ul"
                                            PagingButtonSpacing="0" CurrentPageButtonClass="active"
                                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false" PageSize="5">
                                        </webdiyer:AspNetPager>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="get_select_userj();">完成</button>
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
