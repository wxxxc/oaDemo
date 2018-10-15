<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqspsm_Show.aspx.cs" Inherits="hkpro.oa.kqgl.Kqspsm_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>考勤审批说明</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" class="form">
                    <tr>
                        <td align="center" style="height: 50">
                            <asp:Label ID="smmc" runat="server" Font-Bold="true" Font-Size="Medium"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="smnr" runat="server" Font-Size="10pt" Font-Names="宋体"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 40" align="center">
                <input type="button" name="BackBtn" value="关闭窗口" class="mybtn" onclick="javascript:window.close()"
                     />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
