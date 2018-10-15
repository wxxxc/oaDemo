<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowManage.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlowManage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作流管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">     
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr style="height: 38px">
                        <td>
                            &nbsp;请点击各"类别"下的表单来创建、修改或删除工作流。
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td width="200">
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top">
                                        <asp:TreeView ID="FormTreeView" runat="server" ShowLines="True" ForeColor="black">
                                        </asp:TreeView>
                                    </td>
                                    <td valign="top">
                                        <iframe border="0" name="FormFrame" marginwidth="1" marginheight="1" src="WorkFlow.aspx?FormId=0"
                                            frameborder="0" width="100%" height="400px" bordercolor="#EDEDED" scrolling="no">
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
