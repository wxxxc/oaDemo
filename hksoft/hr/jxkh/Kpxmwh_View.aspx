<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpxmwh_View.aspx.cs" Inherits="hkpro.oa.jxkh.Kpxmwh_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

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
    
    <title>������Ŀά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    <asp:Label ID="lbltitle" runat="server"></asp:Label>������Ŀ��Ϣ
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td style="height: 10px">
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left">
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                        <tr>
                                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                                align="center">
                                                <a href="#" class="mail_top">������Ϣ</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                                <a href="Kpxmwh_View_Bkpr.aspx?id=<%=kpid.Text %>" class="black">����������Ϣ</a>
                                            </td>
                                            <td align="right">
                                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click"
                                                    AccessKey="s" Visible="false"></asp:Button>
                                                <asp:Button CssClass="btn btn-info" ID="StartBtn" runat="server" Text="����" OnClientClick="return confirm('ȷ�������󽫲������޸ģ�Ҫ����ִ����')" Visible="false" OnClick="Start_Click"></asp:Button>
                                                <asp:Button CssClass="btn btn-primary" ID="StopBtn" runat="server" Text="��ͣ" OnClientClick="return confirm('ȷ��Ҫ��ͣ�˿�����Ŀ��')" Visible="false" OnClick="Stop_Click"></asp:Button>
                                                <asp:Button CssClass="btn btn-success" ID="ResetBtn" runat="server" Text="�����޸�" OnClientClick="return confirm('ȷ��Ҫ��ԭ��δ��Ч״̬�������޸���')" Visible="false" OnClick="Reset_Click"></asp:Button>
                                                <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                                                    Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button>
                                                <input type="button" name="BackBtn" value="�ر�" class="btn btn-danger" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" class="form" width="100%">
                                        <tr>
                                            <td class="form-item">
                                                ������ʼ����<font color="red">*</font>��</td>
                                            <td>
                                                <asp:TextBox CssClass="mytext" ID="ksrq" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox>
                                            </td>
                                            <td class="form-item">
                                                ������ֹ����<font color="red">*</font>��</td>
                                            <td>
                                                <asp:TextBox CssClass="mytext" ID="jzrq" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" style="width:20%">
                                                ��������<font color="red">*</font>��
                                            </td>
                                            <td style="width:30%">
                                                <asp:TextBox ID="kpqs" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                            </td>
                                            <td class="form-item" style="width:20%">
                                                ����״̬��
                                            </td>
                                            <td style="width:30%">
                                                <asp:Label ID="kpzt" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">
                                                ������ί<font color="red">*</font>��</td>
                                            <td colspan="3">
                                                <asp:TextBox ID="UserName" runat="server" Height="55px" TextMode="MultiLine" Width="92%"
                                                    CssClass="mytextarea"></asp:TextBox>
                                                <img onclick="openUser();" alt="" src="../../Images/choose.gif" border="0">
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
                                        <tr>
                                            <td class="form-item" rowspan="2">
                                                ��Ŀ������
                                            </td>
                                            <td colspan="3">
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
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="kpid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kpqs"
        ErrorMessage="�����뿼������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="ksrq"
        ErrorMessage="��ѡ��ʼ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="jzrq"
        ErrorMessage="��ѡ���ֹ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName"
        ErrorMessage="��ѡ�������ί">&nbsp;
    </asp:RequiredFieldValidator>
    
    <script language="javascript">
        var wName_3;
        function openUser() {
            var num = Math.random();
            var str = "" + document.getElementById('UserID').value + "";
            var str1 = "" + document.getElementById('UserID').value + "";
            wName_3 = window.showModalDialog("../../choose/hr/ChoosePw.aspx?tmp=" + num + "&rqstr=" + str + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=yes;help:no");

            if (!wName_3)
                wName_3 = window.ReturnValue;   //for ch��ff��sf��op

            var arr = wName_3.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID").value = arr[0];
                document.getElementById("UserName").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
