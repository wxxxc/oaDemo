<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xwzg_view.aspx.cs" Inherits="hkpro.oa.xwgl.xwzg_view1"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>新闻撰稿</title>
    <link href="../../CssJs/Main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
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
                <asp:Label ID="lbltitle" runat="server"></asp:Label>新闻信息
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="xwbt" runat="server" Width="96%" MaxLength="50" CssClass="mytext"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        摘要：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="xwzy" runat="server" Width="96%" CssClass="mytextarea" MaxLength="250"
                                            Rows="3" TextMode="multiLine"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        来源：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="xwly" runat="server" Width="90%" MaxLength="40" CssClass="mytext"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>新闻分类：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xwfl" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 15%">
                                        新闻作者：
                                    </td>
                                    <td style="width: 35%">
                                        <asp:TextBox ID="xwzz" runat="server" Width="90%" MaxLength="10" CssClass="mytext"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        新闻时间：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xwsj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        添加附件：
                                    </td>
                                    <td colspan="3">
                                        <input id="fj" runat="server" type="file" style="width: 96%" class="mytext" />&nbsp;
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
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                            height: 180px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知管理员" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知管理员" Visible="false" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="SendBtn" runat="server" Text="送审" CausesValidation="true"
                                OnClientClick="return confirm('确认要执行送审吗？')" OnClick="Send_Click"></asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--隐藏label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="xwbt"
        ErrorMessage="请输入标题">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="xwfl"
        ErrorMessage="请选择新闻分类">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
