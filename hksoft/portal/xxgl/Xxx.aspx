<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xxx.aspx.cs" Inherits="hkpro.portal.xxgl.Xxx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>写消息</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 10px">
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                        align="center">
                                        <a href="sxx.aspx?i=2" class="black">收消息</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                        <a href="yfsxx.aspx" class="black">已发送消息</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_y.gif)" align="center">
                                        <a href="xxx.aspx" class="mail_top">写消息</a>
                                    </td>
                                    <td align="right">
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                            <table border="0" width="100%" cellpadding="0" cellspacing="0" class="form">
                                <tr style="height: 25px; width: 20%">
                                    <td class="form-item">
                                        <font color="red">*</font>接收人：
                                    </td>
                                    <td style="width: 80%">
                                        <asp:TextBox ID="UserName" runat="server" ReadOnly="true" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="90%"></asp:TextBox>&nbsp;<img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif"
                                                border="0" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>消息内容：<br />
                                        (最多100个汉字)
                                    </td>
                                    <td>
                                        <asp:TextBox ID="nr" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                            Rows="4"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px" align="center" colspan="2">
                            <asp:Button ID="button1" Text="发 送" runat="server" OnClick="Send_Click" CausesValidation="true"
                                CssClass="mybtn" />
                            <input type="button" name="RecBtn" value="返 回" onclick="javascript:location.href='sxx.aspx?i=2'"
                                class="mybtn" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="UserID"
        ErrorMessage="请选择接收人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="nr"
        Display="none" ErrorMessage="消息内容不能超过100个汉字" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nr"
        ErrorMessage="请输入消息内容">&nbsp;
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
