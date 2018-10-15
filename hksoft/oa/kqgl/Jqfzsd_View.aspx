<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jqfzsd_View.aspx.cs" Inherits="hkpro.oa.kqgl.Jqfzsd_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>假期分组设定</title>
    <link href="../../CssJs/Main.css" rel="stylesheet" type="text/css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>假期分组信息
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        分组年份：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="jqnf" runat="server" Width="90%" CssClass="mytext" onclick="SelectDate(this,'yyyy')"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>分组名称：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="jqmc" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>事假天数：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="shjts" runat="server" Width="90%" CssClass="mytext">0</asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>病假天数：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="bjts" runat="server" Width="90%" CssClass="mytext">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>包含人员：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="UserName" runat="server" Rows="8" TextMode="MultiLine" Width="90%"
                                            CssClass="mytextarea"></asp:TextBox>
                                        <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        分组说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jqsm" runat="server" Width="96%" CssClass="mytextarea" Rows="2"
                                            TextMode="multiLine"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"
                                Visible="false" />
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--隐藏label-->
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="jqnf"
        ErrorMessage="请选择分组年份">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jqmc"
        ErrorMessage="请输入假期名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="shjts"
        ErrorMessage="请输入事假天数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="bjts"
        ErrorMessage="请输入病假天数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName"
        ErrorMessage="请选择包含人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="shjts"
        Display="none" ErrorMessage="事假天数必须为大于或等于0的整数" ValidationExpression="^[0-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="bjts"
        Display="none" ErrorMessage="病假天数必须为大于或等于0的整数" ValidationExpression="^[0-9]{1}[\d]*$"
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
