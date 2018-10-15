<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDoc_Show.aspx.cs"
    Inherits="hkpro.workflow.docu.AdminDoc_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
    function AttDown() {
        var num = Math.random();
        window.open("AdminDoc_Down.aspx?tmp=" + num + "&number=<%=adnewname%>", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
    }

</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>查看红头文件</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                查看红头文件
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            文件名称：
                        </td>
                        <td width="80%">
                            <asp:Label ID="Name" runat="server"></asp:Label>
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
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="40">
                <input id="DownBtn" type="button" value=" 下载 " class="btn btn-success" onclick="AttDown()" />
                <input type="button" name="CloseBtn" value=" 关闭 " class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
