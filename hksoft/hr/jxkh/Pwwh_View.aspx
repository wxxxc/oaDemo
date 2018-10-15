<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwwh_View.aspx.cs" Inherits="hkpro.oa.jxkh.Pwwh_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>��ίά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    <asp:Label ID="lbltitle" runat="server"></asp:Label>��ί��Ϣ
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" class="form" width="100%">
                        <tr>
                            <td class="form-item" style="width: 20%">
                                ��ί<font color="red">*</font>��
                            </td>
                            <td style="width: 30%">
                                <asp:TextBox ID="pwxm" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
                                <img id="img1" onclick="chooseuser_s();" src="../../Images/choose.gif" border="0" alt="ѡ����ί"
                                    runat="server" />
                            </td>
                            <td class="form-item" style="width: 20%">
                                ����<font color="red">*</font>��
                            </td>
                            <td style="width: 30%">
                                <asp:DropDownList ID="pwlx" runat="server" Width="90%">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="�ܾ�����ί" Value="�ܾ�����ί"></asp:ListItem>
                                    <asp:ListItem Text="��������ί" Value="��������ί"></asp:ListItem>
                                    <asp:ListItem Text="һ����ί" Value="һ����ί"></asp:ListItem>
                                    <asp:ListItem Text="������Ա��ί" Value="������Ա��ί"></asp:ListItem>
                                    <asp:ListItem Text="��������Ա" Value="��������Ա"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                ��ע��
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" TextMode="multiLine" Rows="3"
                                    Width="96%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height:30" align="center">
                    <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" />
                    <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click"
                        AccessKey="s"></asp:Button>
                    <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                        Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button>
                    <input type="button" name="BackBtn" value="�ر�" class="btn btn-danger" onclick="javascript:window.close()"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="pid" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pwxm"
        ErrorMessage="��ѡ����ί">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="pwlx"
        ErrorMessage="��ѡ����ί����">&nbsp;
    </asp:RequiredFieldValidator>

    <script language="javascript">
        var uIdName;
        function chooseuser_s() {
            var rdm = Math.random();
            var str = "" + document.getElementById('pid').value + "|" + document.getElementById('pwxm').value + "";
            uIdName = window.showModalDialog("../../Choose/portal/ChooseUserS.aspx?tmp=" + rdm + "&rqstr=" + str + "", "window", "dialogWidth:550px;DialogHeight=480px;status:no;scroll=yes;help:no");
            var arr = uIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("pid").value = arr[0];
                document.getElementById("pwxm").value = arr[1];
            }
        }
    </script>

    </form>
</body>
</html>
