<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs_Mod.aspx.cs" Inherits="hkpro.oa.zsgl.wdzs_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>知识维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                修改知识
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>知识大类：
                        </td>
                        <td style="width: 80%">
                            <asp:DropDownList ID="BigName" runat="server" CssClass="mytext" Width="80%" OnSelectedIndexChanged="BigName_SelectedIndexChanged"
                                AutoPostBack="true">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>知识小类：
                        </td>
                        <td>
                            <asp:DropDownList ID="LittleName" runat="server" CssClass="mytext" Width="80%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>知识名称：
                        </td>
                        <td>
                            <asp:TextBox ID="TitleName" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            知识描述：
                        </td>
                        <td>
                            <asp:TextBox ID="Content" runat="server" CssClass="mytextarea" Width="80%" TextMode="MultiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            作者有话：
                        </td>
                        <td>
                            <asp:TextBox ID="AthourSay" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            知识关键字：
                        </td>
                        <td>
                            <asp:TextBox ID="KeyWord" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            阅读权限：
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server" Height="55px" TextMode="MultiLine" Width="80%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">&nbsp;<asp:Button
                                ID="allyh" runat="server" Text="全部用户" CssClass="mybtn" OnClick="allyh_Click"
                                CausesValidation="False" Style="width: 70" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存并关闭" OnClick="Save_Click"
                    Style="width: 80"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SANZJ" runat="server" Text="下一步管理章节" OnClick="SANZJ_Click"
                    CausesValidation="false" Style="width: 110"></asp:Button>
                <input type="button" name="BackBtn" value="直接关闭" class="mybtn" onclick="javascript:window.close()"
                    style="width: 80" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BigName"
        ErrorMessage="请选择大类名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="LittleName"
        ErrorMessage="请选择小类名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TitleName"
        ErrorMessage="请输入知识名称">&nbsp;
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
