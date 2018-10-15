<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pfclsc_Sc.aspx.cs" Inherits="hkpro.oa.jxkh.Pfclsc_Sc" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>���ֲ����ϴ�</title>
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>
    
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
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=hr/jxgl", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
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
                window.showModalDialog("../../AttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "dialogWidth:1px;DialogHeight=1px;status:no;scroll=yes;help:no");
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" style="height: 25px">
                    <asp:Label ID="lbltitle" runat="server"></asp:Label>��<asp:Label ID="lblname" runat="server"></asp:Label>�������ֲ���
                </td>
                <td class="td_base">
                </td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                        <tr>
                            <td class="form-item" rowspan="2" style="width:20%">
                                ��ͬ������
                            </td>
                            <td colspan="3" style="width:80%">
                                <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                                </asp:DropDownList>
                                <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="���ظ���" />
                                <asp:ImageButton ID="AttDelBtn" runat="server" ImageUrl="../../Images/del.gif"
                                    ToolTip="ɾ������" Visible="false" />
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
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center" style="height:30">
                    <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click"
                        AccessKey="s" Visible="false"></asp:Button>
                    <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    <!--����label-->
    <asp:Label ID="IDlabel" runat="server" Visible="false" />
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
