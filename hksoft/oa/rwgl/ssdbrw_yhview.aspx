<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ssdbrw_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.ssdbrw_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����������</title>
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
                                    <td class="form-item" style="width: 20%">
                                        ����ȼ���
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �����̶ȣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lbljjcd" runat="server"></asp:Label>
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
                                        ��ʱ���죺
                                    </td>
                                    <td>
                                        <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        ���񸽼���
                                    </td>
                                    <td>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                            ToolTip="��������" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����ˣ�
                                    </td>
                                    <td>
                                        <asp:Label ID="fbrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        ����ʱ�䣺
                                    </td>
                                    <td>
                                        <asp:Label ID="fqsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td colspan="4" align="center">
                                        <b>�������</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ������ʽ��
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfpxs" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        ������Ա��
                                    </td>
                                    <td>
                                        <asp:Label ID="lblfpry" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����˵����
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblfpsm" runat="server"></asp:Label>
                                    </td>
                                </tr>--%>
                                <asp:Panel ID="p_wcqk" runat="server" Visible="false">
                                    <tr>
                                        <td colspan="4" align="center">
                                            <b>������</b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>���˵����
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="wcqk" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                                Rows="2"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" rowspan="2">
                                            ��ɸ�����
                                        </td>
                                        <td colspan="3">
                                            <input id="fj" runat="server" type="file" style="width: 96%" class="mytext" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            
                           <%-- <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank">����Ԥ��</a>
                             <asp:Label ID="Label1" Visible="false" runat="server"></asp:Label>
                           --%>                 <asp:HyperLink ID="savefj_yh" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="��������" />
                                            <asp:Label ID="savelj_yh" Visible="false" runat="server"></asp:Label>&nbsp;
                                        </td>
                                    </tr>
                                    <tr style="display:none">
                                        <td class="form-item">
                                            �����:
                                        </td>
                                        <td>
                                            <asp:Label ID="wcrmc" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">
                                            ���ʱ�䣺
                                        </td>
                                        <td>
                                            <asp:Label ID="wcsj" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <asp:Panel ID="p_xx" runat="server">
                                    <tr>
                                        <td class="form-item">
                                        </td>
                                        <td colspan="3" style="height: 30px">
                                            <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="վ����Ϣ֪ͨ���񷢲���" />
                                            <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ���񷢲���" />
                                        </td>
                                    </tr>
                                </asp:Panel>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="btn btn-primary" ID="SSBtn" runat="server" Text="ȷ������" OnClick="SS_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="�ر�" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="fbr" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="wcqk"
        ErrorMessage="����������������">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
