<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb_Add.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>�ҵļ��±�</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 40px" align="right" colspan="2">
                            <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨԤԼ��Ա" />
                            <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨԤԼ��Ա" />
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" />
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click" />
                            <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="�� ��" OnClick="Clear_Click" />
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                                Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" />
                            <asp:Button CssClass="mybtn" ID="BackBtn" runat="server" Text="�� ��" OnClick="Back_Click"
                                CausesValidation="false" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>���⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="zt" runat="server" Width="96%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        ���ͣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="lx" runat="server" Width="90%">
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
                                        <asp:TextBox CssClass="mytext" ID="dd" runat="server" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��ʼʱ�䣺
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="srq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="sxs" runat="server" Width="60">
                                                        <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="01��" Value="01:"></asp:ListItem>
                                                        <asp:ListItem Text="02��" Value="02:"></asp:ListItem>
                                                        <asp:ListItem Text="03��" Value="03:"></asp:ListItem>
                                                        <asp:ListItem Text="04��" Value="04:"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="06��" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07��" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08��" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09��" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11��" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12��" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13��" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14��" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16��" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17��" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18��" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19��" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21��" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22��" Value="22:"></asp:ListItem>
                                                        <asp:ListItem Text="23��" Value="23:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                        <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00:00"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05:00"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:00"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:00"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:00"></asp:ListItem>
                                                        <asp:ListItem Text="25��" Value="25:00"></asp:ListItem>
                                                        <asp:ListItem Text="30��" Value="30:00"></asp:ListItem>
                                                        <asp:ListItem Text="35��" Value="35:00"></asp:ListItem>
                                                        <asp:ListItem Text="40��" Value="40:00"></asp:ListItem>
                                                        <asp:ListItem Text="45��" Value="45:00"></asp:ListItem>
                                                        <asp:ListItem Text="50��" Value="50:00"></asp:ListItem>
                                                        <asp:ListItem Text="55��" Value="55:00"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>����ʱ�䣺
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="erq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="exs" runat="server" Width="60">
                                                        <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="01��" Value="01:"></asp:ListItem>
                                                        <asp:ListItem Text="02��" Value="02:"></asp:ListItem>
                                                        <asp:ListItem Text="03��" Value="03:"></asp:ListItem>
                                                        <asp:ListItem Text="04��" Value="04:"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="06��" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07��" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08��" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09��" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11��" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12��" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13��" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14��" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16��" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17��" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18��" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19��" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21��" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22��" Value="22:"></asp:ListItem>
                                                        <asp:ListItem Text="23��" Value="23:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="efz" runat="server" Width="60">
                                                        <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00:00"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05:00"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10:00"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15:00"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20:00"></asp:ListItem>
                                                        <asp:ListItem Text="25��" Value="25:00"></asp:ListItem>
                                                        <asp:ListItem Text="30��" Value="30:00"></asp:ListItem>
                                                        <asp:ListItem Text="35��" Value="35:00"></asp:ListItem>
                                                        <asp:ListItem Text="40��" Value="40:00"></asp:ListItem>
                                                        <asp:ListItem Text="45��" Value="45:00"></asp:ListItem>
                                                        <asp:ListItem Text="50��" Value="50:00"></asp:ListItem>
                                                        <asp:ListItem Text="55��" Value="55:00"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="tx" runat="server" Text="���ѣ�" AutoPostBack="true" OnCheckedChanged="tx_CheckedChanged" />��ǰ<asp:TextBox
                                                        ID="txts" runat="server" CssClass="mytext" Width="25" />����ʾ��
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���ݣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:CheckBox ID="srxz" runat="server" Text="˽������" />
                                                </td>
                                                <td style="width: 115">
                                                    �ظ����ڣ�<asp:CheckBox ID="cf" runat="server" Text="�ظ�" AutoPostBack="true" OnCheckedChanged="cf_CheckedChanged" />
                                                </td>
                                                <td style="width: 62">
                                                    <asp:DropDownList ID="cfzq" runat="server" Width="60">
                                                        <asp:ListItem Text="ÿ��" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="ÿ��" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="ÿ��" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="ÿ��" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="����" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="����" Value="5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    ��
                                                    <asp:TextBox ID="jzrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        Width="80" MaxLength="10"></asp:TextBox>
                                                    ����ǰ
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ԤԼ��Ա��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="UserName" runat="server" ReadOnly="true" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="96%"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../images/choose.gif"
                                                border="0" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="jdr_label" runat="server" Enabled="false" Text="�����ˣ�"></asp:Label>
                                        <asp:Label ID="cjr" runat="server" Enabled="false"></asp:Label>&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="xgr_label" runat="server" Enabled="false" Text="�������ڣ�"></asp:Label>
                                        <asp:Label ID="cjrq" runat="server" Enabled="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zt"
        ErrorMessage="�������¼�����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="srq"
        ErrorMessage="�����뿪ʼ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sxs"
        ErrorMessage="��ѡ��ʼʱ�䣨Сʱ��">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sfz"
        ErrorMessage="��ѡ��ʼʱ�䣨���ӣ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="erq"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="exs"
        ErrorMessage="��ѡ�����ʱ�䣨Сʱ��">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="efz"
        ErrorMessage="��ѡ�����ʱ�䣨���ӣ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="srq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="��ʼ���ڸ�ʽ���󣬸�ʽ�ο�2008-01-01��2008/01/01" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="erq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="�������ڸ�ʽ���󣬸�ʽ�ο�2008-12-31��2008/12/31" Type="date"
        runat="server">
    </asp:CompareValidator>
    <script language="javascript">
        var uIdName;
        function chooseuser_m() {
            var num = Math.random();
            var str = "" + document.getElementById('UserID').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", 'newwindow', 'height=520,width=650,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
            else {
                uIdName = window.showModalDialog("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", "newwindow", "dialogWidth:650px;DialogHeight=520px;status:no;scroll=no;help:no");
            }

            var arr = uIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID").value = arr[0];
                document.getElementById("UserName").value = arr[1];
            }
        }

        function setValue(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID").value = arr[0];
                document.getElementById("UserName").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
