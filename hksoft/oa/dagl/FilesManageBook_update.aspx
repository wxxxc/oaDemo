<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageBook_update.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageBook_update" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
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
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=oa/dagl", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
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
    <script>
        function zxcheck() {
            if (document.getElementById('fjlb').value == '') {
                alert('δѡ�б༭�ļ�');
                return false;
            }
            else {
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cValue = littleproduct.options[cindex].value;
                var picOK = false;
                var nameLen = cValue.length;
                var rightName = cValue.substr(nameLen - 4, 4).toLowerCase();
                if (nameLen > 0) {
                    if (rightName == ".doc" || rightName == ".DOC" || rightName == ".xls" || rightName == ".XLS" || rightName == ".ppt" || rightName == ".PPT") {
                        picOK = true;
                        var num = document.getElementById("Number").value;
                        var tmp = Math.random();
                        window.open("FilesManageBook_add_online.aspx?tmp=" + tmp + "&number=" + num + "&file=" + cValue + "&filetype=" + rightName + "", "newwindow", "height=700, width=960, top=0, left=30, toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no");
                    }

                    if (picOK == false) {
                        alert("��ʾ:\rֻ�ܱ༭.doc|.xls|.ppt|��ʽ���ļ���");
                        return (false);
                    }
                }
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                �޸��ļ���Ϣ
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" width="20%">
                            <font color="red">*</font>�ļ��ţ�
                        </td>
                        <td width="30%">
                            <asp:TextBox ID="Num" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td width="20%" class="form-item">
                            <font color="red">*</font>�ļ�����ʣ�
                        </td>
                        <td width="30%">
                            <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ����⣺
                        </td>
                        <td>
                            <asp:TextBox ID="wjTitle" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            �ļ������⣺
                        </td>
                        <td>
                            <asp:TextBox ID="OtherTitle" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ���ĵ�λ��
                        </td>
                        <td>
                            <asp:TextBox ID="FwCompany" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            �������ڣ�
                        </td>
                        <td>
                            <asp:TextBox ID="FwTime" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"
                                CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ܼ���
                        </td>
                        <td>
                            <asp:DropDownList ID="Miji" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            �����ȼ���
                        </td>
                        <td>
                            <asp:DropDownList ID="Dengji" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ����ࣺ
                        </td>
                        <td>
                            <asp:DropDownList ID="WjType" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            �������
                        </td>
                        <td>
                            <asp:DropDownList ID="GwType" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            �ļ�ҳ����
                        </td>
                        <td>
                            <asp:TextBox ID="WjNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            ��ӡҳ����
                        </td>
                        <td>
                            <asp:TextBox ID="DyNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>��������
                        </td>
                        <td>
                            <asp:DropDownList ID="FilesName" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            ��ע��
                        </td>
                        <td>
                            <asp:TextBox ID="Remark" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" rowspan="2">
                            �ļ�������
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                            </asp:DropDownList>
                            <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="���ظ���" />
                            <asp:ImageButton ID="AttDelBtn" runat="server" ImageUrl="../../Images/del.gif" ToolTip="ɾ������" />
                            <img onclick="zxcheck();" src="../../Images/edit.gif" border="0" alt="���߱༭����" id="editimg"
                                runat="server" />
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
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Num"
        ErrorMessage="�������ļ���">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
        ErrorMessage="�����������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FilesName"
        ErrorMessage="��ѡ����������">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
