<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qxdbrw_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.qxdbrw_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�鿴��������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
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
        <tr>
            <td style="height: 25px;" class="td_base">
                �鿴[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]��������
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                   <tr>
                                        <td class="form-item">
                                            ������Դ��
                                        </td>
                                        <td colspan="3">
                                              <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label> 

                                        </td>
                                    </tr>
                                <tr>
                                    <td class="form-item">
                                        ������⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����ˣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lbljsdx" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                  <tr>
                                        <td class="form-item">ǣͷ�쵼��
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="qtld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�����쵼��
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�����ˣ�
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                <tr>
                                    <td class="form-item" style="width: 15%">
                                        ����ȼ���
                                    </td>
                                    <td style="width: 35%">
                                        <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �����̶ȣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ʱ���죺
                                    </td>
                                    <td>
                                        <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <asp:Panel ID="Panelrq" runat="server" Visible="false">
                                    <tr>
                                        <td class="form-item">
                                            ��ʼ���ڣ�
                                        </td>
                                        <td>
                                            <asp:Label ID="lblksrq" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">
                                            ��ֹ���ڣ�
                                        </td>
                                        <td>
                                            <asp:Label ID="lbljzrq" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="form-item">
                                        �������ݣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���񸽼���
                                    </td>
                                    <td>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                            ToolTip="��������" />
                                    </td>
                                    <td class="form-item">
                                        ����ʱ�䣺
                                    </td>
                                    <td>
                                        <asp:Label ID="fqsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
