<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ssdbrw_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.ssdbrw_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>送审待办任务</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
     <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
           
        var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
        })
       
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
                                    <td class="form-item" style="width: 20%">
                                        任务等级：
                                    </td>
                                    <td style="width: 30%">
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
                               <%-- <tr>
                                    <td colspan="4" align="center">
                                        <b>分配情况</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        分配形式：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfpxs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        分配人员：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfpry" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        分配说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblfpsm" runat="server"></asp:Label>
                                    </td>
                                </tr>--%>
                                <asp:Panel ID="p_wcqk" runat="server" Visible="false">
                                    <tr>
                                        <td colspan="4" align="center">
                                            <b>完成情况</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>完成说明：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="wcqk" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                                Rows="2"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" rowspan="2">
                                            完成附件：
                                        </td>
                                        <td colspan="3">
                                            <input id="fj" runat="server" type="file" style="width: 96%" class="mytext" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            
                           <%-- <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank">在线预览</a>
                             <asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                           --%>                 <asp:HyperLink ID="savefj_yh" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="附件下载" />
                                            <asp:Label ID="savelj_yh" Visible="false" runat="server"></asp:Label>&nbsp;
                                        </td>
                                    </tr>
                                    <tr style="display:none">
                                        <td class="form-item">
                                            完成人:
                                        </td>
                                        <td>
                                            <asp:Label ID="wcrmc" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">
                                            完成时间：
                                        </td>
                                        <td>
                                            <asp:Label ID="wcsj" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <asp:Panel ID="p_xx" runat="server">
                                    <tr>
                                        <td class="form-item">
                                        </td>
                                        <td colspan="3" style="height: 30px">
                                            <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知任务发布人" />
                                            <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知任务发布人" />
                                        </td>
                                    </tr>
                                </asp:Panel>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="btn btn-primary" ID="SSBtn" runat="server" Text="确认送审" OnClick="SS_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="fbr" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="wcqk"
        ErrorMessage="请输入任务完成情况">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
