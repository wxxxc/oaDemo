<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pfxm_r.aspx.cs" Inherits="hkpro.oa.jxkh.Pfxm_r" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>评分项目</title>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>

    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td style="height:30">
                    当前状态：<asp:Label ID="labelstatus" runat="server" Text="新增" Font-Size="Medium" ForeColor="Red"></asp:Label>
                </td>
                <td align="right">
                    <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click"
                        AccessKey="s"></asp:Button>
                    <asp:Button CssClass="btn btn-primary" ID="AddBtn" runat="server" Text="增 加" OnClick="Save_Click"
                        CausesValidation="false" AccessKey="a"></asp:Button>
                    <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                        OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button>&nbsp;
                </td>
            </tr>
        </tbody>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 20%" class="form-item">
                            项目名称<font color="red">*</font>：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="xmmc" runat="server" Width="90%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="form-item">
                            分值<font color="red">*</font>：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="fz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            上级项目：
                        </td>
                        <td>
                            <asp:DropDownList ID="upid" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            考评细则：
                        </td>
                        <td>
                            <asp:TextBox ID="kpxz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                 <%--   <tr>
                        <td class="form-item">
                            设置评分等级<font color="red">*</font>：</td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="pfdj" runat="server" RepeatDirection="Horizontal" 
                                RepeatLayout="Flow" AutoPostBack="true" 
                                onselectedindexchanged="pfdj_SelectedIndexChanged">
                                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                                <asp:ListItem Text="否" Value="否" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                            （优>=<asp:TextBox ID="pfdj_y" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>
                            >良>=<asp:TextBox ID="pfdj_l" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>
                            >中>=<asp:TextBox ID="pfdj_z" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>
                            差<=<asp:TextBox ID="pfdj_c" runat="server" CssClass="mytext" Width="60" Enabled="false">0</asp:TextBox>）
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="form-item">
                            备注：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="xmbz" runat="server" CssClass="mytextarea" Width="96%" TextMode="MultiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                  <%--  <tr>
                        <td class="form-item">
                            评委权限：</td>
                        <td colspan="3">
                            <asp:CheckBox ID="pw_zr" runat="server" Text="总经理评委" />
                            <asp:CheckBox ID="pw_fzr" runat="server" Text="副主管评委" />
                            <asp:CheckBox ID="pw_ybpw" runat="server" Text="一般评委" />
                            <asp:CheckBox ID="pw_gzry" runat="server" Text="工作人员评委" AutoPostBack="true" 
                                oncheckedchanged="pw_gzry_CheckedChanged" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="form-item">
                            排序号<font color="red">*</font>：
                        </td>
                        <td>
                            <asp:TextBox ID="pxh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                        <td class="form-item">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblxmid" runat="server" Visible="false"></asp:Label>
        
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="xmmc"
        ErrorMessage="请输入项目名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fz"
        ErrorMessage="请输入分值">&nbsp;
    </asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="fz"
        Display="none" ErrorMessage="分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>--%>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="fz"
        Display="none" ErrorMessage="分值必须为数值型" ValidationExpression="^(\-|\+?)\d+(\.\d+)?$"
        runat="server">
    </asp:RegularExpressionValidator>
    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pfdj_y"
        ErrorMessage="请输入评分等级-优分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="pfdj_y"
        Display="none" ErrorMessage="评分等级-优分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pfdj_l"
        ErrorMessage="请输入评分等级-良分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="pfdj_l"
        Display="none" ErrorMessage="评分等级-良分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="pfdj_z"
        ErrorMessage="请输入评分等级-中分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="pfdj_z"
        Display="none" ErrorMessage="评分等级-中分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="pfdj_c"
        ErrorMessage="请输入评分等级-差分值">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="pfdj_c"
        Display="none" ErrorMessage="评分等级-差分值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="pxh"
        ErrorMessage="请输入排序号">&nbsp;
    </asp:RequiredFieldValidator>
    <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="pxh"
        Display="none" ErrorMessage="排序号必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>--%>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="pxh"
        Display="none" ErrorMessage="排序号必须为正整数" ValidationExpression="\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
