<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wlhy.aspx.cs" Inherits="hkpro.oa.hygl.Wlhy" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>网络会议</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table style="width: 90%" cellspacing="0" cellpadding="0" border="0">
                    <tr>
                        <td style="height: 30px; width: 500px">
                            <font color="red">提示：请确认您的机器上已安装了Windows的NetMeeting组件！</font><a href="../../Down/oa/NetMeeting3.01.rar"
                                target="_blank" class="blue">点击下载</a>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <object id="nmapp2" classid="CLSID:3E9BAF2D-7A79-11d2-9334-0000F875AE17" viewastext>
                                <param name="MODE" value="Full" />
                            </object>
                        </td>
                        <td valign="top">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
                            您的IP地址：<b><asp:Label ID="ipdz" runat="server"></asp:Label></b>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 20px">
                            您的机器名：<b><asp:Label ID="jqm" runat="server"></asp:Label></b>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px">
                            <input id="UnDockBtn" onclick="nmapp2.UnDock()" type="button" value="显示完整" name="UnDockBtn"
                                class="mybtn" /><br />
                            <input type="text" id="CallToAddress" class="mytext" />
                            <input type="button" value="加入讨论" id="Button1" onclick="nmapp2.CallTo(CallToAddress.value)"
                                class="mybtn" />
                            <input type="button" value="挂断" id="Button2" onclick="nmapp2.LeaveConference()" class="mybtn" />
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>" />
    </form>
</body>
</html>
