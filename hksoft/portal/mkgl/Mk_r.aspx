<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mk_r.aspx.cs" Inherits="hkpro.portal.mkgl.Mk_r" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>模块信息</title>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td style="height: 30">
                当前状态：<asp:Label ID="labelstatus" runat="server" Text="修改" Font-Size="Medium" ForeColor="Red"></asp:Label>
            </td>
            <td align="right">
                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click" Enabled="false">
                </asp:Button>
                <asp:Button CssClass="btn btn-primary" ID="AddBtn" runat="server" Text="增 加" OnClick="Save_Click"
                    CausesValidation="false"></asp:Button>
                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                    OnClientClick="return confirm('确认要执行删除吗？')" Enabled="false"></asp:Button>&nbsp;
            </td>
        </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>模块类型：
                        </td>
                        <td colspan="3">
                            <asp:DropDownList ID="modu_lx" runat="server" Width="96%" AutoPostBack="true" OnSelectedIndexChanged="modu_lx_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>模块编码：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox CssClass="mytext" ID="moduid" runat="server" Width="90%" Enabled="false"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="form-item">
                            <font color="red">*</font>模块名称：
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="modumc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            上级模块：
                        </td>
                        <td>
                            <asp:DropDownList ID="moduupid" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>文件路径：
                        </td>
                        <td>
                            <asp:TextBox ID="moduwjlj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            模块性质：
                        </td>
                        <td>
                            <asp:DropDownList ID="modu_xz" runat="server" Width="90%" ToolTip="如果用于链接RS报表请选择报表模块">
                                <asp:ListItem Value="标准模块" Text="标准模块" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="报表模块" Text="报表模块"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="form-item">
                            <font color="red">*</font>图标路径：
                        </td>
                        <td>
                            <asp:TextBox ID="modu_icon" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            功能描述：
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="modubz" runat="server" CssClass="mytextarea" Width="96%" TextMode="MultiLine"
                                Rows="3"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            查看权限：
                        </td>
                        <td>
                            <asp:CheckBox ID="cbcorp" runat="server" Text="公司" ToolTip="即可以查看全部数据" />
                            <asp:CheckBox ID="cbdept" runat="server" Text="部门" ToolTip="即可以查看本部门或子部门的数据" />
                            <asp:CheckBox ID="cbindi" runat="server" Text="个人" ToolTip="即只能查看个人的数据" />
                        </td>
                        <td class="form-item">
                            模块状态：
                        </td>
                        <td>
                            <asp:RadioButtonList ID="rbzt" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Value="启用" Text="启用" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="禁用" Text="禁用"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            操作权限：
                        </td>
                        <td colspan="3">
                            <asp:RadioButtonList ID="yn_oper" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow"
                                AutoPostBack="true" OnSelectedIndexChanged="yn_oper_SelectedIndexChanged">
                                <asp:ListItem Text="控制" Value="是"></asp:ListItem>
                                <asp:ListItem Text="不控制" Value="否" Selected="True"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <asp:Panel ID="p_oper" runat="server" Visible="false">
                        <tr>
                            <td class="form-item">
                                &nbsp;
                            </td>
                            <td colspan="3">
                                <asp:CheckBox ID="cbfull" runat="server" Text="全部" AutoPostBack="true" OnCheckedChanged="cbfull_CheckedChanged"
                                    ToolTip="即不必控制单个操作权限" />
                                <asp:CheckBox ID="cbadd" runat="server" Text="新增" />
                                <asp:CheckBox ID="cbmod" runat="server" Text="修改" />
                                <asp:CheckBox ID="cbdel" runat="server" Text="删除" />
                                <asp:CheckBox ID="cbexp" runat="server" Text="导出" />
                                <asp:CheckBox ID="cbaud" runat="server" Text="审批" ToolTip="包括发布、暂停、禁用、启用等操作" />
                                <asp:CheckBox ID="cbexe" runat="server" Text="执行" ToolTip="包括初始化、设置、清空等操作" />
                                <asp:CheckBox ID="cbque" runat="server" Text="查看" />
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="modu_lx"
        ErrorMessage="请选择模块类型">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="moduid"
        ErrorMessage="请输入模块编码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="模块编码必须是1至100000之间的正整数！"
        ControlToValidate="moduid" MinimumValue="1" MaximumValue="100000" Type="integer">&nbsp;
    </asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="modumc"
        ErrorMessage="请输入模块名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="moduwjlj"
        ErrorMessage="请输入文件路径，如暂无可输入#符号">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="modu_icon"
        ErrorMessage="请输入图标路径">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="moduid" Operator="notequal"
        Type="String" ControlToCompare="moduupid" ErrorMessage="上级模块不能选择本模块！">&nbsp;</asp:CompareValidator>
    </form>
</body>
</html>
