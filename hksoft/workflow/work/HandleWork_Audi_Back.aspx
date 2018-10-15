<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Audi_Back.aspx.cs"
    Inherits="hkpro.workflow.work.HandleWork_Audi_Back" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('FormName').value == '') {
            alert('对不起，没有找到下一步骤！');
            form1.FormName.focus();
            return false;
        }

        if (document.getElementById('FormName').value != '0') {
            if (document.getElementById('txt_wUserNames').value == '') {
                alert('请选择审批人员！');
                form1.txt_wUserNames.focus();
                return false;
            }
        }
    }

    function dpfn_onchange(targ, selObj, restore) {
        document.getElementById('txt_wUserNames').value = '';
        document.getElementById('txt_wUserIDs').value = '';
    }
</script>
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>待办工作-审批驳回</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">     
        <tr>
            <td style="height: 30">
                &nbsp;流水号：<asp:Label ID="lblstrwSerialNo" runat="server"></asp:Label>
                －
                <asp:Label ID="lblName" runat="server"></asp:Label>
                － 当前步骤：<asp:Label ID="lblstrfnName" runat="server"></asp:Label>
            </td>
            <td align="right">
                <input id="Button6" type="button" value="流程图" onclick='window.open ("Flow_Show.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"]%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")'
                    class="btn btn-primary" />&nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            选择下一步骤：
                        </td>
                        <td width="80%">
                            <asp:DropDownList ID="FormName" runat="server" Width="80%" AutoPostBack="True" onchange="dpfn_onchange()">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <asp:Panel ID="Panel1" runat="server">
                        <tr>
                            <td class="form-item">
                                经办人员：
                            </td>
                            <td>
                                <asp:TextBox ID="OwUserNames" runat="server" Width="80%" Height="50px" TextMode="MultiLine"
                                    CssClass="mytextarea"></asp:TextBox>
                                <asp:Label ID="lblmsg1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                经办部门：
                            </td>
                            <td>
                                <asp:TextBox ID="txt_wDeptNames" runat="server" Height="50px" TextMode="MultiLine"
                                    Width="80%" CssClass="mytextarea"></asp:TextBox>
                                <asp:Label ID="lblmsg2" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                经办角色：
                            </td>
                            <td>
                                <asp:TextBox ID="txt_wRoleNames" runat="server" Height="50px" TextMode="MultiLine"
                                    Width="80%" CssClass="mytextarea"></asp:TextBox>
                                <asp:Label ID="lblmsg3" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                审批接收人员：
                            </td>
                            <td>
                                <asp:TextBox ID="txt_wUserNames" runat="server" Height="70px" TextMode="MultiLine"
                                    Width="80%" CssClass="mytextarea"></asp:TextBox>
                                <asp:Label ID="lblmsg4" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="Button1" runat="server" Text=" 驳回 " CssClass="btn btn-primary" OnClick="Button1_Click" />
                <input type="button" name="RecBtn" value=" 关闭 " class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="txt_wUserIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="OwUserIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="txt_wDeptIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="txt_wRoleIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblFlowId" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstrPromoterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstrPromoterName" runat="server" Visible="false"></asp:Label>
    <script language="javascript">
        var dIdName;
        function choosedept() {
            var num = Math.random();
            var str = "" + document.getElementById('txt_wDeptIDs').value + "";
            var str1 = "" + document.getElementById('txt_wUserIDs').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/flow/ChooseUser_WorkDept.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", 'window', 'height=500,width=500,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
            else {
                dIdName = window.showModalDialog("../../Choose/flow/ChooseUser_WorkDept.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=no;help:no");
            }

            var arr = dIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }

        function setValue_workdept(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }



        var wName_2;
        function chooserole() {
            var num = Math.random();
            var str = "" + document.getElementById('txt_wRoleIDs').value + "";
            var str1 = "" + document.getElementById('txt_wUserIDs').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/flow/ChooseUser_WorkRole.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", 'window', 'height=500,width=500,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
            else {
                wName_2 = window.showModalDialog("../../Choose/flow/ChooseUser_WorkRole.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=no;help:no");
            }

            var arr = wName_2.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }

        function setValue_workrole(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }



        var wName_3;
        function openUser() {
            var num = Math.random();
            var str = "" + document.getElementById('OwUserIDs').value + "";
            var str1 = "" + document.getElementById('txt_wUserIDs').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/flow/ChooseUser_WorkUser.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", 'window', 'height=500,width=500,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
            else {
                wName_3 = window.showModalDialog("../../Choose/flow/ChooseUser_WorkUser.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=no;help:no");
            }

            var arr = wName_3.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }

        function setValue_workuser(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }



        var uIdName;
        function chooseuser_m() {
            var num = Math.random();
            var str = "" + document.getElementById('txt_wUserIDs').value + "";

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
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }

        function setValue(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("txt_wUserIDs").value = arr[0];
                document.getElementById("txt_wUserNames").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
