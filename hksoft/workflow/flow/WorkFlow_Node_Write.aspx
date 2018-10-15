<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node_Write.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node_Write" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作流管理 - 可写字段</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td class="form-item" width="20%">
                            步骤序号：
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="lblfnNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            步骤名称：
                        </td>
                        <td>
                            <asp:TextBox ID="lblfnName" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            可写字段：
                        </td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" style="width: 180px" valign="top">
                                        <strong>待选字段</strong>
                                    </td>
                                    <td align="center" style="width: 80px" valign="top">
                                    </td>
                                    <td align="center" style="width: 180px" valign="top">
                                        <strong>已选字段</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 113px" valign="top">
                                        <asp:ListBox ID="SourceListBox" runat="server" Height="180px" Width="180px"></asp:ListBox>
                                    </td>
                                    <td align="center" valign="top">
                                        <br />
                                        <br />
                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text=">" Width="60px" />
                                        <br />
                                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text=">>" Width="60px" />
                                        <br />
                                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="<" Width="60px" />
                                        <br />
                                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="<<" Width="60px" />
                                    </td>
                                    <td align="center" valign="top">
                                        <asp:ListBox ID="TargetListBox" runat="server" Height="180px" Width="180px"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="CloseBtn" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value=" 关闭 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="lblNodeNo" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="lblfno" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfnWriteID" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfno" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
