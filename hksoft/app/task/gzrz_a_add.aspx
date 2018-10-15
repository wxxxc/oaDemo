<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gzrz_a_add.aspx.cs" Inherits="hksoft.app.task.gzrz_a_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <%-- 导航条--%>
            <nav class="navbar navbar-default" style="height: 58px">
                <div class="container-fluid">
                    <div class="navbar-header mynavbar" style="height: 58px">
                        <a class="navbar-brand" onclick="window.location='gzrz_a.aspx'">
                            <img alt="Brand" src="../images_a/app/3.png" style="width: 25px; height: 30px" />
                        </a>
                        <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1.1em 39% 0.8em;">新建日志</h1>
                    </div>
                </div>
            </nav>

            <table style="overflow: scroll; width: 350px; margin-left: 7px; height: 30px; border-bottom: none; margin-top: 11px;" width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                        <tr>
                                            <td class="form-item" style="width:80px">日志主题：
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="rzzt" runat="server" CssClass="mytextarea" Width="95%" TextMode="multiLine"
                                                    Rows="1"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" style="width:80px">日志描述：
                                            </td>
                                            <td colspan="3" >
                                                <asp:TextBox ID="rzms" runat="server" CssClass="mytextarea" Width="95%" TextMode="multiLine"
                                                    Rows="18"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" style="width:80px">添加附件：
                                            </td>
                                            <td colspan="3">
                                                <input id="fj" runat="server" type="file" class="mytext" style="width: 95%;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" align="center" style="height: 70px; border-bottom: none">
                                                <asp:Button CssClass="btn btn-w-m btn-primary" ID="SSBtn" runat="server" Text="确认提交" OnClick="Save_Click"></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>

        </div>
    </form>
</body>
</html>
