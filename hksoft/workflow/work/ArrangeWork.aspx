<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrangeWork.aspx.cs" Inherits="hkpro.workflow.work.ArrangeWork" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作归档</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0"> 
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            &nbsp;请通过点击+/-号展开或折叠，单击"文件夹名称"可执行归档工作。
                        </td>
                        <td align="right">
                            <a id="test" href="ArrangeWork_Add.aspx" target="foldersform" style="display: none;">
                            </a>
                            <input type="button" name="AddBtn" runat="server" id="AddBtn" value=" 增加 " onclick="javascript:document.all.test.click();"
                                class="btn btn-success" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                    <tr>
                        <td valign="top" style="width: 150px">
                            <asp:TreeView ID="ListTreeView" runat="server" ShowLines="True" ForeColor="black">
                            </asp:TreeView>
                        </td>
                        <td valign="top">
                            <iframe border="0" name="foldersform" marginwidth="1" marginheight="1" src="ArrangeWork_List.aspx?id=00"
                                frameborder="0" width="100%" height="400" bordercolor="#EDEDED" scrolling="auto">
                            </iframe>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
