<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mini_Xyj_W.aspx.cs" Inherits="hkpro.portal.yjgl.Mini_Xyj_W"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>���ʼ�</title>
</head>
<body class="main" onload="self.status='Ϊ��֤SMTP�����������ܣ�ϵͳĿǰ�������������ʼ����Ϊ1000��MAIL��ַ��'">
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �����ⲿ�ʼ�����ʾ��ϵͳ���Զ��޳����ʼ���ַ�Ļ�Ա��¼����
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                    <tr style="height: 25px">
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>�ռ��ˣ�
                        </td>
                        <td>
                            <asp:TextBox ID="sjr" runat="server" CssClass="mytextarea" Width="575px" TextMode="multiLine"
                                Rows="3" ToolTip="����ռ�������֮������,�ŷֿ�"></asp:TextBox><img src="../../images/choose.gif"
                                    onclick="javascript:openAddressList('../../choose/vip/mailview_hy.aspx');" alt="ѡ���ռ���" />
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td class="form-item">
                            <font color="red">*</font>��&nbsp;&nbsp;�⣺
                        </td>
                        <td>
                            <asp:TextBox ID="Subject" runat="server" CssClass="mytext" Width="500px" MaxLength="50"></asp:TextBox>
                            <asp:DropDownList runat="server" ID="yxj">
                                <asp:ListItem Text="-����-" Value="����"></asp:ListItem>
                                <asp:ListItem Text="-��ͨ-" Value="��ͨ" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td class="form-item" valign="top">
                            ��&nbsp;&nbsp;�ݣ�
                        </td>
                        <td>
                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                height: 180px;"></textarea>
                        </td>
                    </tr>
                    <tr style="height: 25px">
                        <td class="form-item">
                            ��&nbsp;&nbsp;����
                        </td>
                        <td>
                            <asp:FileUpload ID="fujian1" runat="server" Width="600px" CssClass="mytext" /><br />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            <asp:DropDownList ID="hkmb" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Select_Click">
                            </asp:DropDownList>
                            <img src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/cydxview.aspx');"
                                alt="ѡ���ö���" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button ID="SendMail" CssClass="mybtn" Text=" ���� " runat="server" OnClick="Mail_Click"
                    CausesValidation="true" />
                <input type="button" name="BackBtn" value=" �ر� " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblQc" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSmtp" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblUser" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblPwd" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblPort" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblSender" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Subject"
        ErrorMessage="�������ʼ�����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sjr"
        ErrorMessage="�������ռ�������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="�ռ��������ʽ���󣡶������֮������,�ŷָ�"
        ControlToValidate="sjr" ValidationExpression="^(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(,|;))*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$">&nbsp;  
    </asp:RegularExpressionValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
