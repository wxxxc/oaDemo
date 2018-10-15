<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManage_Add.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManage_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>案卷管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                新增案卷信息
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item" nowrap="nowrap">
                            <font color="red">*</font>案卷编号：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="Number" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap" width="20%">
                            <font color="red">*</font>案卷名称：
                        </td>
                        <td width="30%">
                            <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            <font color="red">*</font>所属卷库：
                        </td>
                        <td>
                            <asp:DropDownList ID="RoomName" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            归卷年代：
                        </td>
                        <td>
                            <asp:TextBox ID="BackYear" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            起始日期：
                        </td>
                        <td>
                            <asp:TextBox ID="Starttime" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"
                                CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            终止日期：
                        </td>
                        <td>
                            <asp:TextBox ID="Endtime" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"
                                CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            所属部门：
                        </td>
                        <td>
                            <asp:DropDownList ID="UnitName" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            编制机构：
                        </td>
                        <td>
                            <asp:TextBox ID="BzPost" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            保管期限：
                        </td>
                        <td>
                            <asp:TextBox ID="BgTime" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            案卷密级：
                        </td>
                        <td>
                            <asp:DropDownList ID="DengJi" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            全 宗 号：
                        </td>
                        <td>
                            <asp:TextBox ID="QuanZong" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            目 录 号：
                        </td>
                        <td>
                            <asp:TextBox ID="Mulu" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            档案馆号：
                        </td>
                        <td>
                            <asp:TextBox ID="DaGuan" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            保险箱号：
                        </td>
                        <td>
                            <asp:TextBox ID="BaoXian" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            缩 微 号：
                        </td>
                        <td>
                            <asp:TextBox ID="SuoWei" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            凭证类别：
                        </td>
                        <td>
                            <asp:DropDownList ID="PinZheng" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            凭证编号(起)：
                        </td>
                        <td>
                            <asp:TextBox ID="PzStartNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            凭证编号(止)：
                        </td>
                        <td>
                            <asp:TextBox ID="PzEndNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            页 数：
                        </td>
                        <td>
                            <asp:TextBox ID="YeShu" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td class="form-item" nowrap="nowrap">
                            状态：
                        </td>
                        <td>
                            <asp:DropDownList ID="State" runat="server" Width="90%">
                                <asp:ListItem>未封卷</asp:ListItem>
                                <asp:ListItem>已封卷</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            备注：
                        </td>
                        <td colspan="3" height="24">
                            <asp:TextBox ID="Remark" runat="server" Width="96%" Height="64px" TextMode="MultiLine"
                                CssClass="mytextarea"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" nowrap="nowrap">
                            使用范围：
                        </td>
                        <td width="85%" colspan="3">
                            <asp:TextBox ID="wfDept" runat="server" TextMode="MultiLine" Rows="5" Width="92%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="choosedept()" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="wfDeptIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Number"
        ErrorMessage="请输入案卷编号">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
        ErrorMessage="请输入案卷名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RoomName"
        ErrorMessage="请选择所属卷库">&nbsp;
    </asp:RequiredFieldValidator>
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
                dIdName = window.showModalDialog("../../Choose/portal/ChooseDept.aspx?tmp=" + num + "&rqstr=" + str + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=yes;help:no");
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
    </script>
    </form>
</body>
</html>
