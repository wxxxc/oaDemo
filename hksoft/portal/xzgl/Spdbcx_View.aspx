<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Spdbcx_View.aspx.cs" Inherits="hkpro.portal.xzgl.Spdbcx_View" %>

<%@ Register Assembly="TW.Web.UI" Namespace="TW.Web.UI" TagPrefix="TWControls" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
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
                查看视频信息
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 80" class="form-item">
                            视频名称：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="spmc" runat="server" CssClass="mytext" Width="450" MaxLength="25"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            来源：
                        </td>
                        <td>
                            <asp:TextBox ID="sply" runat="server" CssClass="mytext" Width="150" MaxLength="15"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 80">
                            视频类型：
                        </td>
                        <td>
                            <asp:TextBox ID="splx" runat="server" CssClass="mytext" Width="150" MaxLength="15"
                                ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            简介：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="spjj" runat="server" CssClass="mytextarea" Width="450" TextMode="multiLine"
                                Rows="3" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td colspan="3">
                            <TWControls:Media ID="savefj" runat="server" AutoStart="true" MediaPlayer="FlashPlayer"
                                MediaWidth="400" MediaHeight="300" Enabled="true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            附件下载：
                        </td>
                        <td colspan="3">
                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj1.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label><asp:HyperLink
                                ID="savefj1" Enabled="true" Target="_blank" runat="server" CssClass="blue" ToolTip="附件下载" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
