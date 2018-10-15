<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jsdbrw_yhview.aspx.cs" Inherits="hkpro.oa.rwgl.jsdbrw_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看待办任务</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../res/js/jquery.js"></script>
    
    <script>
         $(document).ready(function () {
             var b ="<%=savefj_lb.NavigateUrl %>";
        var a = "<%=savefj.NavigateUrl %>";
             if (a == "../.." || a == "") {
            $('#ff').css("display","none");
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
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 25px;" class="td_base">
                查看[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]待办任务
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                  <tr>
                                        <td class="form-item">
                                            任务来源：
                                        </td>
                                        <td colspan="3">
                                             <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="form-item">
                                        任务标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        接收人：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lbljsdx" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                 <tr>
                                        <td class="form-item">牵头领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="qtld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">责任领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">责任人：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="form-item" style="width: 15%">
                                        任务等级：
                                    </td>
                                    <td style="width: 35%">
                                        <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        紧急程度：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <asp:Panel ID="Panelrq" runat="server" Visible="false">
                                    <tr>
                                        <td class="form-item">
                                            开始日期：
                                        </td>
                                        <td>
                                            <asp:Label ID="lblksrq" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">
                                            截止日期：
                                        </td>
                                        <td>
                                            <asp:Label ID="lbljzrq" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="form-item">
                                        任务内容：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        限时待办：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        任务附件：
                                    </td>
                                    <td>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                            ToolTip="附件下载" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        发布人：
                                    </td>
                                    <td>
                                        <asp:Label ID="fbrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        发布时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="fqsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <asp:Panel ID="panelyc" runat="server">
                                    <tr>
                                        <td colspan="4">
                                            <hr class="hr1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <asp:Label ID="lblwcqk" runat="server" Text="完成情况："></asp:Label>
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="wcqk" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                                Rows="2" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="wcrid" runat="server" Enabled="false" Text="完成人:"></asp:Label><asp:Label
                                                ID="wcrmc" Enabled="false" runat="server"></asp:Label>
                                            <asp:Label ID="wcsjid" runat="server" Enabled="false" Text="完成时间:"></asp:Label><asp:Label
                                                ID="wcsjmc" runat="server" Enabled="false"></asp:Label>

                                            <asp:Label ID="wcfjid" runat="server" Enabled="false" Text="完成附件:"></asp:Label>
                                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj_lb.NavigateUrl %>" target="_blank" id="f">在线预览</a>
                             <asp:Label ID="Label1" Visible="false" runat="server"></asp:Label><asp:HyperLink
                                                ID="savefj_lb" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="附件下载" />
                                            <asp:Label ID="savelj_lb" Visible="false" runat="server"></asp:Label>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <hr class="hr1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <asp:Label ID="lblspyj" runat="server" Text="审批意见："></asp:Label>
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                                Rows="2" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="sprid" runat="server" Enabled="false" Text="审核人:"></asp:Label><asp:Label
                                                ID="sprmc" Enabled="false" runat="server"></asp:Label>
                                            <asp:Label ID="spsjid" runat="server" Enabled="false" Text="审核时间:"></asp:Label><asp:Label
                                                ID="spsjmc" runat="server" Enabled="false"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr style="display:none">
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="fpxs" runat="server" hidden="true" Text="需要分配给他人办理" AutoPostBack="true" OnCheckedChanged="fpxs_Checked" />
                                    </td>
                                </tr>
                                <asp:Panel ID="fpry" runat="server" Visible="false">
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>选择分配人员：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="jsdx" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="93%" ToolTip="多个用户之间请用,号分开"></asp:TextBox><img src="../../images/choose.gif"
                                                    onclick="javascript:openAddressList('../../choose/oa/rwview_yh.aspx');" alt="选择用户" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>分配说明：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="fpsm" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="2" Width="96%"></asp:TextBox>
                                        </td>
                                    </tr>
                                </asp:Panel>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="btn btn-success" ID="JSBtn" runat="server" Text="确认接收" OnClick="JS_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblfjmc" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblfjlj" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblrwxzid" runat="server" Visible="False"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="jsdx"
        ErrorMessage="请选择被分配的人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fpsm"
        ErrorMessage="请输入分配说明">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
