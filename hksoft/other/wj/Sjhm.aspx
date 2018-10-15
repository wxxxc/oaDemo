<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sjhm.aspx.cs" Inherits="hkpro.other.wj.Sjhm" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form method="GET" action="http://www.ip138.com:8080/search.asp" name="mobileform">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center" style="height: 60px">
                            手机号码所在地查询：<input type="text" name="mobile" size="16" class="mytext">
                            <input type="submit" value="查询" class="mybtn"><input type="hidden" name="action"
                                value="mobile">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
