<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AttShow.aspx.cs" Inherits="hksoft.AttShow" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�鿴����</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" height="25px">�鿴�����б�</td>
            </tr>
            <tr>
                <td valign="top">
                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                        <tr>
                            <td style="width: 25%" class="form-item">�������أ�
                            </td>
                            <td style="width: 75%">
                                <asp:Label ID="fujian" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="height: 30">
                    <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript: window.close()" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
