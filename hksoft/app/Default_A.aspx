<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default_A.aspx.cs" Inherits="hkpro.Index_OA_A" %>

<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Security-Policy" content="default-src 'unsafe-inline' 'unsafe-eval' 'self'" />
    <link rel="stylesheet" href="CssJS_A/frame/jquery.mobile-1.3.2.css" />
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link rel="stylesheet" href="CssJS_A/global.css" />
    <link rel="stylesheet" href="CssJS_A/my.css" />
    <link href="cssjs_a/myapp.css" rel="stylesheet" />
    <script type="text/javascript" charset="utf-8" src="CssJS_A/frame/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="CssJS_A/frame/jquery.mobile-1.3.0.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="CssJS_A/global.js"></script>
   
</head>
<body>
    <form id="form1" runat="server" data-ajax="false">
        <div data-role="page" id="loginPage" style="background: #fff;">
            <%-- <div data-role="header" data-theme="c" style="background: #1E88E5; height: 58px; border-bottom-color: white;top: -1px;">
                <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: .6em 0 .8em; padding-top: 5px;">温泉重点工作综合管理平台</h1>
            </div>--%>
            <div data-role="content" data-theme="d">
                <div align="center" class="myimg" style="margin-top: 30px; margin-bottom: 30px;">
                    <asp:Label ID="Msg" runat="server" Font-Size="Medium" ForeColor="Red" />
                    <img id="headpic" src="images_a/head.png" onerror="errpic(this)" />
                </div>
                <div data-role="fieldcontain" style="border-width: 0;">
                    <asp:Label ID="lblCs" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                    <div data-role="fieldcontain" style="border-width: 0;">
                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="false"></asp:Label>
                        <div class="login_tr" style="border-bottom:none">
                            <div>
                                <div class="login_fl">
                                    <asp:Label runat="server"  AssociatedControlID="UserName" Style="line-height: 40px; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="login_fl"></div>
                                <div>
                                   <%--<input placeholder="请输入您的用户名" required="required" id="UserName"  class="form-control"/>--%>
                                    <asp:TextBox ID="UserName" runat="server" placeholder="请输入您的用户名" required="required" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                       
                        <div class="login_tr" style="border: 0px;height:37px;">
                            <div style="margin-top: 20px;">
                                <div class="login_fl">
                                    <asp:Label runat="server"  AssociatedControlID="UserPass" Style="letter-spacing: 1em; margin-right: -1em; line-height: 40px; font-weight: bold;"></asp:Label>
                                </div>
                                <div class="login_fl"></div>
                                <div >
                                    <asp:TextBox ID="UserPass" runat="server" placeholder="请输入密码" required="required" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="remember">
                            <asp:CheckBox runat="server" ID="chk_remember" Text="记住密码" Checked="true" />
                        </div>
                    </div>

                </div>
                <div style="clear: both;"></div>
                <div class="login_btn" style="margin-top: 15px;">
                    <asp:Button ID="LoginBtn" runat="server" Text="登 录" data-theme="e" OnClick="Login_Click" />
                </div>
                <%--<div style="position: fixed; bottom: 0; margin-bottom: 15px;text-align:center;">
                    友情提示：请使用UC/360/Chrome/Safari/火狐或安卓自带手机浏览器使用本系统。
                </div>--%>
            </div>
        </div>
    </form>
</body>
</html>
