<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzzd_View.aspx.cs" Inherits="hkpro.portal.xzgl.Gzzd_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����ƶ�</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
     <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
           
        var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
        })
       
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr id="hkshow1">
            <td class="td_base" style="width: 80%; height: 25px">
                �鿴�����ƶ�
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form"
                                id="hktable">
                                <tr>
                                    <td class="form-item">
                                        ���⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblzdbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ࣺ
                                    </td>
                                    <td>
                                        <asp:Label ID="lblzdfl" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        ����ʣ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblztc" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �ƶȵȼ���
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblzddj" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �ܼ���
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblmj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ĵ�λ��
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfwdw" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        �ĺţ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblwh" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ظ�����
                                    </td>
                                    <td>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="��������" />
                                    </td>
                                    <td class="form-item">
                                        ����ʱ�䣺
                                    </td>
                                    <td>
                                        <asp:Label ID="cjsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="hkshow2">
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="print" class="mybtn" value="�� ӡ" onclick="javascript:PrintPage3()">
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
