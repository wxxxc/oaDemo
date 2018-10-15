<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzzd_View.aspx.cs" Inherits="hkpro.portal.xzgl.Gzzd_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>规章制度</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
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
        <tr id="hkshow1">
            <td class="td_base" style="width: 80%; height: 25px">
                查看规章制度
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
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form"
                                id="hktable">
                                <tr>
                                    <td class="form-item">
                                        标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblzdbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        分类：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblzdfl" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        主题词：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblztc" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        制度等级：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblzddj" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        密级：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblmj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        发文单位：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfwdw" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        文号：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblwh" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        相关附件：
                                    </td>
                                    <td>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="附件下载" />
                                    </td>
                                    <td class="form-item">
                                        创建时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="cjsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="hkshow2">
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="print" class="mybtn" value="打 印" onclick="javascript:PrintPage3()">
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
