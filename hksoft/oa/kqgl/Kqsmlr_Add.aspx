<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmlr_Add.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmlr_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>考勤说明录入</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script language="javascript" type="text/javascript">
        function PageCheck() {
            var strUploadFile = document.getElementById('uploadFile').value;
            if (strUploadFile == "") {
                alert("请选择要上传的附件！");
                return false;
            }

            var nlength = strUploadFile.length;
            var extName = strUploadFile.substr(nlength - 4, 4).toLowerCase();

            var sAllowExt = "<%=attKey%>";
            var str = document.getElementById('uploadFile').value;
            var extName = str.substr(str.lastIndexOf('.') + 1, str.length - str.lastIndexOf('.')).toLowerCase();

            if (sAllowExt.indexOf(extName) == -1) {
                alert('对不起，您只能上传【' + sAllowExt + '】格式的文件\r如果需要上传其他格式的文件，请联系系统管理员！');
                return false;
            }
            var content = document.frames("EDIT_HTML").document.forms("Members").elements("Search").value;
            document.getElementById("ContractContentupdate").value = content;
        }
    </script>
    <script type="text/javascript">
        function AttDown() {
            if (document.getElementById('fjlb').value == '') {
                alert('请先选中附件再下载！');
                return false;
            }
            else {
                var num = Math.random();
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cText = littleproduct.options[cindex].text;
                var cValue = littleproduct.options[cindex].value;
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=oa/kqsm", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
            }
        }

        function AttDel() {
            if (document.getElementById('fjlb').value == '') {
                alert('请先选中附件再删除');
                return false;
            }
            else {
                if (!confirm("您确定要删除此附件吗？"))
                    return false;

                var num = Math.random();
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cText = littleproduct.options[cindex].text;
                var cValue = littleproduct.options[cindex].value;
                window.open("../../AttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="height: 25px">
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"
                    CausesValidation="true"></asp:Button>
                <asp:Button CssClass="mybtn" ID="SendBtn" runat="server" Text="送审" OnClick="Send_Click"
                    CausesValidation="true" Visible="false"></asp:Button>
                <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />&nbsp;
            </td>
            <td class="td_base">
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top" align="center">
                <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>日期：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="qdsj" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item" style="height: 25; width: 20%">
                            &nbsp;
                        </td>
                        <td style="width: 30%">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            上午班：
                        </td>
                        <td>
                            <asp:CheckBox ID="ynqd1" runat="server" Text="签到" />
                            <asp:CheckBox ID="ynqt1" runat="server" Text="签退" />
                        </td>
                        <td class="form-item" style="height: 25;">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            下午班：
                        </td>
                        <td>
                            <asp:CheckBox ID="ynqd2" runat="server" Text="签到" />
                            <asp:CheckBox ID="ynqt2" runat="server" Text="签退" />
                        </td>
                        <td class="form-item" style="height: 25;">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            晚上班：
                        </td>
                        <td>
                            <asp:CheckBox ID="ynqd3" runat="server" Text="签到" />
                            <asp:CheckBox ID="ynqt3" runat="server" Text="签退" />
                        </td>
                        <td class="form-item" style="height: 25;">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>考勤情况说明：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="kqqksm" runat="server" CssClass="mytextarea" Width="96%" TextMode="MultiLine"
                                Rows="2"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" rowspan="2">
                            说明附件：
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                            </asp:DropDownList>
                            <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="下载附件" />
                            <asp:ImageButton ID="AttDelBtn" runat="server" ImageUrl="../../Images/del.gif" ToolTip="删除附件" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input id="uploadFile" runat="server" style="width: 85%" type="file" name="uploadFile"
                                class="mytext" />
                            <asp:ImageButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" ImageUrl="../../Images/up.gif"
                                ToolTip="上传附件" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <asp:Label ID="lcsm" runat="server" Text="点击查看帮助说明" Font-Underline="true" ForeColor="Blue"
                                Visible="false"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="jsr" CssClass="mytext" runat="server" ToolTip="选择考勤审批人员" Width="200px">
                            </asp:DropDownList>
                            <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知下一步审批人" Checked="true" />
                            <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知下一步审批人" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--隐藏label-->
    <asp:Label ID="IDlabel" runat="server" Visible="false" />
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="qdsj"
        ErrorMessage="请选择日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="kqqksm"
        ErrorMessage="请输入考勤情况说明">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="jsr"
        ErrorMessage="请选择下一步骤的审批人">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
