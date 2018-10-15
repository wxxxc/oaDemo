<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Minixx.aspx.cs" Inherits="hkpro.portal.xxgl.Minixx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>发消息</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table border="0" width="100%">
        <tr>
            <td style="height: 25px">
            </td>
            <td>
            </td>
        </tr>
        <tr style="height: 25px">
            <td style="width: 60" align="right">
                接收人：
            </td>
            <td>
                <asp:TextBox ID="UserName" runat="server" ReadOnly="true" CssClass="mytextarea" TextMode="multiLine"
                    Rows="3" Width="90%"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif"
                        border="0" />
            </td>
        </tr>
        <tr>
            <td align="right">
                内容：
            </td>
            <td>
                <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                    Rows="7"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td style="height: 30px">
                <asp:Button ID="button1" Text="发 送" CssClass="mybtn" runat="server" OnClick="Send_Click"
                    CausesValidation="true" />
                <input type="button" name="RecBtn" class="mybtn" value="关 闭" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="UserID"
        ErrorMessage="请选择接收人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nr"
        ErrorMessage="请输入消息内容">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="nr"
        Display="none" ErrorMessage="内容不能超过100个字" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>

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
