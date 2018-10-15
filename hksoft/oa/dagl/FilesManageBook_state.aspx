<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageBook_state.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageBook_state" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                当前借阅人
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 10">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" style="height: 70">
                &nbsp;<%=JrUsername %>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()"
                     />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
