<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xwsp_view.aspx.cs" Inherits="hkpro.oa.xwgl.xwsp_view1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>新闻审批</title>
    <link href="../../CssJs/Main.css" rel="stylesheet" type="text/css" />
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
            <td class="td_base" style="width: 80%; height: 25px">
                查看新闻内容
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 15%">
                                        标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="xwbt" runat="server" Style="width: 553px;" MaxLength="80" ReadOnly="true"
                                            CssClass="mytext"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        摘要：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="xwzy" runat="server" Width="450px" Style="width: 553;" CssClass="mytextarea"
                                            MaxLength="250" Rows="3" TextMode="multiLine" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        来源：
                                    </td>
                                    <td style="width: 169px">
                                        <asp:TextBox ID="xwly" runat="server" Style="width: 160px;" MaxLength="40" ReadOnly="true"
                                            CssClass="mytext"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        新闻分类：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xwfl" runat="server" Style="width: 165px;" MaxLength="10" ReadOnly="true"
                                            CssClass="mytext"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        新闻作者：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xwzz" runat="server" Style="width: 160px;" MaxLength="10" ReadOnly="true"
                                            CssClass="mytext"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        新闻时间：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xwsj" runat="server" CssClass="mytext" Width="165" MaxLength="10"
                                            ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label><asp:HyperLink
                                            ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue" ToolTip="附件下载" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        新闻内容：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>审批意见：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="spyj" runat="server" TextMode="multiLine" Rows="3" Width="200px"
                                            CssClass="mytextarea" />&nbsp;<img src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx?page=xpsp')"
                                                alt="选择系统提供的审批意见" />
                                    </td>
                                    <td colspan="2">
                                        <br />
                                        <br />
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知申请人" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知申请人" /><br />
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="PassBtn" runat="server" Text="发布新闻" OnClick="Pass_Click" />
                            <asp:Button CssClass="mybtn" ID="StopBtn" runat="server" Text="停用新闻" OnClick="Stop_Click" />
                            <asp:Button CssClass="mybtn" ID="BackBtn" runat="server" Text="退回新闻" OnClick="Back_Click" />
                            <input type="button" name="CloseBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--隐藏label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="spyj"
        ErrorMessage="请输入审批意见">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
