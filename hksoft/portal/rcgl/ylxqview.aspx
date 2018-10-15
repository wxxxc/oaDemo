<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ylxqview.aspx.cs" Inherits="hksoft.portal.rcgl.ylxqview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看工作日志</title>
  <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
     <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
           
        var a = "<%=savefj.NavigateUrl %>";
        if (a == "../.." || a=="") {
            $('#ff').css("display","none");
        }
        })
       
    </script>
   
</head>

<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                        <tr>
                                        <td class="form-item" width="200">发布人：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="ui_desc" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="form-item" width="200">发布时间：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="cjsj" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="form-item" width="200">所在部门：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="bm" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="form-item" width="200">职位：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zw" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" width="200">主题：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                  
                                   
                                    <tr>
                                        <td class="form-item" width="200">日志描述：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblnr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" width="200">附件：
                                        </td>
                                        <td>
                                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                            <asp:hyperlink id="savefj" enabled="true" target="_blank" runat="server" cssclass="gvlink"
                                                tooltip="附件下载" />
                                        </td>
                                    </tr>
                                   
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height: 30">
                               <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
