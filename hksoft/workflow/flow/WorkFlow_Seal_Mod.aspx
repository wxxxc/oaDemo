<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Seal_Mod.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Seal_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function killErrors() {
        return true;
    }
    window.onerror = killErrors;

    function chknull() {
        if (document.getElementById('sealarea').value == '') {
            alert('请选择印章域');
            form1.sealarea.focus();
            return false;
        }

        if (document.getElementById('chUserNames').value == '') {
            alert('请选择允许使用的人员');
            form1.chUserNames.focus();
            return false;
        }
    }  
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>修改电子印章 - 工作流管理</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="4" cellspacing="1" width="100%">
        <tr>
            <td colspan="2" height="20">
            </td>
        </tr>
        <tr>
            <td align="right" width="25%">
                当前印章域：
            </td>
            <td width="75%">
                <asp:TextBox ID="sealarea" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                允许使用人员：
            </td>
            <td>
                <asp:TextBox ID="chUserNames" runat="server" Height="55px" TextMode="MultiLine" Width="90%"
                    CssClass="mytextarea"></asp:TextBox>
                <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="25">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="CloseBtn" class="btb btn-danger" onclick="javascript:window.close()" type="button"
                    value=" 关闭 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="chUserIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <script language="javascript">
        var uIdName;
        function chooseuser_m() {
            var num = Math.random();
            var str = "" + document.getElementById('chUserIDs').value + "";

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
                document.getElementById("chUserIDs").value = arr[0];
                document.getElementById("chUserNames").value = arr[1];
            }
        }

        function setValue(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("chUserIDs").value = arr[0];
                document.getElementById("chUserNames").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
