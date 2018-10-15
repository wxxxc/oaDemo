<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_EnTrust.aspx.cs"
    Inherits="hkpro.workflow.work.HandleWork_EnTrust" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('txt_EnUserID').value == '') {
            alert('请选择委托代办人员！');
            form1.txt_EnUserID.focus();
            return false;
        }
    }  
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作委托</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">  
        <tr>
            <td valign="top" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            当前步骤：
                        </td>
                        <td width="80%">
                            <%=strfnName %>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            委托代办人：
                        </td>
                        <td>
                            <asp:TextBox ID="txt_EnUserName" runat="server" Width="85%" CssClass="mytext"></asp:TextBox>
                            <img onclick="chooseuser_s();" alt="" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="mybtn" OnClick="SaveBtn_Click" />
                <input id="Button2" class="mybtn" onclick="history.back()" type="button" value=" 返回 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_EnUserID" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <script language="javascript">
        var uIdName1;
        function chooseuser_s() {
            var rdm = Math.random();
            var str = "" + document.getElementById('txt_EnUserID').value + "|" + document.getElementById('txt_EnUserName').value + "";

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
                document.getElementById("txt_EnUserID").value = arr[0];
                document.getElementById("txt_EnUserName").value = arr[1];
            }
        }

        function setValue_s(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_EnUserID").value = arr[0];
                document.getElementById("txt_EnUserName").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
