<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Spdb_w_Mod.aspx.cs" Inherits="hkpro.portal.xzgl.Spdb_w_Mod" %>

<%@ Register Assembly="TW.Web.UI" Namespace="TW.Web.UI" TagPrefix="TWControls" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>视频点播</title>
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
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                修改视频信息
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>视频名称：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="spmc" runat="server" CssClass="mytext" Width="96%" MaxLength="25"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" style="width: 20%">
                            来源：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="sply" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>视频类型：
                        </td>
                        <td style="width: 30%">
                            <asp:DropDownList ID="splx" runat="server" CssClass="mytext" Width="90%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            简介：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="spjj" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            节目名称：
                        </td>
                        <td colspan="3">
                            <input id="jmmc" runat="server" type="file" style="width: 96%;" class="mytext" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td colspan="3">
                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
                            <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                ToolTip="附件下载" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="SetBtn" runat="server" Text="设为首页显示" OnClick="Set_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 30px">
                &nbsp;&nbsp;<font color="red">注:同一时间只能有1个视频在网站首页显示！</font>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="spmc"
        ErrorMessage="请输入视频名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="splx"
        ErrorMessage="请选择视频类型">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
