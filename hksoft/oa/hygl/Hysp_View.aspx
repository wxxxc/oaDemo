<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hysp_View.aspx.cs" Inherits="hkpro.oa.hygl.Hysp_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>会议审批</title>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
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
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                审批会议申请
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        会议主题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="hyzt" runat="server" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        会议类型：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="hylx" runat="server" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        召开地点：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="zkdd" runat="server" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        召开部门：
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="mytext" ID="zkbm" runat="server" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        主持人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fzr" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        会议开始时间：
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="mytext" ID="kssj" runat="server" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        结束时间：
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="mytext" ID="jssj" runat="server" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        出席范围：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cxfw" runat="server" CssClass="mytext" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        参加人员：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cjry" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        简要说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jysm" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            ReadOnly="true" Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        
                                        <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" id="ff" target="_blank">在线预览</a>
                                         <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="附件下载" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>请输审批意见：
                                    </td>
                                    <td colspan="3" style="width: 400px; height: 30px">
                                        <asp:TextBox ID="spyj" runat="server" TextMode="multiLine" Rows="5" Width="80%" CssClass="mytextarea" />&nbsp;<img
                                            src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx?page=xpsp')"
                                            alt="选择系统提供的审批意见" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" EnableClientScript="false"
                                            ControlToValidate="spyj" ErrorMessage="必输">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知会议发起人" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知会议发起人" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="CheckBtn" runat="server" Text="检测冲突" CausesValidation="false"
                                OnClick="Check_Click"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="SpBtn" runat="server" Text="审批" OnClick="shenpi_Click" />
                            <asp:Button CssClass="mybtn" ID="ThBtn" runat="server" Text="退回" OnClick="TuiHui_Click" />
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--隐藏存放开始时间、结束时间的label-->
    <asp:Label ID="vsdate" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="vedate" runat="server" Visible="false"></asp:Label>
    <!--隐藏label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="ycdd" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    </form>
</body>
</html>
