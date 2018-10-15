<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Add.aspx.cs" Inherits="hkpro.workflow.flow.WorkFlow_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>新建工作流 - 工作流管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                新建工作流
            </td>
            <td class="td_base" width="20%">
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td colspan="2" align="center">
                            <b>基本信息</b>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" width="20%">
                            <font color="red">*</font>流程名称：
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="wfName" runat="server" Width="90%" MaxLength="10" ToolTip="最多输入10个字符"
                                CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            对应表单：
                        </td>
                        <td>
                            <asp:DropDownList ID="fName" runat="server" Width="90%" Enabled="False">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            流程状态：
                        </td>
                        <td>
                            <asp:DropDownList ID="wfStatus" runat="server" Width="90%">
                                <asp:ListItem>正常</asp:ListItem>
                                <asp:ListItem>停用</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            允许监控用户：
                        </td>
                        <td>
                            <asp:TextBox ID="wfUserNames" runat="server" Height="34px" TextMode="MultiLine" Width="90%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="chooseuser_m()" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            使用人部门：
                        </td>
                        <td>
                            <asp:TextBox ID="wfDept" runat="server" Height="34px" TextMode="MultiLine" Width="90%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="choosedept()" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            结束后归档：
                        </td>
                        <td>
                            <asp:DropDownList ID="FK_ffid" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td colspan="2" align="center">
                            <b>工作文号</b>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" width="20%">
                        </td>
                        <td width="80%">
                            <asp:RadioButtonList ID="rb_ynModFileNo" runat="server" RepeatDirection="Horizontal"
                                RepeatLayout="Flow">
                                <asp:ListItem Text="允许修改文号" Value="是" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="不允许修改文号" Value="否"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            自动文号表达式：
                        </td>
                        <td>
                            <asp:TextBox ID="FileNo" runat="server" Width="90%" CssClass="mytext">{F}流程（{Y}年{M}月{D}日{H}:{I}）</asp:TextBox>
                            <img alt="" onclick="javascript:popHelp('../../Help/flow/FileNo.htm');" src="../../Images/help.gif"
                                border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>自动编号计数器：
                        </td>
                        <td>
                            <asp:TextBox ID="FileStartNo" runat="server" Width="90%" CssClass="mytext" ToolTip="即相同流程下开始编号的数字">0</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>自动编号位数：
                        </td>
                        <td>
                            <asp:TextBox ID="FileDigit" runat="server" Width="90%" CssClass="mytext">0</asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button Style="width: 100px" ID="SaveBtn" runat="server" Text="保存并关闭" CssClass="btn btn-success"
                    OnClick="SaveBtn_Click" />
                <asp:Button Style="width: 100px" ID="NextNodeBtn" runat="server" Text="下一步设置节点" CssClass="btn btn-primary"
                    OnClick="NextNodeBtn_Click" />
                <asp:Button Style="width: 100px" ID="NextCopyBtn" runat="server" Text="下一步复制流程" CssClass="btn btn-info"
                    OnClick="NextCopyBtn_Click" CausesValidation="false" />
                <input id="CloseBtn" style="width: 100px" class="btn btn-danger" onclick="javascript:window.close()"
                    type="button" value="关闭窗口" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="wfName"
        ErrorMessage="请输入流程名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FileStartNo"
        ErrorMessage="请输入自动编号计数器">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileDigit"
        ErrorMessage="请输入自动编号位数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="FileStartNo"
        Display="none" ErrorMessage="自动编号计数器必须为正整数" ValidationExpression="^[0-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="FileDigit"
        Display="none" ErrorMessage="自动编号位数必须为正整数" ValidationExpression="^[0-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:TextBox ID="wfUserIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="wfDeptIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="fNo" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="wfNo" runat="server" Style="display: none"></asp:TextBox>
    <script language="javascript">
        var dIdName;
        function choosedept() {
            var num = Math.random();
            var str = "" + document.getElementById('wfDeptIDs').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/portal/ChooseDept.aspx?tmp=" + num + "&rqstr=" + str + "", 'window', 'height=500,width=500,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
            }
            else {
                dIdName = window.showModalDialog("../../Choose/portal/ChooseDept.aspx?tmp=" + num + "&rqstr=" + str + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=no;help:no");
            }

            var arr = dIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("wfDeptIDs").value = arr[0];
                document.getElementById("wfDept").value = arr[1];
            }
        }

        function setValue_bm(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("wfDeptIDs").value = arr[0];
                document.getElementById("wfDept").value = arr[1];
            }
        }



        var uIdName;
        function chooseuser_m() {
            var num = Math.random();
            var str = "" + document.getElementById('wfUserIDs').value + "";

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
                document.getElementById("wfUserIDs").value = arr[0];
                document.getElementById("wfUserNames").value = arr[1];
            }
        }

        function setValue(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("wfUserIDs").value = arr[0];
                document.getElementById("wfUserNames").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
