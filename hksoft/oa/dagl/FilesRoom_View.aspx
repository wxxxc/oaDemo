<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesRoom_View.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesRoom_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>卷库管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>卷库信息
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
                            <font color="red">*</font>卷库号：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="Number" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>卷库名称：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>所属部门：
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="UnitName" runat="server" Width="96%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            使用范围：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="wfDept" runat="server" TextMode="MultiLine" Rows="5" Width="92%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="choosedept()" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            备注：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="Remark" runat="server" Width="96%" Height="78px" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="wfDeptIDs" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Number"
        ErrorMessage="请输入卷库号">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name"
        ErrorMessage="请输入卷库名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UnitName"
        ErrorMessage="请输入所属部门">&nbsp;
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
