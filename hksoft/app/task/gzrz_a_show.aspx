<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gzrz_a_show.aspx.cs" Inherits="hksoft.app.task.gzrz_a_show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../CssJs_A/frame/jquery.mobile-1.3.2.css" />

    <link href="../cssjs_a/myapp.css" rel="stylesheet" />
    <link rel="stylesheet" href="../CssJs_A/global.css" />
    <link href="../cssjs_a/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="../CssJs_A/frame/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/bootstrap/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function () {
            var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
                $('#ff').css("display", "none");
            }
        })
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <%-- 导航条--%>
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="d" style="border-bottom-color: white; background: #5295EE; height: 58px">
                    <a onclick="window.location='gzrz_a.aspx'" class="ui-btn-up-a  ui-btn" data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1em 30% 0.8em;">查看日志</h1>
                </div>
            </div>

            <table style="overflow: scroll; width: 350px; margin-left: 7px; height: 30px; border-bottom: none; margin-top: 11px;" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                        <tr>
                                            <td class="form-item">日志主题：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="rzzt" runat="server" Style="text-overflow: ellipsis; overflow: hidden; max-width: 190px; display: block; white-space: nowrap;"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">创建时间：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="cjsj" runat="server" ></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">日志描述：
                                            </td>
                                            <td colspan="3">
                                                <asp:Label ID="rzms" runat="server" Width="250px"></asp:Label>
                                            </td>
                                        </tr>                                                                            
                                        <tr>
                                            <td class="form-item">日志附件：
                                            </td>
                                            <td colspan="3">
                                                <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                                                <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                                       <asp:Label ID="Label2" runat="server"><%=savefj.Text %></asp:Label>
                                                <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                    ToolTip="附件下载" visible="false"/>
                                            </td>
                                        </tr>                                                                                   
                                    </table>
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
