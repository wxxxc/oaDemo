<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yjxsz_Add.aspx.cs" Inherits="hkpro.portal.xzgl.Yjxsz_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>���������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ���������
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
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��������ƣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="mc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>����Ա��
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="gly" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <asp:Label ID="lbllx" runat="server" Text="���ͣ�" Visible="false"></asp:Label>
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="lx" runat="server" Width="90%" Visible="false" AutoPostBack="true"
                                            OnSelectedIndexChanged="lx_SelectedIndexChanged">
                                            <asp:ListItem Text="ֻ������ҵ�û�" Value="��ҵ"></asp:ListItem>
                                            <asp:ListItem Text="ֻ����Ӧ��" Value="��Ӧ��"></asp:ListItem>
                                            <asp:ListItem Text="ֻ����VIP��Ա" Value="��Ա"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <asp:Panel ID="p_yhfw" runat="server">
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>�û���Χ��
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="UserName" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="7" Width="90%"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif"
                                                    border="0" />
                                        </td>
                                    </tr>
                                </asp:Panel>
                                <tr>
                                    <td class="form-item">
                                        ��ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="3"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button ID="Button2" Text="�� ��" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                class="mybtn"></asp:Button>
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>

    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mc"
        ErrorMessage="���������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lx"
        ErrorMessage="��ѡ������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gly"
        ErrorMessage="��ѡ�����Ա">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="UserName"
        ErrorMessage="��ѡ���û���Χ">&nbsp;
    </asp:RequiredFieldValidator>

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
