<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hyjl_View.aspx.cs" Inherits="hkpro.oa.hygl.Hyjl_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����¼</title>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
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
                �����Ҫ��¼
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        �������⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="hyzt" runat="server" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �������ͣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="hylx" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �ٿ��ص㣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="zkdd" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �ٿ����ţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zkbm" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �����ˣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fzr" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���鿪ʼʱ�䣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kssj" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        ����ʱ�䣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="jssj" runat="server" CssClass="mytext" ReadOnly="true" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ϯ��Χ��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cxfw" runat="server" CssClass="mytext" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �μ���Ա��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cjry" runat="server" Visible="false" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="cjry_view" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        
                                        <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                                         <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="��������" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ʵ�������<br />
                                        (��ʵ�ʳ�ϯ��Ա��<br />
                                        �������г���ĵط�)
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="sjqk" runat="server" TextMode="multiLine" Rows="3" Width="96%" CssClass="mytextarea" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�����Ҫ��<br />
                                        (��������̵�����<br />
                                        ���䡢���ⷽ����)<br />
                                        Shift+�س�����
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="hyjy" runat="server" TextMode="multiLine" Rows="7" Width="96%" CssClass="mytextarea" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px" class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="xxtz" runat="server" RepeatDirection="horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text="վ����Ϣ���Ѳμ���Ա���ļ�Ҫ" Value="xx1"></asp:ListItem>
                                            <asp:ListItem Text="վ����Ϣ����ȫ���û����ļ�Ҫ" Value="xx2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 20px" class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="dxtz" runat="server" RepeatDirection="horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text="�ֻ��������Ѳμ���Ա���ļ�Ҫ" Value="dx1"></asp:ListItem>
                                            <asp:ListItem Text="�ֻ���������ȫ���û����ļ�Ҫ" Value="dx2"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" CausesValidation="True"
                                OnClick="Save_Click"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="CheckBtn" runat="server" Text="��¼���" CausesValidation="True"
                                OnClick="Over_Click" OnClientClick="return confirm('��¼��ɺ�Ļ��鵵�����������޸ģ���ȷ�ϼ�����')">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--���ش�ſ�ʼʱ�䡢����ʱ���label-->
    <asp:Label ID="vsdate" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="vedate" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="sjqk"
        Display="none" ErrorMessage="ʵ��������ܳ���100����" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="hyjy"
        ErrorMessage="����������Ҫ">����
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
