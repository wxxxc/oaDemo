<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryWork_Evalua.aspx.cs"
    Inherits="hkpro.workflow.work.QueryWork_Evalua" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
    function _change() {
        var text = form1.dp_appcomm.value;
        if (text != "请选择") {
            document.getElementById('txt_AppComm').value = "";
            document.getElementById('txt_AppComm').value = text;
        }
    }
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作追加审批</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="3" width="100%">
        <tr>
            <td colspan="2" height="30">
            </td>
        </tr>
        <tr>
            <td align="right" width="25%">
                常用审批备注：
            </td>
            <td width="75%">
                <asp:DropDownList ID="dp_appcomm" runat="server" onchange="_change()" Width="80%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right">
                审批意见：
            </td>
            <td>
                <asp:TextBox ID="txt_AppComm" runat="server" Height="55px" TextMode="MultiLine" Width="80%"
                    CssClass="mytextarea"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right">
                审批附件：
            </td>
            <td>
                <input id="uploadFile" runat="server" name="uploadFile" style="width: 80%" type="file"
                    class="mytext" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 保存 " CssClass="mybtn" OnClick="SaveBtn_Click" />
                <input type="button" name="BackBtn" value=" 关闭 " class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
