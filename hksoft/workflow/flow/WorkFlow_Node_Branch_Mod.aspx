<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node_Branch_Mod.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node_Branch_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function killErrors() {
        return true;
    }
    window.onerror = killErrors;

    function chknull() {
        if (document.getElementById('fbName').value == '') {
            alert('请选择字段名称');
            form1.fbName.focus();
            return false;
        }

        if (document.getElementById('fbValue').value == '') {
            alert('请输入判断依据');
            form1.fbValue.focus();
            return false;
        }

        if (document.getElementById('fbType').value == '[数字型]') {
            var objRe = /^(0|[1-9]\d*)$/;
            if (!objRe.test(document.getElementById('fbValue').value)) {
                alert('当前字段为[数字型]，判断依据必须为数字');
                form1.fbValue.focus();
                return false;
            }
        }

        if (document.getElementById('fbType').value == '[常规型]') {
            if (document.getElementById('fbCondi').value == '>' || document.getElementById('fbCondi').value == '>=' || document.getElementById('fbCondi').value == '<=' || document.getElementById('fbCondi').value == '<' || document.getElementById('fbCondi').value == '=') {
                alert('[常规型]字段不能使用比较符号');
                return false;
            }
        }
    }  
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作流管理 - 修改条件设置</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
        <tr>
            <td colspan="2" height="30">
            </td>
        </tr>
        <tr>
            <td align="right" width="20%">
                字段名称：
            </td>
            <td width="80%">
                <asp:TextBox ID="fbName" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                <img onclick="choosedept()" src="../../Images/choose.gif" border="0">
            </td>
        </tr>
        <tr>
            <td align="right">
                字段类型：
            </td>
            <td>
                <asp:TextBox ID="fbType" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                条件判断：
            </td>
            <td>
                <asp:DropDownList ID="fbCondi" runat="server" Width="90%">
                    <asp:ListItem Value="&gt;">大于</asp:ListItem>
                    <asp:ListItem Value="&gt;=">大于且等于</asp:ListItem>
                    <asp:ListItem Value="==">等于</asp:ListItem>
                    <asp:ListItem Value="&lt;">小于</asp:ListItem>
                    <asp:ListItem Value="&lt;=">小于且等于</asp:ListItem>
                    <asp:ListItem>包含</asp:ListItem>
                    <asp:ListItem>不包含</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                判断依据：
            </td>
            <td>
                <asp:TextBox ID="fbValue" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="25">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="CloseBtn" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value=" 关闭 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="lblno" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfname" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfno" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfname" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="FormNumber" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="KeyID" runat="server" Style="display: none"></asp:TextBox>
    <script language="javascript">
        var uIdName;
        function choosedept() {
            var num = Math.random();
            var str = "" + document.getElementById('lblno').value + "|" + document.getElementById('fbName').value + "|" + document.getElementById('fbType').value + "";
            FormNumber = document.getElementById('FormNumber').value;

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/flow/ChooseFormColumn.aspx?tmp=" + num + "&rqstr=" + str + "&FormNumber=" + FormNumber + "", 'newwindow', 'height=500,width=400,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
            }
            else {
                uIdName = window.showModalDialog("../../Choose/flow/ChooseFormColumn.aspx?tmp=" + num + "&rqstr=" + str + "&FormNumber=" + FormNumber + "", "newwindow", "dialogWidth:400px;DialogHeight=500px;status:no;scroll=yes;help:no");
            }

            var arr = uIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("lblno").value = arr[0];
                document.getElementById("fbName").value = arr[1];
                document.getElementById("fbType").value = arr[2];
            }
        }

        function setValue_fc(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("lblno").value = arr[0];
                document.getElementById("fbName").value = arr[1];
                document.getElementById("fbType").value = arr[2];
            }
        }
    </script>
    </form>
</body>
</html>
