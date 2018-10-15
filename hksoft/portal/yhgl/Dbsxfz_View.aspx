<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dbsxfz_View.aspx.cs" Inherits="hkpro.portal.yhgl.Dbsxfz_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>待办事项分组</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>分组信息
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
                            <font color="red">*</font>分组名称：
                        </td>
                        <td style="width: 80%">
                            <asp:TextBox ID="gname" runat="server" CssClass="mytext" Width="70%" MaxLength="30"></asp:TextBox>
                            <asp:RadioButtonList ID="lx" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                Visible="false">
                                <asp:ListItem Text="企业分组" Value="企业" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="供应商分组" Value="供应商"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            分组说明：
                        </td>
                        <td>
                            <asp:TextBox ID="gdesc" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="gname"
        ErrorMessage="请输入分组名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="gdesc"
        Display="none" ErrorMessage="说明不能超过100个字" ValidationExpression="^(\s|\S){0,100}$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
