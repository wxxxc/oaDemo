<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xyj_W.aspx.cs" Inherits="hkpro.portal.yjgl.Xyj_W"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <title>�����ⲿ�ʼ�</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 10px">
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                        align="center">
                                        <a href="sjx.aspx?i=2" class="black">�ռ���</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="fajx.aspx" class="black">������</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="feijx.aspx" class="black">�ϼ���</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="cgx.aspx" class="black">�ݸ���</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                        <a href="xyj.aspx" class="mail_top">׫д���ʼ�</a>
                                    </td>
                                    <td align="right">
                                        <asp:DropDownList ID="inout" runat="server" OnSelectedIndexChanged="Change_Click"
                                            AutoPostBack="true">
                                            <asp:ListItem Text="׫д�ڲ��ʼ�" Value="�ڲ�"></asp:ListItem>
                                            <asp:ListItem Text="׫д�ⲿ�ʼ�" Value="�ⲿ" Selected="true"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="SendMail" CssClass="mybtn" Text="�� ��" runat="server" OnClick="Mail_Click"
                                            CausesValidation="true" />
                                    </td>
                                </tr>
                            </table>
                            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>�ռ��ˣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sjr" runat="server" CssClass="mytext" Width="530px" ToolTip="����ռ�������֮������,�ŷֿ�"></asp:TextBox>&nbsp;<img
                                            src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/mailview_sjr.aspx');"
                                            alt="ѡ���ռ���" />
                                        <asp:CheckBox ID="viewcs" runat="server" Text="����" AutoPostBack="true" />
                                    </td>
                                </tr>
                                <asp:PlaceHolder ID="csholder" runat="server">
                                    <tr style="height: 25px">
                                        <td class="form-item">
                                            ��&nbsp;&nbsp;�ͣ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cs" runat="server" CssClass="mytext" Width="530px" ToolTip="�����������֮������,�ŷֿ�"></asp:TextBox>&nbsp;<img
                                                src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/mailview_cs.aspx');"
                                                alt="ѡ������" />
                                            <asp:CheckBox ID="viewms" runat="server" Text="����" AutoPostBack="true" />
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <asp:PlaceHolder ID="msholder" runat="server">
                                    <tr style="height: 25px">
                                        <td class="form-item">
                                            ��&nbsp;&nbsp;�ͣ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ms" runat="server" CssClass="mytext" Width="530px" ToolTip="�����������֮������,�ŷֿ�"></asp:TextBox>&nbsp;<img
                                                src="../../images/choose.gif" onclick="javascript:openAddressList('../../choose/portal/mailview_ms.aspx');"
                                                alt="ѡ��������" />
                                        </td>
                                    </tr>
                                </asp:PlaceHolder>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>��&nbsp;&nbsp;�⣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Subject" runat="server" CssClass="mytext" Width="530px" MaxLength="50"></asp:TextBox>
                                        <asp:DropDownList runat="server" ID="yxj">
                                            <asp:ListItem Text="-����-" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="-��ͨ-" Value="��ͨ" Selected="true"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
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
                                        <asp:FileUpload ID="fujian2" runat="server" Width="600px" CssClass="mytext" /><br />
                                        <asp:FileUpload ID="fujian3" runat="server" Width="600px" CssClass="mytext" /><br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
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
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="�����������ʽ���󣡶������֮������,�ŷָ�"
        ControlToValidate="cs" ValidationExpression="^(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(,|;))*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$">&nbsp;  
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="�����������ʽ���󣡶������֮������,�ŷָ�"
        ControlToValidate="ms" ValidationExpression="^(\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*(,|;))*\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$">&nbsp;  
    </asp:RegularExpressionValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
