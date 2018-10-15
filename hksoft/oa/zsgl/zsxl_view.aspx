<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zsxl_view.aspx.cs" Inherits="hkpro.oa.zsgl.zsxl_view" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>֪ʶС��ά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>֪ʶС��
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 35%" class="form-item">
                            <font color="red">*</font>�������ࣺ
                        </td>
                        <td style="width: 65%">
                            <asp:DropDownList ID="BigName" runat="server" CssClass="mytext" Width="300">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%" class="form-item">
                            <font color="red">*</font>С�����ƣ�
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="Name" runat="server" CssClass="mytext" Width="300" MaxLength="30"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 35%" class="form-item">
                            ����ʹ����Ա��
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox ID="UserName" runat="server" Rows="8" TextMode="MultiLine" Width="300"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">&nbsp;<asp:Button
                                ID="allyh" runat="server" Text="ȫ���û�" CssClass="mybtn" OnClick="allyh_Click"
                                CausesValidation="False" Style="width: 70" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BigName"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
        ErrorMessage="������С������">&nbsp;
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
