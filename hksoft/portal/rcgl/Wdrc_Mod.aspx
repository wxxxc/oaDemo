<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdrc_Mod.aspx.cs" Inherits="hkpro.portal.rcgl.Wdrc_Mod"
     ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
     <title>������־</title>
    <script src="../../cssjs/MyJs.js"></script>
   <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
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
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �鿴��־
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 80px">
                                        ���⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="rczt" runat="server" Width="96%" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                             <%--   <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>���ࣺ
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="rcfl" runat="server" Width="90%">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="Լ��" Value="Լ��"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="�绰" Value="�绰"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="���" Value="���"></asp:ListItem>
                                            <asp:ListItem Text="�߷�" Value="�߷�"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �ص㣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="rcdd" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ״̬��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zt" runat="server" Width="90%">
                                            <asp:ListItem Text="δ��ʼ" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="������" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="�����" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="���ڵȴ�������" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="���Ƴ�" Value="4"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        ���ȼ���
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="yxj" runat="server" Width="90%">
                                            <asp:ListItem Text="��" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="��ͨ" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="��" Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="form-item" hidden="true">
                                        ��ʼʱ�䣺
                                    </td>
                                    <td colspan="3" hidden="true">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="100" MaxLength="10" Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="ssf" runat="server" Width="60" Enabled="false">
                                                        <asp:ListItem Text="00:00" Value="00:00:00" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00:30" Value="00:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="01:00" Value="01:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="01:30" Value="01:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="02:00" Value="02:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="02:30" Value="02:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="03:00" Value="03:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="03:30" Value="03:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="04:00" Value="04:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="04:30" Value="04:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="05:00" Value="05:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="05:30" Value="05:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="06:00" Value="06:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="06:30" Value="06:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="07:00" Value="07:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="07:30" Value="07:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="08:00" Value="08:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="08:30" Value="08:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="09:00" Value="09:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="09:30" Value="09:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="10:00" Value="10:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="10:30" Value="10:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="11:00" Value="11:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="11:30" Value="11:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="12:00" Value="12:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="12:30" Value="12:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="13:00" Value="13:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="13:30" Value="13:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="14:00" Value="14:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="14:30" Value="14:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="15:00" Value="15:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="15:30" Value="15:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="16:00" Value="16:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="16:30" Value="16:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="17:00" Value="17:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="17:30" Value="17:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="18:00" Value="18:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="18:30" Value="18:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="19:00" Value="19:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="19:30" Value="19:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="20:00" Value="20:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="20:30" Value="20:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="21:00" Value="21:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="21:30" Value="21:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="22:00" Value="22:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="22:30" Value="22:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="23:00" Value="23:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="23:30" Value="23:30:00"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" hidden="true">
                                        ����ʱ�䣺
                                    </td>
                                    <td colspan="3" hidden="true">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="100" MaxLength="10" Enabled="false"></asp:TextBox>
                                                </td>
                                                <td style="width: 520">
                                                    <asp:DropDownList ID="esf" runat="server" Width="60" Enabled="false">
                                                        <asp:ListItem Text="00:00" Value="00:00:00" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00:30" Value="00:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="01:00" Value="01:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="01:30" Value="01:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="02:00" Value="02:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="02:30" Value="02:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="03:00" Value="03:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="03:30" Value="03:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="04:00" Value="04:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="04:30" Value="04:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="05:00" Value="05:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="05:30" Value="05:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="06:00" Value="06:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="06:30" Value="06:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="07:00" Value="07:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="07:30" Value="07:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="08:00" Value="08:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="08:30" Value="08:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="09:00" Value="09:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="09:30" Value="09:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="10:00" Value="10:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="10:30" Value="10:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="11:00" Value="11:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="11:30" Value="11:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="12:00" Value="12:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="12:30" Value="12:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="13:00" Value="13:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="13:30" Value="13:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="14:00" Value="14:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="14:30" Value="14:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="15:00" Value="15:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="15:30" Value="15:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="16:00" Value="16:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="16:30" Value="16:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="17:00" Value="17:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="17:30" Value="17:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="18:00" Value="18:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="18:30" Value="18:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="19:00" Value="19:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="19:30" Value="19:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="20:00" Value="20:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="20:30" Value="20:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="21:00" Value="21:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="21:30" Value="21:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="22:00" Value="22:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="22:30" Value="22:30:00"></asp:ListItem>
                                                        <asp:ListItem Text="23:00" Value="23:00:00"></asp:ListItem>
                                                        <asp:ListItem Text="23:30" Value="23:30:00"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                               <%-- <td>
                                                    <asp:CheckBox ID="qtsj" Text="ȫ���¼�" AutoPostBack="true" OnCheckedChanged="Qtsj_Check"
                                                        runat="server" />
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">��־������
                                    </td>
                                    <td colspan="3">
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%; height: 180px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 80px">
                                        ������
                                    </td>
                                    <td colspan="3">
                                        <input id="fj" runat="server" type="file" class="mytext" style="width: 96%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <%--<asp:Label ID="xgr_label" runat="server" Enabled="false" Text="�����޸�ʱ�䣺"></asp:Label>--%>
                                        <%--<asp:Label ID="cjsj" runat="server" Enabled="false"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="savelj" runat="server" Visible="false"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="��������" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <%--<asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="BjBtn" runat="server" Text="������" OnClick="Bj_Click">
                            </asp:Button>--%>
                            <input type="button" name="BackBtn" value="֪ͨ�쵼" class="mybtn" onclick="javascript:popMini('../../portal/xxgl/minixx.aspx')" />
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
     <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="editor"
        ErrorMessage="��������־����">&nbsp;
    </asp:RequiredFieldValidator>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rcfl"
        ErrorMessage="��ѡ����־����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="��������־��ʼ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="��������־��������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtSdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="���ڿ�ʼ���ڸ�ʽ���󣬸�ʽ�ο�2008-01-01��2008/01/01"
        Type="date" runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtEdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="��־�������ڸ�ʽ���󣬸�ʽ�ο�2008-12-31��2008/12/31"
        Type="date" runat="server">
    </asp:CompareValidator>--%>
    </form>
      <script type="text/javascript">
            var ue = UE.getEditor('editor');
        </script>
</body>
</html>
