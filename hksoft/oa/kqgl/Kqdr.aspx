<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqdr.aspx.cs" Inherits="hkpro.oa.kqgl.Kqdr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�������ݵ���</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main" onload="remove_load();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="height: 30">
                            &nbsp;<a href="../../Down/oa/Template_KQXX.xls" target="_blank" class="gvlink"><u>������ص���ģ��</u></a>
                            <img alt="����鿴�������" onclick="javascript:popPrn('../../help/oa/kqxx.htm');" src="../../Images/help.gif"
                                border="0">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30">
                            &nbsp;ѡ��Excel�ĵ���<asp:FileUpload ID="FileUpload1" runat="server" Width="220px" CssClass="mytext" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30" colspan="2" align="center">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ȷ�ϵ���" CssClass="mybtn" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
