<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Jq.aspx.cs"
    Inherits="hkpro.workflow.work.HandleWork_Jq" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
    function _change() {
        var text = form1.dp_appcomm.value;
        if (text != "请选择") {
            document.getElementById('txt_AppComm').value = "";
            document.getElementById('txt_AppComm').value = text;
        }
    }
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作加签</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="4" cellspacing="0" width="100%" class="form">
        <tr>
            <td class="form-item">
                工作标题
            </td>
            <td>
                <asp:Label ID="lbltitle" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td width="20%" class="form-item">
                <font color="red">*</font>加签人员：
            </td>
            <td width="80%">
                <asp:TextBox ID="UserName" runat="server" CssClass="mytextarea" TextMode="multiLine"
                    Rows="5" Width="90%"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif"
                        border="0" />
            </td>
        </tr>
        <tr>
            <td class="form-item">
                常用审批备注：
            </td>
            <td width="75%">
                <asp:DropDownList ID="dp_appcomm" runat="server" onchange="_change()" Width="90%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="form-item">
                <font color="red">*</font>审批意见：
            </td>
            <td>
                <asp:TextBox ID="txt_AppComm" runat="server" Width="90%" CssClass="mytextarea" TextMode="MultiLine"
                    Rows="2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="form-item">
                &nbsp;
            </td>
            <td>
                <asp:CheckBox ID="xxtz" runat="server" Text="站内消息提醒加签人" Checked="true" />
                <asp:CheckBox ID="dxtz" runat="server" Text="手机短信提醒加签人" Checked="false" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="SaveBtn" runat="server" Text="保 存" CssClass="mybtn" OnClick="Save_Click" />
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="UserID"
        ErrorMessage="请选择加签人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_AppComm"
        ErrorMessage="请输入审批意见">&nbsp;
    </asp:RequiredFieldValidator>
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
