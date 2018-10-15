<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignetAudi_Do.aspx.cs"
    Inherits="hkpro.workflow.seal.SignetAudi_Do" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>印章审批</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" align="right" class="form-item">
                            印章名称：
                        </td>
                        <td style="width: 80%">
                            <asp:Label ID="lblsName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            印章类型：
                        </td>
                        <td>
                            <asp:Label ID="lblsType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            印章状态：
                        </td>
                        <td>
                            <asp:Label ID="lblsStatus" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            使用人员：
                        </td>
                        <td>
                            <asp:Label ID="lblsUser" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            备&nbsp;&nbsp;&nbsp;&nbsp;注：
                        </td>
                        <td>
                            <asp:Label ID="lblsRemark" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            印&nbsp;&nbsp;&nbsp;&nbsp;章：
                        </td>
                        <td>
                            <asp:Image ID="sPicNewName" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center">
                <asp:Button CssClass="btn btn-success" ID="AudiYBtn" runat="server" Text="审批通过" OnClick="AudiY_Click">
                </asp:Button>
                <asp:Button CssClass="btn btn-primary" ID="AudiNBtn" runat="server" Text="审批退回" OnClick="AudiN_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="返 回" class="btn btn-info" onclick="javascript:location.href='SignetAudi.aspx';" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lbluID" Visible="false" runat="server"></asp:Label>
    </form>
</body>
</html>
