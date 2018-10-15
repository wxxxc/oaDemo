<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzsModule.aspx.cs" Inherits="hkpro.oa.zsgl.wdzsModule" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>我的知识</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 40">
                            &nbsp;请点击"大类"下的小类来创建、修改或删除知识。
                        </td>
                        <td align="right">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td width="180">
                                        &nbsp;<asp:Button ID="BtnA" runat="server" Text="全部" OnClick="BtnA_Click" CssClass="mybtn"
                                            Style="width: 50" />
                                        <asp:Button ID="Btnd" runat="server" Text="有数据" OnClick="Btnd_Click" CssClass="mybtn"
                                            Style="width: 50" />
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
                                        <iframe border="0" name="FormFrame" marginwidth="1" marginheight="1" src="wdzs.aspx?FormId=0"
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
