<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignetAudiA_Show.aspx.cs"
    Inherits="hkpro.workflow.seal.SignetAudiA_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>ӡ������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                �鿴ӡ��
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" align="right" class="form-item">
                            ӡ�����ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:Label ID="lblsName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            ӡ�����ͣ�
                        </td>
                        <td>
                            <asp:Label ID="lblsType" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            ӡ��״̬��
                        </td>
                        <td>
                            <asp:Label ID="lblsStatus" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            ʹ����Ա��
                        </td>
                        <td>
                            <asp:Label ID="lblsUser" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            ��&nbsp;&nbsp;&nbsp;&nbsp;ע��
                        </td>
                        <td>
                            <asp:Label ID="lblsRemark" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="form-item">
                            ӡ&nbsp;&nbsp;&nbsp;&nbsp;�£�
                        </td>
                        <td>
                            <asp:Image ID="sPicNewName" runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center" colspan="2">
                <input type="button" name="BackBtn" value=" �ر� " class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
