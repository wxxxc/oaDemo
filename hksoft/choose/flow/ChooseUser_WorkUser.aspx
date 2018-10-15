<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseUser_WorkUser.aspx.cs"
    Inherits="hkpro.Choose.flow.ChooseUser_WorkUser" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>请选择用户</title>

    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <base target="_self" />

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
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue_workuser(CheckSelect());
            }
            else {
                window.returnValue = CheckSelect();
            }
            
            window.close();
        }

        function clearwin() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue_workuser("|");
            }
            else {
                window.returnValue = "|";
            }
            
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
<body class="main">
    <form id="Form1" method="post" runat="server">
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
                <asp:ListBox ID="SelectListBox" runat="server" Height="400px" Width="200px"></asp:ListBox>
            </td>
            <td align="center" valign="middle">
                <asp:Button ID="fsBtn" runat="server" OnClick="fsBtn_Click" Text=">" Width="58px" /><br />
                <br />
                <asp:Button ID="faBtn" runat="server" OnClick="faBtn_Click" Text=">>" Width="58px" />
                <br />
                <asp:Button ID="bsBtn" runat="server" OnClick="bsBtn_Click" Text="<" Width="58px" /><br />
                <br />
                <asp:Button ID="baBtn" runat="server" OnClick="baBtn_Click" Text="<<" Width="58px" />
            </td>
            <td align="center" valign="top">
                <asp:ListBox ID="SelectedListBox" runat="server" Height="400px" Width="200px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px;" align="center" colspan="3">
                <input id="SaveBtn" class="mybtn" onclick="return checkbtn();" type="button" value=" 确定 " />
                <input type="button" value=" 关闭 " onclick="closewin();" class="mybtn" id="CloseBtn">
                <input id="ClearBtn" class="mybtn" onclick="clearwin();" type="button" value=" 清空 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="tbvalue" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbtext" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="rqstr" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbType" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
