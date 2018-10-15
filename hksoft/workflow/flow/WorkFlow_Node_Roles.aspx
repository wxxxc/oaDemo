<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node_Roles.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node_Roles" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作流管理 - 经办角色</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            <font color="red">*</font>步骤序号：
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="fnNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>步骤名称：
                        </td>
                        <td>
                            <asp:TextBox ID="fnName" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            经办角色：
                        </td>
                        <td>
                            <asp:TextBox ID="fnRoleNames" runat="server" Height="70px" TextMode="MultiLine" Width="90%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="chooserole();" alt="" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="CloseBtn" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value=" 关闭 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="fnRoleIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fnNum"
        ErrorMessage="请输入步骤序号">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fnName"
        ErrorMessage="请输入步骤名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="fnNum"
        Display="none" ErrorMessage="步骤序号必须为正整数" ValidationExpression="^[0-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    <script>
        var uIdName;
        function chooserole() {
            var num = Math.random();
            var str = "" + document.getElementById('fnRoleIDs').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/portal/ChooseRole.aspx?tmp=" + num + "&rqstr=" + str + "", 'window', 'height=500,width=500,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
            else {
                uIdName = window.showModalDialog("../../Choose/portal/ChooseRole.aspx?tmp=" + num + "&rqstr=" + str + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=no;help:no");
            }

            var arr = uIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("fnRoleIDs").value = arr[0];
                document.getElementById("fnRoleNames").value = arr[1];
            }
        }

        function setValue_js(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("fnRoleIDs").value = arr[0];
                document.getElementById("fnRoleNames").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
