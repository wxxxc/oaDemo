<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjsb_Add.aspx.cs" Inherits="hkpro.portal.rcgl.Wdjsb_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>我的记事本</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 40px" align="right" colspan="2">
                            <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知预约人员" />
                            <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知预约人员" />
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" />
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click" />
                            <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="清 空" OnClick="Clear_Click" />
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                                Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" />
                            <asp:Button CssClass="mybtn" ID="BackBtn" runat="server" Text="返 回" OnClick="Back_Click"
                                CausesValidation="false" />&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>主题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="zt" runat="server" Width="96%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        类型：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="lx" runat="server" Width="90%">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                            <asp:ListItem Text="任务" Value="任务"></asp:ListItem>
                                            <asp:ListItem Text="约会" Value="约会"></asp:ListItem>
                                            <asp:ListItem Text="来访" Value="来访"></asp:ListItem>
                                            <asp:ListItem Text="会议" Value="会议"></asp:ListItem>
                                            <asp:ListItem Text="电话" Value="电话"></asp:ListItem>
                                            <asp:ListItem Text="假期" Value="假期"></asp:ListItem>
                                            <asp:ListItem Text="外出" Value="外出"></asp:ListItem>
                                            <asp:ListItem Text="走访" Value="走访"></asp:ListItem>
                                            <asp:ListItem Text="出差" Value="出差"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        地点：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="dd" runat="server" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>开始时间：
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="srq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="sxs" runat="server" Width="60">
                                                        <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00点" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="01点" Value="01:"></asp:ListItem>
                                                        <asp:ListItem Text="02点" Value="02:"></asp:ListItem>
                                                        <asp:ListItem Text="03点" Value="03:"></asp:ListItem>
                                                        <asp:ListItem Text="04点" Value="04:"></asp:ListItem>
                                                        <asp:ListItem Text="05点" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="06点" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07点" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08点" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09点" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10点" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11点" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12点" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13点" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14点" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15点" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16点" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17点" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18点" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19点" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20点" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21点" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22点" Value="22:"></asp:ListItem>
                                                        <asp:ListItem Text="23点" Value="23:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                        <asp:ListItem Text="分钟" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00分" Value="00:00"></asp:ListItem>
                                                        <asp:ListItem Text="05分" Value="05:00"></asp:ListItem>
                                                        <asp:ListItem Text="10分" Value="10:00"></asp:ListItem>
                                                        <asp:ListItem Text="15分" Value="15:00"></asp:ListItem>
                                                        <asp:ListItem Text="20分" Value="20:00"></asp:ListItem>
                                                        <asp:ListItem Text="25分" Value="25:00"></asp:ListItem>
                                                        <asp:ListItem Text="30分" Value="30:00"></asp:ListItem>
                                                        <asp:ListItem Text="35分" Value="35:00"></asp:ListItem>
                                                        <asp:ListItem Text="40分" Value="40:00"></asp:ListItem>
                                                        <asp:ListItem Text="45分" Value="45:00"></asp:ListItem>
                                                        <asp:ListItem Text="50分" Value="50:00"></asp:ListItem>
                                                        <asp:ListItem Text="55分" Value="55:00"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>结束时间：
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="erq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="exs" runat="server" Width="60">
                                                        <asp:ListItem Text="小时" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00点" Value="00:"></asp:ListItem>
                                                        <asp:ListItem Text="01点" Value="01:"></asp:ListItem>
                                                        <asp:ListItem Text="02点" Value="02:"></asp:ListItem>
                                                        <asp:ListItem Text="03点" Value="03:"></asp:ListItem>
                                                        <asp:ListItem Text="04点" Value="04:"></asp:ListItem>
                                                        <asp:ListItem Text="05点" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="06点" Value="06:"></asp:ListItem>
                                                        <asp:ListItem Text="07点" Value="07:"></asp:ListItem>
                                                        <asp:ListItem Text="08点" Value="08:"></asp:ListItem>
                                                        <asp:ListItem Text="09点" Value="09:"></asp:ListItem>
                                                        <asp:ListItem Text="10点" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="11点" Value="11:"></asp:ListItem>
                                                        <asp:ListItem Text="12点" Value="12:"></asp:ListItem>
                                                        <asp:ListItem Text="13点" Value="13:"></asp:ListItem>
                                                        <asp:ListItem Text="14点" Value="14:"></asp:ListItem>
                                                        <asp:ListItem Text="15点" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="16点" Value="16:"></asp:ListItem>
                                                        <asp:ListItem Text="17点" Value="17:"></asp:ListItem>
                                                        <asp:ListItem Text="18点" Value="18:"></asp:ListItem>
                                                        <asp:ListItem Text="19点" Value="19:"></asp:ListItem>
                                                        <asp:ListItem Text="20点" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="21点" Value="21:"></asp:ListItem>
                                                        <asp:ListItem Text="22点" Value="22:"></asp:ListItem>
                                                        <asp:ListItem Text="23点" Value="23:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="efz" runat="server" Width="60">
                                                        <asp:ListItem Text="分钟" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00分" Value="00:00"></asp:ListItem>
                                                        <asp:ListItem Text="05分" Value="05:00"></asp:ListItem>
                                                        <asp:ListItem Text="10分" Value="10:00"></asp:ListItem>
                                                        <asp:ListItem Text="15分" Value="15:00"></asp:ListItem>
                                                        <asp:ListItem Text="20分" Value="20:00"></asp:ListItem>
                                                        <asp:ListItem Text="25分" Value="25:00"></asp:ListItem>
                                                        <asp:ListItem Text="30分" Value="30:00"></asp:ListItem>
                                                        <asp:ListItem Text="35分" Value="35:00"></asp:ListItem>
                                                        <asp:ListItem Text="40分" Value="40:00"></asp:ListItem>
                                                        <asp:ListItem Text="45分" Value="45:00"></asp:ListItem>
                                                        <asp:ListItem Text="50分" Value="50:00"></asp:ListItem>
                                                        <asp:ListItem Text="55分" Value="55:00"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:CheckBox ID="tx" runat="server" Text="提醒：" AutoPostBack="true" OnCheckedChanged="tx_CheckedChanged" />提前<asp:TextBox
                                                        ID="txts" runat="server" CssClass="mytext" Width="25" />天提示我
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        内容：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:CheckBox ID="srxz" runat="server" Text="私人性质" />
                                                </td>
                                                <td style="width: 115">
                                                    重复周期：<asp:CheckBox ID="cf" runat="server" Text="重复" AutoPostBack="true" OnCheckedChanged="cf_CheckedChanged" />
                                                </td>
                                                <td style="width: 62">
                                                    <asp:DropDownList ID="cfzq" runat="server" Width="60">
                                                        <asp:ListItem Text="每日" Value="0"></asp:ListItem>
                                                        <asp:ListItem Text="每周" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="每月" Value="2"></asp:ListItem>
                                                        <asp:ListItem Text="每年" Value="3"></asp:ListItem>
                                                        <asp:ListItem Text="隔周" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="隔月" Value="5"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    至
                                                    <asp:TextBox ID="jzrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                        Width="80" MaxLength="10"></asp:TextBox>
                                                    日期前
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        预约人员：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="UserName" runat="server" ReadOnly="true" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="96%"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../images/choose.gif"
                                                border="0" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="jdr_label" runat="server" Enabled="false" Text="创建人："></asp:Label>
                                        <asp:Label ID="cjr" runat="server" Enabled="false"></asp:Label>&nbsp;&nbsp;&nbsp;
                                        <asp:Label ID="xgr_label" runat="server" Enabled="false" Text="创建日期："></asp:Label>
                                        <asp:Label ID="cjrq" runat="server" Enabled="false"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zt"
        ErrorMessage="请输入事件主题">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="srq"
        ErrorMessage="请输入开始日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sxs"
        ErrorMessage="请选择开始时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sfz"
        ErrorMessage="请选择开始时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="erq"
        ErrorMessage="请输入结束日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="exs"
        ErrorMessage="请选择结束时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="efz"
        ErrorMessage="请选择结束时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="srq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="开始日期格式错误，格式参考2008-01-01、2008/01/01" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="erq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="结束日期格式错误，格式参考2008-12-31、2008/12/31" Type="date"
        runat="server">
    </asp:CompareValidator>
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
