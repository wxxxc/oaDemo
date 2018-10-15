<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qygg_Add.aspx.cs" Inherits="hkpro.portal.xzgl.Qygg_Add"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script language="javascript" type="text/javascript">
        function PageCheck() {
            var strUploadFile = document.getElementById('uploadFile').value;
            if (strUploadFile == "") {
                alert("��ѡ��Ҫ�ϴ��ĸ�����");
                return false;
            }

            var nlength = strUploadFile.length;
            var extName = strUploadFile.substr(nlength - 4, 4).toLowerCase();

            var sAllowExt = "<%=attKey%>";
            var str = document.getElementById('uploadFile').value;
            var extName = str.substr(str.lastIndexOf('.') + 1, str.length - str.lastIndexOf('.')).toLowerCase();

            if (sAllowExt.indexOf(extName) == -1) {
                alert('�Բ�����ֻ���ϴ���' + sAllowExt + '����ʽ���ļ�\r�����Ҫ�ϴ�������ʽ���ļ�������ϵϵͳ����Ա��');
                return false;
            }
            var content = document.frames("EDIT_HTML").document.forms("Members").elements("Search").value;
            document.getElementById("ContractContentupdate").value = content;
        }
    </script>
    <script type="text/javascript">
        function AttDown() {
            if (document.getElementById('fjlb').value == '') {
                alert('����ѡ�и��������أ�');
                return false;
            }
            else {
                var num = Math.random();
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cText = littleproduct.options[cindex].text;
                var cValue = littleproduct.options[cindex].value;
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=portal/gg", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
            }
        }

        function AttDel() {
            if (document.getElementById('fjlb').value == '') {
                alert('����ѡ�и�����ɾ��');
                return false;
            }
            else {
                if (!confirm("��ȷ��Ҫɾ���˸�����"))
                    return false;

                var num = Math.random();
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cText = littleproduct.options[cindex].text;
                var cValue = littleproduct.options[cindex].value;
                window.open("../../AttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ��������
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
                                        <font color="red">*</font>������ࣺ
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="ggfl" runat="server" Width="76%">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="lx" runat="server" Visible="false">
                                            <asp:ListItem Text="��ҵ����" Value="��ҵ" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="��Ӧ�̹���" Value="��Ӧ��"></asp:ListItem>
                                            <asp:ListItem Text="��Ա����" Value="��Ա"></asp:ListItem>
                                            <asp:ListItem Text="��ҵҵ������" Value="��ҵҵ��"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 15%">
                                        <font color="red">*</font>��ʼʱ�䣺
                                    </td>
                                    <td style="width: 35%">
                                        <asp:TextBox ID="kssj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>����ʱ�䣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="jssj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�������⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ggzt" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                            height: 180px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" rowspan="2">
                                        ���渽����
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                                        </asp:DropDownList>
                                        <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="���ظ���" />
                                        <asp:ImageButton ID="AttDelBtn" runat="server" ImageUrl="../../Images/del.gif" ToolTip="ɾ������" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <input id="uploadFile" runat="server" style="width: 85%" type="file" name="uploadFile"
                                            class="mytext" />
                                        <asp:ImageButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" ImageUrl="../../Images/up.gif"
                                            ToolTip="�ϴ�����" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button ID="Button2" Text="�� ��" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                class="mybtn" />
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="fjNumber" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ggzt"
        ErrorMessage="�����빫������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ggfl"
        ErrorMessage="��ѡ�񹫸����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="kssj"
        ErrorMessage="�����뿪ʼʱ��">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="jssj"
        ErrorMessage="���������ʱ��">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
