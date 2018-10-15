<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWork.aspx.cs" Inherits="hkpro.workflow.work.AddWork" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>新建工作</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">     
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 45px; width: 168;">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td align="center" style="width: 84; height: 20; background-image: url(../../images/flow/sheety.jpg)">
                                        工作管理
                                    </td>
                                    <td align="center" style="width: 84; background-image: url(../../images/flow/sheetn.jpg)">
                                        <a href="AddWork_My.aspx" class="black">我的新建</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;请通过点击表单类别展开或折叠，单击"表单名称"可新建工作（这里仅显示已被授权的工作流）。
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                    <tr>
                        <td valign="top" style="width: 200px">
                            <asp:TreeView ID="FormTreeView" runat="server" ShowLines="True" ForeColor="black"
                                ExpandDepth="2">
                            </asp:TreeView>
                        </td>
                        <td valign="top">
                            <iframe border="0" name="foldersform" marginwidth="1" marginheight="1" src="AddWork_Show.aspx?FormId=0"
                                frameborder="0" width="100%" height="400" scrolling="no" bordercolor="#EDEDED">
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
