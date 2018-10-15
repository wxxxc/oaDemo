<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dept_Mod.aspx.cs" Inherits="hkpro.portal.bmgl.Dept_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>部门管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
        <tr>
            <td align="center" colspan="2" width="33%" style="height: 26px">
                <b>修改部门信息</b>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" width="20%" class="form-item">
                <font color="red">*</font>部门编码：
            </td>
            <td width="80%">
                <asp:TextBox ID="bm_bm" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                <font color="red">*</font>部门名称：
            </td>
            <td>
                <asp:TextBox ID="bm_mc" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                <font color="red">*</font>上级部门：
            </td>
            <td>
                <asp:DropDownList ID="bm_sjbm" runat="server" Width="90%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门负责人：
            </td>
            <td>
                <asp:TextBox ID="bm_fzr" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门电话：
            </td>
            <td>
                <asp:TextBox ID="bm_dh" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门传真：
            </td>
            <td>
                <asp:TextBox ID="bm_cz" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门类型：
            </td>
            <td>
                <asp:DropDownList ID="bm_lx" runat="server" Width="90%">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" nowrap="nowrap" class="form-item">
                部门管理权限：
            </td>
            <td class="mytd2">
                <asp:DropDownList ID="bmglqx" runat="server" Width="90%">
                    <asp:ListItem Text="不允许管理子部门数据" Value="N" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="允许管理子部门数据" Value="Y"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="right" valign="top" nowrap="nowrap" class="form-item">
                备注：
            </td>
            <td>
                <asp:TextBox ID="bm_bz" runat="server" Width="90%" Rows="3" TextMode="MultiLine"
                    CssClass="mytextarea"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td align="center" colspan="2" height="25" width="33%">
                <asp:Button ID="SaveBtn" runat="server" Text="保 存" CssClass="btn btn-success" OnClick="Save_Click" />
                <asp:Button ID="BackBtn" runat="server" Text="返 回" CssClass="btn btn-info" OnClick="Back_Click"
                    CausesValidation="false" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lbldParid" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="bm_bm"
        ErrorMessage="请输入部门编码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="bm_mc"
        ErrorMessage="请输入部门名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bm_sjbm"
        ErrorMessage="请选择上级部门">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
