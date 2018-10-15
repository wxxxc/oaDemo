<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hyjl_View.aspx.cs" Inherits="hkpro.oa.hygl.Hyjl_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>会议记录</title>
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
                会议纪要记录
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
                                        <asp:TextBox ID="hylx" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        召开地点：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="zkdd" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        召开部门：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zkbm" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        主持人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fzr" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        会议开始时间：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kssj" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        结束时间：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="jssj" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
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
                                        <asp:TextBox ID="cjry" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="cjry_view" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        
                                        <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                                         <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="附件下载" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        实际情况：<br />
                                        (如实际出席人员等<br />
                                        与上述有出入的地方)
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="sjqk" runat="server" TextMode="multiLine" Rows="3" Width="96%" CssClass="mytextarea" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>会议纪要：<br />
                                        (即会议过程的任务<br />
                                        分配、问题方法等)<br />
                                        Shift+回车换行
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="hyjy" runat="server" TextMode="multiLine" Rows="7" Width="96%" CssClass="mytextarea" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px" class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="xxtz" runat="server" RepeatDirection="horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text="站内消息提醒参加人员查阅纪要" Value="xx1"></asp:ListItem>
                                            <asp:ListItem Text="站内消息提醒全部用户查阅纪要" Value="xx2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px" class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="dxtz" runat="server" RepeatDirection="horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text="手机短信提醒参加人员查阅纪要" Value="dx1"></asp:ListItem>
                                            <asp:ListItem Text="手机短信提醒全部用户查阅纪要" Value="dx2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" CausesValidation="True"
                                OnClick="Save_Click"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="CheckBtn" runat="server" Text="记录完成" CausesValidation="True"
                                OnClick="Over_Click" OnClientClick="return confirm('记录完成后的会议档案将不能再修改，您确认继续吗？')">
                            </asp:Button>
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
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="sjqk"
        Display="none" ErrorMessage="实际情况不能超过100个字" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="hyjy"
        ErrorMessage="请输入会议纪要">必输
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
