<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Audi.aspx.cs"
    Inherits="hkpro.app.flow.HandleWork_Audi" ValidateRequest="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WebAPP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />
    <link rel="stylesheet" href="../../CssJs_A/global.css" />

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/global.js"></script>

</head>
<body>
    <form id="form1" runat="server" data-ajax="false">
    <div data-role="page" id="indexPage">
        <div data-role="header" data-position="fixed" data-theme="b">
            <a data-role="button" data-inline="true" data-icon="back" data-rel="back">返回</a>
            <h1>
                未办理工作</h1>
        </div>
        <div data-role="content" data-theme="d">
            <ul data-role="listview">
                <li>
                    <h3>
                        <asp:Label ID="lblwTitle" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                    </h3>
                </li>
                <li>
                    <h3>
                        当前步骤：<asp:Label ID="lblstrfnName" runat="server" ForeColor="Gray"></asp:Label>
                    </h3>
                </li>
                <li>
                    <h3>
                        审批模式：<asp:Label ID="lblstrAudiMode" runat="server" ForeColor="Gray"></asp:Label>
                    </h3>
                </li>
                <li>
                    <asp:Label ID="lblhtm" runat="server" data-role="none"></asp:Label>
                </li>
                <li>
                    <h3>
                        相关附件：<asp:Label ID="fujian" runat="server"></asp:Label>
                    </h3>
                </li>
                <li>
                    <h3>
                        审批记录：<asp:Label ID="lblspyj" runat="server"></asp:Label>
                    </h3>
                </li>
                <li>
                    <asp:TextBox ID="txt_appcomm" runat="server" placeholder="请输入本次审批意见" data-clear-btn="true"
                        data-inline="true" data-mini="true" required="required"></asp:TextBox>
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text="特别提醒:手机端不支持修改表单内容!" />
                    <div data-role="controlgroup" data-type="horizontal" align="center">
                        <asp:Button ID="Button1" runat="server" Text="保存" OnClick="Button1_Click" data-inline="true"
                            data-theme="e" data-icon="edit" data-mini="true" />
                        <asp:Button ID="Button4" runat="server" Text="审批通过" OnClick="Button4_Click" data-inline="true"
                            data-theme="e" data-mini="true" />
                        <asp:Button ID="Button9" runat="server" Text="审批驳回" OnClick="Button9_Click" data-inline="true"
                            data-theme="e" data-mini="true" />
                        <input type="button" name="RecBtn" value="返回" onclick="javascript:location.href='HandleWork.aspx'"
                            data-inline="true" data-theme="e" data-icon="back" data-mini="true" />
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblnnnk" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="lblName" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="lblFormName" runat="server" Visible="False"></asp:TextBox>
    <asp:Label ID="lblstrhyUserIDs" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstrhyUserNames" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
