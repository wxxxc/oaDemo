<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sjkbf_Bf.aspx.cs" Inherits="hkpro.portal.xtgl.Sjkbf_Bf" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ݿⱸ��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main" onload="remove_load();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                �������ݿⱸ��
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>����·����
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="dburl" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 30">
                &nbsp;<font color="red">ע������ʱ��ĳ��̺����ݿ��ļ���С�й�ϵ�������ĵȴ���</font>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="ȷ ��" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dburl"
        ErrorMessage="�����뱸��·��">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
