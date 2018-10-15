<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Finished_Show.aspx.cs"
    Inherits="hkpro.app.flow.HandleWork_Finished_Show" ValidateRequest="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WebAPP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />
    <link rel="stylesheet" href="../../CssJs_A/frame/Mycss.css" />
    <link rel="stylesheet" href="../../CssJs_A/global.css" />

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/global.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="d" style="border-bottom-color: white; background: #5295EE;">
                    <a href="HandleWork_Finished.aspx" class="ui-btn-up-a  ui-btn" data-inline="true" style="border: none; background: #5295EE;" data-iconpos="left">
                        <img src="../../images_a/app/3.png" style="width: 25px; height: 30px" />
                    </a>
                    <h1 style="font-weight: 200; color: white; font-size: 22px; text-shadow: none;">已办理工作</h1>
                </div>
            </div>
            <div data-role="content" data-theme="d">
                <ul data-role="listview">
                    <li>
                        <h3>
                            <asp:Label ID="lblwTitle" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                        </h3>
                    </li>
                    <li>
                        <h4 style="font-size: 14px;">当前步骤：<%=strfnName %>
                        </h4>
                    </li>
                    <li>
                        <h4 style="font-size: 14px;">流水号：<%=strwSerialNo %>-<%=Name%>
                        </h4>
                    </li>
                    <li>
                        <h4 style="font-size: 14px;">审批状态：<asp:Label ID="lblwStatus" runat="server" ForeColor="Gray"></asp:Label>
                        </h4>
                    </li>

                    <li>
                        <asp:Label ID="lblhtm" runat="server" data-role="none"></asp:Label>
                    </li>
                    <%--                <li>
                        <h3>相关附件：<asp:Label ID="fujian" runat="server"></asp:Label>
                        </h3>
                    </li>--%>
                    <%--                    <li>
                        <div data-role="controlgroup" data-type="horizontal" align="center">
                            <input type="button" name="RecBtn" value="返回" onclick="javascript: location.href = 'HandleWork_Finished.aspx'"
                                data-inline="true" data-theme="e" data-mini="true" />
                        </div>
                    </li>--%>
                </ul>
            </div>
            <div style="clear: both;"></div>
            <div class="detailsContent" style="position: absolute; bottom: 130px; left: 13px; font-size: 18px">
                <div class="contentHead">
                    <p style="color: #000000; font-weight: 200; text-shadow: 0">
                        <img src="../../images_a/lj.png" style="width: 22px; height: 24px; margin-top: 1px" />
                        相关附件：
                    </p>
                    <div style="position: absolute; left: 3px; background-color: #F7F7F7; width: 380px; height: 71px; color: #808080">
                        <asp:Label ID="fujian" runat="server" Style="color: #000000; font-weight: 100; text-shadow: 0"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="btn_dh_coloc">
                <div id="footer" class="nav-style" data-role="footer" data-theme="b" data-position="fixed">
                    <div data-role="navbar" data-grid="c" class="nav-style">
                        <ul class="btn_coloc">
                            <li><a href="../../Main_A.aspx" id="home" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="../portal/Msg.aspx" id="msg" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="../portal/Notice.aspx" id="notice" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                            <li><a href="../portal/Set.aspx" id="work" data-icon="custom" data-ajax="false">&nbsp;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
