<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hyqc_Add.aspx.cs" Inherits="hkpro.oa.hygl.Hyqc_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>我的会议</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                起草会议通知
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>会议主题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="hyzt" runat="server" Width="96%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>会议类型：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="hylx" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>召开地点：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="zkdd" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        召开部门：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="dept" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        主持人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fzr" runat="server" CssClass="mytext" Width="80%" MaxLength="10"></asp:TextBox>&nbsp;<img
                                            src="../../images/choose.gif" onclick="openA('../../choose/portal/yhview.aspx?id=fzr')"
                                            alt="选择此次会议的主持人" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>会议开始时间：
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="100" MaxLength="10" AutoPostBack="true" OnTextChanged="txtSdate_TextChanged"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="sxs" runat="server" Width="60">
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
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                        <asp:ListItem Text="00分" Value="00:" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="05分" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="10分" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="15分" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="20分" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="25分" Value="25:"></asp:ListItem>
                                                        <asp:ListItem Text="30分" Value="30:"></asp:ListItem>
                                                        <asp:ListItem Text="35分" Value="35:"></asp:ListItem>
                                                        <asp:ListItem Text="40分" Value="40:"></asp:ListItem>
                                                        <asp:ListItem Text="45分" Value="45:"></asp:ListItem>
                                                        <asp:ListItem Text="50分" Value="50:"></asp:ListItem>
                                                        <asp:ListItem Text="55分" Value="55:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>会议结束时间：
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                        CssClass="mytext" Width="100" MaxLength="10"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="exs" runat="server" Width="60">
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
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="efz" runat="server" Width="60">
                                                        <asp:ListItem Text="00分" Value="00:" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="05分" Value="05:"></asp:ListItem>
                                                        <asp:ListItem Text="10分" Value="10:"></asp:ListItem>
                                                        <asp:ListItem Text="15分" Value="15:"></asp:ListItem>
                                                        <asp:ListItem Text="20分" Value="20:"></asp:ListItem>
                                                        <asp:ListItem Text="25分" Value="25:"></asp:ListItem>
                                                        <asp:ListItem Text="30分" Value="30:"></asp:ListItem>
                                                        <asp:ListItem Text="35分" Value="35:"></asp:ListItem>
                                                        <asp:ListItem Text="40分" Value="40:"></asp:ListItem>
                                                        <asp:ListItem Text="45分" Value="45:"></asp:ListItem>
                                                        <asp:ListItem Text="50分" Value="50:"></asp:ListItem>
                                                        <asp:ListItem Text="55分" Value="55:"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        出席范围：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cxfw" runat="server" CssClass="mytext" Width="96%" MaxLength="100"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        参加人员：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="UserName" runat="server" Rows="3" TextMode="MultiLine" Width="90%"
                                            CssClass="mytextarea"></asp:TextBox><font color="red">*</font>
                                        <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        简要说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jysm" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="height: 27">
                                        会议资料：
                                    </td>
                                    <td colspan="3">
                                        <input id="fj" runat="server" type="file" style="width: 96%;" class="mytext" />&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知会议室管理员" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知会议室管理员" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" />
                            <asp:Button CssClass="mybtn" ID="SendBtn" runat="server" Text="送审" CausesValidation="true"
                                OnClientClick="return confirm('确认要执行送审吗？')" OnClick="Send_Click" Visible="false">
                            </asp:Button>
                            <asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                CssClass="mybtn" />
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <!--隐藏label-->
    <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="hyzt"
        ErrorMessage="请输入会议主题">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="hylx"
        ErrorMessage="请选择会议类型">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="zkdd"
        ErrorMessage="请选择召开地点">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="UserID"
        ErrorMessage="请选择会议参加人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="请输入会议开始时间（日期）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="sxs"
        ErrorMessage="请选择会议开始时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="sfz"
        ErrorMessage="请选择会议开始时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="请输入会议结束时间（日期）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="exs"
        ErrorMessage="请选择会议结束时间（小时）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="efz"
        ErrorMessage="请选择会议结束时间（分钟）">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtSdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="会议开始时间格式错误，格式参考2008-01-01、2008/01/01"
        Type="date" runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtEdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="会议结束时间格式错误，格式参考2008-12-31、2008/12/31"
        Type="date" runat="server">
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="jysm"
        Display="none" ErrorMessage="简要说明不能超过50个字" ValidationExpression="^(\s|\S){0,50}$"
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
