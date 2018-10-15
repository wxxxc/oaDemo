<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dept.aspx.cs" Inherits="hkpro.portal.bmgl.Dept" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>部门管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            &nbsp;请通过点击各节点前的"+/-"号展开或折叠，单击"部门名称"可查看详情。
                        </td>
                        <td align="right">
                            <a id="test" href="Dept_Add.aspx" target="DeptFrame" style="display: none;"></a>
                            <input type="button" name="AddBtn" id="AddBtn" runat="server" value="增 加" onclick="javascript:document.all.test.click();"
                                class="btn btn-success" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td valign="top">
                                        <asp:TreeView ID="DeptTreeView" runat="server" ShowLines="True" ForeColor="black">
                                        </asp:TreeView>
                                    </td>
                                    <td valign="top">
                                        <iframe border="0" name="DeptFrame" marginwidth="1" marginheight="1" src="Dept_Show.aspx?id=0"
                                            frameborder="0" width="100%" height="400px" bordercolor="#EDEDED" scrolling="auto">
                                        </iframe>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
