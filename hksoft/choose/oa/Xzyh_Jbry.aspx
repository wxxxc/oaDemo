<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xzyh_Jbry.aspx.cs" Inherits="hksoft.choose.oa.Xzyh_Jbry" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>请选择用户</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <base target="_self" />
    <script language="javascript">
        function checkbtn() {
            for (var i = 0; i < document.getElementById('TargetListBox').length; i++) {

                document.getElementById("TextBox1").value = "" + document.getElementById("TextBox1").value + "" + document.getElementById('TargetListBox').options[i].value + ",";
                document.getElementById("TextBox2").value = "" + document.getElementById("TextBox2").value + "" + document.getElementById('TargetListBox').options[i].text + ",";

            }
            if (document.getElementById("TextBox1").value == '') {
                alert('您未选中任何项');
                return false;
            }
            else {
                sendFromChild();
            }
        }
        var getFromParent = window.dialogArguments;
        function chkSelect() {
            var retrunstr = "";
            retrunstr = "" + document.getElementById("TextBox1").value + "|" + document.getElementById("TextBox2").value + "";
            return retrunstr;
        }

        function sendFromChild() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue_user(chkSelect());
            }
            else {
                window.returnValue = chkSelect();
            }

            window.close();
        }

        function clearwin() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue_user("|");
            }
            else {
                window.returnValue = "|";
            }

            window.close();
        }

        window.onbeforeunload = function () {
            var n = window.event.screenX - window.screenLeft;
            var b = n > document.documentElement.scrollWidth - 20;
            if (b && window.event.clientY < 0 || window.event.altKey) {
            }
        }

        function closewin() {
            window.close();
        }
    </script>
</head>
<body class="main">
    <form id="Form1" method="post" runat="server">
        <asp:TextBox ID="TextBox1" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="requeststr" runat="server" Style="display: none"></asp:TextBox>
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" style="text-align: center">
                    <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
                        <tr>
                            <td style="height: 30px; text-align: center;">
                                <asp:TextBox ID="KeyBox" runat="server" Style="display: none"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table border="0" cellpadding="0" cellspacing="0" style="height: 302px">
                                    <tr>
                                        <td align="center" style="width: 113px" valign="top">
                                            <asp:ListBox ID="SourceListBox" runat="server" Height="411px" Width="157px"></asp:ListBox></td>
                                        <td align="center" style="width: 42px" valign="top">
                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text=">" Width="58px" /><br />
                                            <br />
                                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text=">>" Width="58px" />
                                            <br />
                                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="<" Width="58px" /><br />
                                            <br />
                                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="<<" Width="58px" />
                                        </td>
                                        <td align="center" style="width: 100px" valign="top">
                                            <asp:ListBox ID="TargetListBox" runat="server" Height="411px" Width="157px"></asp:ListBox></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td style="height: 30px; text-align: center;">
                                <input id="Button2" class="mybtn" onclick="return checkbtn();" type="button"
                                    value="确定" />
                                <input type="button" value="关闭" onclick="closewin();" class="mybtn" id="Button3">
                                <input id="Button12" class="mybtn" onclick="clearwin();" type="button" value="清空" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
