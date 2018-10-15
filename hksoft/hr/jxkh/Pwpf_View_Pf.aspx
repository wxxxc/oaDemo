<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwpf_View_Pf.aspx.cs" Inherits="hkpro.oa.jxkh.Pwpf_View_Pf" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    
    <title>评委评分</title>
</head>
<body class="main">
    <form id="form1" runat="server" defaultbutton="SaveBtn">
    <table align="center" border="0" cellpadding="4" cellspacing="0" width="100%">
        <tr>
            <td align="right" width="25%" height="60">
                本次评分:
            </td>
            <td width="75%">
                <asp:TextBox ID="sjpf" runat="server" Width="90" CssClass="mytext"></asp:TextBox><font color="red">*</font>
                <asp:Button ID="SaveBtn" runat="server" Text="保存" CssClass="btn btn-success" OnClick="Save_Click" />
                <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sjpf"
        ErrorMessage="请输入本次评分">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="sjpf"
        Display="none" ErrorMessage="本次评分必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
