<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseUser_WorkDept.aspx.cs"
    Inherits="hkpro.Choose_A.flow.ChooseUser_WorkDept" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>选择用户(按部门)</title>
    <base target="_self" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

    <script language="javascript">
        function checkbtn() {
            for (var i = 0; i < document.getElementById('SelectedListBox').length; i++) {
                document.getElementById("tbvalue").value = "" + document.getElementById("tbvalue").value + "" + document.getElementById('SelectedListBox').options[i].value + ",";
                document.getElementById("tbtext").value = "" + document.getElementById("tbtext").value + "" + document.getElementById('SelectedListBox').options[i].text + ",";
            }

            if (document.getElementById("tbvalue").value == '') {
                alert('您未选择任何项！');
                return false;
            }
            else {
                sendFromChild();
            }
        }

        var getFromParent = window.dialogArguments;
        function CheckSelect() {
            var retrunstr = "";
            retrunstr = "" + document.getElementById("tbvalue").value + "|" + document.getElementById("tbtext").value + "";
            return retrunstr;
        }

        function sendFromChild() {
            window.opener.setValue_workdept(CheckSelect());
            window.close();
        }

        function clearwin() {
            window.opener.setValue_workdept("|");
            window.close();
        }

        window.onbeforeunload = function() {
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
<body>
    <form id="Form1" method="post" runat="server" data-ajax="false">
    <div data-role="page" id="indexPage">
        <div data-role="header" data-position="fixed" data-theme="b">
            <h1>
                选择用户</h1>
        </div>
        <div data-role="content" data-theme="d">
            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                <tr>
                    <td align="center" style="width: 45%; height: 25">
                        <b>待选人员</b>
                    </td>
                    <td align="center" style="width: 10%">
                        &nbsp;
                    </td>
                    <td align="center" style="width: 45%">
                        <b>已选人员</b>
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top">
                        <asp:ListBox ID="SelectListBox" runat="server" Height="260px" Width="120px" data-role="none">
                        </asp:ListBox>
                    </td>
                    <td align="center" valign="middle">
                        <asp:Button ID="fsBtn" runat="server" OnClick="fsBtn_Click" Text=">" Width="55px" />
                        <asp:Button ID="faBtn" runat="server" OnClick="faBtn_Click" Text=">>" Width="55px" />
                        <asp:Button ID="bsBtn" runat="server" OnClick="bsBtn_Click" Text="<" Width="55px" />
                        <asp:Button ID="baBtn" runat="server" OnClick="baBtn_Click" Text="<<" Width="55px" />
                    </td>
                    <td align="center" valign="top">
                        <asp:ListBox ID="SelectedListBox" runat="server" Height="260px" Width="120px" data-role="none">
                        </asp:ListBox>
                    </td>
                </tr>
            </table>
            <input id="SaveBtn" onclick="return checkbtn();" type="button" value="确定" data-theme="e" />
            <input id="ClearBtn" onclick="clearwin();" type="button" value="清空" data-theme="e" />
            <input type="button" value="关闭" onclick="closewin();" id="CloseBtn" data-theme="e" />
        </div>
    </div>
    <asp:TextBox ID="tbvalue" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbtext" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="rqstr" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbType" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
