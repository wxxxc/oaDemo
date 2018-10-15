<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fbdbrw_detail.aspx.cs" Inherits="hksoft.app.task.fbdbrw_detail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="../cssjs_a/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <link href="../cssjs_a/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../cssjs_a/frame/jquery-1.8.2.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
         <script src="../../res/js/jquery.js"></script>

    <script>
        $(document).ready(function () {
        
            var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a=="") {
                $('#ff').css("display", "none");
            }
        })
        function openAddressList(stringfiled) {
            window.open(stringfiled, "选择用户", 'width=600,height=450,top=' + (screen.height - 450) / 2 + ',left=' + (screen.width - 600) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
        }
    </script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <%-- 导航条--%>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header mynavbar" style="height: 58px;">
                        <a class="navbar-brand" href="#" onclick="javascript:history.back(-1);">
                            <img alt="Brand" src="../images_a/app/3.png" style="width: 25px; height: 30px;margin-left: 10px;" />
                        </a>
                        <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1.1em 34% 0.8em;">查看发布任务</h1>
                    </div>

                </div>
            </nav>

            <table style="overflow: scroll; width: 350px; margin-left: 7px; height: 30px; border-bottom: none; margin-top: -18px;" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                        <tr>
                                            <td class="form-item">任务来源：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="rwly" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">任务标题：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="lblrwbt" runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">接收人：
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
                                            <td class="form-item">牵头部门：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="qtbm" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">责任部门：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="zrbm" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" style="width: 20%">任务性质：
                                            </td>
                                            <td style="width: 30%" colspan="3">
                                                <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" style="width: 20%">紧急程度：
                                            </td>
                                            <td style="width: 30%" colspan="3">
                                                <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">任务内容：
                                            </td>
                                            <td colspan="3">
                                                <a href="nr.aspx?rwid=<%=rwid_nr%>"
                                                    class="gvlink">
                                                    <asp:Label ID="lblnr" Style="color: #15A7E2; text-overflow: ellipsis; overflow: hidden; max-width: 190px; display: block; white-space: nowrap;" runat="server" Text='<%# Bind("rwnr") %>'>  </asp:Label>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">限时待办：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">任务附件：
                                            </td>
                                            <td colspan="3">
                                                <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                                                <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                                       <asp:Label ID="Label2" runat="server"><%=savefj.Text %></asp:Label>
                                                <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                    ToolTip="附件下载" visible="false"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">发布人：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="fbrmc" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">发布时间：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="fqsj" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
        </div>
    </form>
</body>

</html>