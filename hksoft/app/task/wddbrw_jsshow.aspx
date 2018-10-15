<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wddbrw_jsshow.aspx.cs" Inherits="hksoft.app.task.wddbrw_jsshow" %>

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
            var b = "<%=savefj_lb.NavigateUrl %>";
            var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
                $('#ff').css("display", "none");
            }
            if (b == "../.." || b == "") {
                $('#f').css("display", "none");
            }
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
            <div data-role="content" data-theme="d" class="mycontent_detail" >
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
                </asp:Panel>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>任务内容：</span>
                    </div>
                    <div class="col-8 text-left">
                        <a href="nr.aspx?rwid=<%=rwid_nr%>"
                            class="gvlink">
                            <asp:Label ID="lblnr" Style="color: #15A7E2; text-overflow: ellipsis; overflow: hidden; max-width: 190px; display: block; white-space: nowrap;" runat="server" Text='<%# Bind("rwnr") %>'>  </asp:Label>
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
                        <span>限时待办：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="separated_line"></div>
                <div class="row con_div">
                    <div class="col-4 text-right">
                        <span>限时待办：</span>
                    </div>
                    <div class="col-8 text-left">
                        <asp:Label ID="Label4" runat="server"></asp:Label>
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

                <asp:Panel ID="panelyc" runat="server">
                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <asp:Label ID="lblwcqk" runat="server" Text="完成情况："></asp:Label>
                        </div>
                        <div class="col-8 text-left">
                            <asp:TextBox ID="wcqk" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="2" ReadOnly="true"></asp:TextBox>
                            <asp:Label ID="wcrid" runat="server" Enabled="false" Text="完成人:"></asp:Label><asp:Label
                                ID="wcrmc" Enabled="false" runat="server"></asp:Label>
                            <asp:Label ID="wcsjid" runat="server" Enabled="false" Text="完成时间:"></asp:Label><asp:Label
                                ID="wcsjmc" runat="server" Enabled="false"></asp:Label>
                            <asp:Label ID="wcfjid" runat="server" Enabled="false" Text="完成附件:"></asp:Label>
                            <a href="<%=qy_fjylurl.Text %><%=savefj_lb.NavigateUrl %>" target="_blank" id="f">在线预览</a>
                            <asp:Label ID="Label1" runat="server"><%=savefj.Text %></asp:Label>
                            <asp:HyperLink
                                ID="savefj_lb" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                ToolTip="附件下载" Visible="false" />
                            <asp:Label ID="savelj_lb" Visible="false" runat="server"></asp:Label>&nbsp;
                        </div>
                    </div>
                    <div class="separated_line"></div>
                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <asp:Label ID="lblspyj" runat="server" Text="审批意见："></asp:Label>
                        </div>
                        <div class="col-8 text-left">
                            <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="2" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="separated_line"></div>
                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <asp:Label ID="sprid" runat="server" Enabled="false" Text="审核人:"></asp:Label>
                        </div>
                        <div class="col-8 text-left">
                            <asp:Label ID="sprmc" Enabled="false" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="separated_line"></div>
                    <div class="row con_div">
                        <div class="col-4 text-right">
                            <asp:Label ID="spsjid" runat="server" Enabled="false" Text="审核时间:"></asp:Label>
                        </div>
                        <div class="col-8 text-left">
                            <asp:Label ID="spsjmc" runat="server" Enabled="false"></asp:Label>
                        </div>
                    </div>
                </asp:Panel>
                <%--  <tr style="display:none">
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="fpxs" runat="server" hidden="true" Text="需要分配给他人办理" AutoPostBack="true" OnCheckedChanged="fpxs_Checked" />
                                    </td>
                                </tr>
                               <asp:panel id="fpry" runat="server" visible="false">
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>选择分配人员：
                                        </td>
                                        <td colspan="3">
                                            <asp:textbox id="jsdx" runat="server" cssclass="mytextarea" textmode="multiline"
                                                rows="2" width="93%" tooltip="多个用户之间请用,号分开"></asp:textbox><img src="../../images/choose.gif"
                                                    onclick="javascript:openaddresslist('../../choose/oa/rwview_yh.aspx');" alt="选择用户" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>分配说明：
                                        </td>
                                        <td colspan="3">
                                            <asp:textbox id="fpsm" runat="server" cssclass="mytextarea" textmode="multiline"
                                                rows="2" width="96%"></asp:textbox>
                                        </td>
                                    </tr>
                                </asp:panel>--%>

                <div align="center" style="margin-bottom:5%" class="btn_color">
                    <asp:Button CssClass="btn btn-info" ID="JSBtn" runat="server" Text="确认接收" OnClick="JS_Click" Width="83%"></asp:Button>
                </div>
                <asp:Label ID="rwidstr" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="lblfjmc" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblfjlj" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="lblrwxzid" runat="server" Visible="False"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

