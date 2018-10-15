<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contacts_Show.aspx.cs" Inherits="hkpro.app.portal.Contacts_Show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="../cssjs_a/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <link href="../cssjs_a/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../cssjs_a/frame/jquery-1.8.2.min.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <style>
        .ui-body-c, .ui-overlay-c {
            background-image: linear-gradient( #ffffff /*{c-body-background-start}*/, #fafafa /*{c-body-background-end}*/ );
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage" style="background-color: #FFFFFF">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" style="border-bottom-color: white; background: #5295EE;">
                    <a href="Contacts.aspx" class="ui-btn-up-a  ui-btn  " data-role="button" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../../images_a/app/3.png" style="width: 25px; height: 30px" alt="返回" />
                    </a>
                    <h1 style="font-weight: 200; color: white; font-size: 22px; text-shadow: none;">详细信息</h1>
                </div>
            </div>
            <div data-role="content" data-theme="d">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id">
                    <ItemTemplate>
                        <li>
                            <div class="contentHead">
                                <img id="headpic" src="../../images_A/<%# Eval("ui_pic") %>.gif" onerror="errpic(this)" class="head" />
                                <h3 class="listtitle">&nbsp;<asp:Label ID="lblxm" runat="server" Text='<%# Eval("name") %>' Font-Bold="true" /></h3>
                                &nbsp;<asp:Label ID="lblzw" runat="server" Text='<%# Eval("post") %>' ForeColor="Gray" Font-Size="Small" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                所属类别：<asp:Label ID="lblFoldersName" runat="server" Text='<%# Eval("FoldersName") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                工号：<asp:Label ID="lblWorknum" runat="server" Text='<%# Eval("Worknum") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                部门：<asp:Label ID="lblbm" runat="server" Text='<%# Eval("Unit") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                角色：<asp:Label ID="lbljs" runat="server" Text='<%# Eval("Respon") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                电话：<asp:Label ID="lblbgdh" runat="server" Text='<%# Eval("Officetel") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                传真：<asp:Label ID="lblczhm" runat="server" Text='<%# Eval("Fax") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                手机：<asp:Label ID="lblyddh" runat="server" Text='<%# Eval("MoveTel") %>' ForeColor="Gray" />
                            </div>
                        </li>
                        <li>
                            <div class="contentSyle">
                                邮件：<asp:Label ID="lblmail" runat="server" Text='<%# Eval("Email") %>' ForeColor="Gray" />
                            </div>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="contentList" runat="server" data-role="listview" class="detailsContent">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
            </div>

            <%--                        <div id="footer" class="nav-style" data-role="footer" data-theme="b" data-position="fixed" style="min-height: 40px; border-color: #DEDEDE; background-image: url(../../images_a/BB.gif)">
                 <div data-role="navbar" data-grid="c" class="nav-style" style="min-height: 40px; border-color: #EFEFEF; background-image: url(../../images_a/BB.gif)">
                    <ul style="min-height: 40px; border-color: #EFEFEF; background-image: url(../../images_a/BB.gif)">
                        <li>
                            <a href="../../Main_A.aspx" id="home" data-icon="custom" data-ajax="false" style="min-height: 40px; border-color: #EFEFEF; background-image: url(../../images_a/BB.gif)">&nbsp;</a>
                        </li>
                        <li>
                            <a href="Msg.aspx" id="msg" data-icon="custom" data-ajax="false" style="min-height: 40px; border-color: #EFEFEF; background-image: url(../../images_a/BB.gif)">&nbsp;</a>
                        </li>
                        <li>
                            <a href="Notice.aspx" id="notice" data-icon="custom" data-ajax="false" style="min-height: 40px; border-color: #EFEFEF; background-image: url(../../images_a/BB.gif)">&nbsp;</a>
                        </li>
                        <li>
                            <a href="set.aspx" id="work" data-icon="custom" data-ajax="false" style="min-height: 40px; border-color: #EFEFEF; background-image: url(../../images_a/BB.gif)">&nbsp;</a>
                        </li>
                    </ul>
                </div>
            </div>--%>

            <div class="btn_dh_coloc">
                <div id="footer" class="nav-style" data-role="footer" data-theme="b" data-position="fixed">
                    <div data-role="navbar" data-grid="c" class="nav-style">
                        <ul>
                            <li><a href="../../Main_A.aspx" id="home" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="Msg.aspx" id="msg" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="Notice.aspx" id="notice" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="Set.aspx" id="work" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
