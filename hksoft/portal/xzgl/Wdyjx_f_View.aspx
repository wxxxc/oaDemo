<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdyjx_f_View.aspx.cs" Inherits="hkpro.portal.xzgl.Wdyjx_f_View"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵ������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
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
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=portal/yjx", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
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
                �鿴���
            </td>
            <td class="td_base" style="width: 20%">
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
                                        ������⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblyjbt" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                            height: 190px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" rowspan="2">
                                        ��ظ�����
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                                        </asp:DropDownList>
                                        <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="���ظ���" />
                                        <asp:ImageButton ID="AttDelBtn" runat="server" ImageUrl="../../Images/del.gif" ToolTip="ɾ������"
                                            Visible="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <input id="uploadFile" runat="server" style="width: 85%" type="file" name="uploadFile"
                                            class="mytext" />
                                        <asp:ImageButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" ImageUrl="../../Images/up.gif"
                                            ToolTip="�ϴ�����" Visible="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �����ˣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblfbrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        ����ʱ�䣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblfbsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �ظ����ݣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblhfnr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �ظ��ˣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblhfrmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �ظ�ʱ�䣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblhfsj" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click"
                                Visible="false"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                                OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Visible="false"></asp:Button>
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
