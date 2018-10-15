<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xwcx_view.aspx.cs" Inherits="hkpro.oa.xwgl.xwcx_view1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>新闻查询</title>
    <link href="../../CssJs/Main.css" rel="stylesheet" type="text/css" />
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
<body>
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="4" cellspacing="0">
        <tr>
            <td align="center" height="30">
                <asp:Label ID="lblxwbt" runat="server" Font-Size="Medium" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" height="25">
                分类：<asp:Label ID="lblxwfl" runat="server"></asp:Label>&nbsp;&nbsp; 来源：<asp:Label
                    ID="lblxwly" runat="server"></asp:Label>&nbsp;&nbsp; 作者：<asp:Label ID="lblxwzz" runat="server"></asp:Label>&nbsp;&nbsp;
                时间：<asp:Label ID="lblxwsj" runat="server"></asp:Label>&nbsp;&nbsp;
                <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
                
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="navigate"
                    ToolTip="附件下载" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #f4f4f4">
                <b>摘要：</b><asp:Label ID="lblxwzy" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblnr" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()"
                     />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
