<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign_Show.aspx.cs"
    Inherits="hkpro.workflow.form.FormDesign_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>表单设计</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看表单
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%"
                    class="form">
                    <tr>
                        <td align="center" colspan="2">
                            <b>基本信息</b>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="form-item">
                            表单类别：
                        </td>
                        <td width="80%">
                            <asp:Label ID="FormType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            表单名称：
                        </td>
                        <td>
                            <asp:Label ID="fName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            用户范围：
                        </td>
                        <td>
                            <asp:Label ID="UserName" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%"
                    class="form">
                    <tr>
                        <td align="center">
                            <b>表单内容</b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="fContent" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="30px" colspan="2">
                <input id="CloseBtn" class="btn btn-danger" type="button" value=" 关闭 " onclick="window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
