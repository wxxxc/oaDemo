<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xyj.aspx.cs" Inherits="hkpro.portal.yjgl.Xyj"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>д�ʼ�</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
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
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=portal/yj", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
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
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 10px" colspan="2">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                        align="center">
                                        <a href="sjx.aspx?i=2" class="black">�ռ���</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="fajx.aspx" class="black">������</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="feijx.aspx" class="black">�ϼ���</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="cgx.aspx" class="black">�ݸ���</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                        <a href="xyj.aspx" class="mail_top">׫д���ʼ�</a>
                                    </td>
                                    <td align="right">
                                        <asp:DropDownList ID="inout" runat="server" OnSelectedIndexChanged="Change_Click"
                                            AutoPostBack="true">
                                            <asp:ListItem Text="׫д�ڲ��ʼ�" Value="�ڲ�" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="׫д�ⲿ�ʼ�" Value="�ⲿ"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button CssClass="mybtn" ID="SendBtn" runat="server" Text="�� ��" OnClick="Send_Click">
                                        </asp:Button>
                                        <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����ݸ�" OnClick="Save_Click">
                                        </asp:Button>
                                    </td>
                                </tr>
                            </table>
                            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>�ռ��ˣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="580"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif"
                                                border="0" />
                                        <asp:CheckBox ID="msbz" runat="server" Text="����" ToolTip="��ѡ����ռ��˽����ῴ���������ռ�����Ϣ" />
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>���⣺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bt" runat="server" CssClass="mytext" Width="580" MaxLength="50" />
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        ��Ҫ�ԣ�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zyx" runat="server">
                                            <asp:ListItem Text="��Ҫ�ʼ�" Value="��Ҫ"></asp:ListItem>
                                            <asp:ListItem Text="��ͨ�ʼ�" Value="��ͨ" Selected="true"></asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;&nbsp;
                                        <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ�����ռ���" Checked="true" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ����������ռ���" Checked="false" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                            height: 180px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" rowspan="2">
                                        �����б�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                                        </asp:DropDownList>
                                        <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="���ظ���" />
                                        <asp:ImageButton ID="delBtn" runat="server" ImageUrl="../../Images/del.gif" ToolTip="ɾ������" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="uploadFile" runat="server" style="width: 85%" type="file" name="uploadFile"
                                            class="mytext" />
                                        <asp:ImageButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" ImageUrl="../../Images/up.gif"
                                            ToolTip="�ϴ�����" />
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
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="UserID"
        ErrorMessage="��ѡ���ռ���">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="bt"
        ErrorMessage="�������ʼ�����">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
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
