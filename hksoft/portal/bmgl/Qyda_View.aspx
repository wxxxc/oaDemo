<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qyda_View.aspx.cs" Inherits="hkpro.portal.bmgl.Qyda_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>下属单位维护</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>下属单位信息
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>单位编码：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="gsbm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>单位名称：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="gsmc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>单位简称：
                        </td>
                        <td>
                            <asp:TextBox ID="gsjc" runat="server" CssClass="mytext" Width="90%" MaxLength="6"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            单位地址：
                        </td>
                        <td>
                            <asp:TextBox ID="gsdz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            邮政编码：
                        </td>
                        <td>
                            <asp:TextBox ID="yzbm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            邮箱：
                        </td>
                        <td>
                            <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            电话：
                        </td>
                        <td>
                            <asp:TextBox ID="gsdh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            传真：
                        </td>
                        <td>
                            <asp:TextBox ID="gscz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
<%--                    <tr>
                        <td class="form-item">
                            开户银行：
                        </td>
                        <td>
                            <asp:TextBox ID="khyh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            银行帐号：
                        </td>
                        <td>
                            <asp:TextBox ID="yhzh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="form-item">
                            备注：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"
                    Visible="false" />
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                <input type="button" name="CloseBtn" value="关闭" class="btn btn-warning" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gsbm"
        ErrorMessage="请输入单位编码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="gsmc"
        ErrorMessage="请输入单位名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gsjc"
        ErrorMessage="请输入单位简称">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
