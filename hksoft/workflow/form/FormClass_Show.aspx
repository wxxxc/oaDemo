<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormClass_Show.aspx.cs"
    Inherits="hkpro.workflow.form.FormClass_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>表单分类</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看表单分类
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td align="right" nowrap="nowrap" width="20%" class="form-item">
                            分类名称：
                        </td>
                        <td width="80%">
                            <asp:Label ID="fcName" runat="server" Width="90%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" nowrap="nowrap" class="form-item">
                            备注：
                        </td>
                        <td>
                            <asp:Label ID="fcRemark" runat="server" Width="90%" Height="60"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <input type="button" name="BackBtn" value=" 关闭 " class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
