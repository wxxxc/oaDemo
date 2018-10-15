<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qxdj_View.aspx.cs" Inherits="hkpro.oa.qxgl.Qxdj_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>去向牌登记</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>去向信息
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2" align="center">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>标题：
                        </td>
                        <td colspan="3" style="width: 80%">
                            <asp:TextBox ID="bt" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>预订时间：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="kssj" runat="server" CssClass="mytext" Width="140" MaxLength="10"
                                onclick="SelectDate(this,'yyyy-MM-dd hh:mm:00')"></asp:TextBox>
                            至
                            <asp:TextBox ID="jzsj" runat="server" CssClass="mytext" Width="140" MaxLength="10"
                                onclick="SelectDate(this,'yyyy-MM-dd hh:mm:00')"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>外出人：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="UserName" runat="server" CssClass="mytext" Width="92%"></asp:TextBox>
                            <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            联系方法：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="lxff" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>说明：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="sm" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text=" 保存 " OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="bt"
        ErrorMessage="请输入标题">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="kssj"
        ErrorMessage="请输入开始预订时间">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="jzsj"
        ErrorMessage="请输入截止预订时间">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserName"
        ErrorMessage="请选择外出人">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="sm"
        ErrorMessage="请输入说明">&nbsp;
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
