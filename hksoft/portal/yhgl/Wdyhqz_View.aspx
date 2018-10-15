<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdyhqz_View.aspx.cs" Inherits="hkpro.portal.yhgl.Wdyhqz_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <title>ά���û�Ⱥ��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>�û�Ⱥ��
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item">
                            Ⱥ�����ͣ�
                        </td>
                        <td>
                            <asp:DropDownList ID="qzlx" runat="server" Width="90%" Enabled="false">
                                <asp:ListItem Text="ͨ��Ⱥ��" Value="ͨ��Ⱥ��" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="EAM�ʲ�����ר��Ⱥ��" Value="EAM�ʲ�����ר��Ⱥ��"></asp:ListItem>
                                <asp:ListItem Text="EAM��Ʒ����ר��Ⱥ��" Value="EAM��Ʒ����ר��Ⱥ��"></asp:ListItem>
                                <asp:ListItem Text="OA�����������ר��Ⱥ��" Value="OA�����������ר��Ⱥ��"></asp:ListItem>
                                <asp:ListItem Text="OA����˵������ר��Ⱥ��" Value="OA����˵������ר��Ⱥ��"></asp:ListItem>
                                <asp:ListItem Text="����������ר��Ⱥ��" Value="����������ר��Ⱥ��"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>Ⱥ�����ƣ�
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="qzmc" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>���ڳ�Ա��
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server" CssClass="mytextarea" TextMode="MultiLine"
                                Rows="3" Width="90%"></asp:TextBox>
                            <img onclick="chooseuser_m();" alt="" src="../../images/choose.gif" border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            Ⱥ��˵����
                        </td>
                        <td>
                            <asp:TextBox ID="qzsm" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 30px" align="center" colspan="2">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
                    ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="qzmc"
                    ErrorMessage="������Ⱥ������">&nbsp;
                </asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserName"
                    ErrorMessage="��ѡ�����ڳ�Ա">&nbsp;
                </asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
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
