<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsjsc.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsjsc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>��������ɾ��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="4" width="100%" border="0" class="form">
                        <tr>
                            <td class="form-item" style="width: 20%; height: 25px">
                                ������ɾ����
                            </td>
                            <td style="width: 80%">
                                ɾ����
                                <asp:TextBox ID="ksrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                    Width="75"></asp:TextBox>��<asp:TextBox ID="jsrq" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="75"></asp:TextBox>
                                ��ȫ��Ա����������
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ȷ��ɾ��" 
                                    CausesValidation="false" OnClick="Del_Click" OnClientClick="return confirm('ɾ����������µ�������ڷ�Χ�ڵĿ������ݣ�ȷ�ϼ�����')">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="height: 25px">
                                ������ɾ����
                            </td>
                            <td>
                                ɾ��Ա��
                                <asp:TextBox ID="UserName1" runat="server" CssClass="mytext" Width="60"></asp:TextBox><img
                                    id="img1" onclick="chooseuser();" alt="" src="../../Images/choose.gif" border="0"
                                    runat="server" />
                                ��<asp:TextBox ID="ksrq1" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                    Width="75"></asp:TextBox>��<asp:TextBox ID="jsrq1" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="75"></asp:TextBox>
                                �Ŀ�������
                                <asp:Button CssClass="mybtn" ID="DelBtn2" runat="server" Text="ȷ��ɾ��" 
                                    CausesValidation="false" OnClick="Del_Click2" OnClientClick="return confirm('ɾ����������µ����Ա����ѡ�����ڷ�Χ�ڵĿ������ݣ�ȷ�ϼ�����')">
                                </asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="height: 25px">
                                &nbsp;
                            </td>
                            <td>
                                <font color="red">���ѣ�ֻ��ɾ������ͬ���ڷ�Χ�Ŀ������ݺ󣬲����ٴ����µ��룡</font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
    </table>
    <asp:TextBox ID="UserID1" runat="server" Style="display: none"></asp:TextBox>
    <script language="javascript">
        var uIdName1;
        function chooseuser() {
            var rdm = Math.random();
            var str = "" + document.getElementById('UserID1').value + "|" + document.getElementById('UserName1').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/portal/ChooseUserS.aspx?tmp=" + rdm + "&rqstr=" + str + "", 'newwindow', 'height=480,width=550,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
            }
            else {
                uIdName1 = window.showModalDialog("../../Choose/portal/ChooseUserS.aspx?tmp=" + rdm + "&rqstr=" + str + "", "newwindow", "dialogWidth:550px;DialogHeight=480px;status:no;scroll=yes;help:no");
            }

            var arr = uIdName1.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID1").value = arr[0];
                document.getElementById("UserName1").value = arr[1];
            }
        }

        function setValue_s(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID1").value = arr[0];
                document.getElementById("UserName1").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
