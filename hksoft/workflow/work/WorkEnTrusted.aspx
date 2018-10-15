<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkEnTrusted.aspx.cs"
    Inherits="hkpro.workflow.work.WorkEnTrusted" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('ClientUserIDs').value == '') {
            alert('请选择委托代办人员！');
            return false;
        }
    }  
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>委托设置</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">   
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            用户姓名：
                        </td>
                        <td width="80%">
                            <%=Name%>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            委托代办人：
                        </td>
                        <td>
                            <asp:TextBox ID="ClientUserNames" runat="server" Width="80%" CssClass="mytext"></asp:TextBox>
                            <img onclick="chooseuser_s();" alt="" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            状态：
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rb_status" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Text="启用" Value="启用" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="停用" Value="停用"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="ClientUserIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <script language="javascript">
        var uIdName1;
        function chooseuser_s() {
            var rdm = Math.random();
            var str = "" + document.getElementById('ClientUserIDs').value + "|" + document.getElementById('ClientUserNames').value + "";

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
                document.getElementById("ClientUserIDs").value = arr[0];
                document.getElementById("ClientUserNames").value = arr[1];
            }
        }

        function setValue_s(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("ClientUserIDs").value = arr[0];
                document.getElementById("ClientUserNames").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
