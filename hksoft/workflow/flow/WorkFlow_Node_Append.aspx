<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node_Append.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node_Append" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作流管理 - 追加节点步骤</title>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td class="form-item" width="20%">
                            <font color="red">*</font>步骤序号：
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="NodeNum" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>步骤名称：
                        </td>
                        <td>
                            <asp:TextBox ID="NodeName" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            步骤位置：
                        </td>
                        <td>
                            <asp:DropDownList ID="NodeSite" runat="server" Width="90%">
                                <asp:ListItem>开始</asp:ListItem>
                                <asp:ListItem>中间段</asp:ListItem>
                                <asp:ListItem>结束</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            下一步骤：
                        </td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" style="width: 190px" valign="top">
                                        <strong>待选步骤</strong>
                                    </td>
                                    <td align="center" style="width: 60px" valign="top">
                                    </td>
                                    <td align="center" style="width: 190px" valign="top">
                                        <strong>已选步骤</strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:ListBox ID="SourceListBox" runat="server" Height="190px" Width="180px"></asp:ListBox>
                                    </td>
                                    <td align="center">
                                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text=">" Width="60px"
                                            CausesValidation="false" /><br />
                                        <br />
                                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text=">>" Width="60px"
                                            CausesValidation="false" />
                                        <br />
                                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="<" Width="60px"
                                            CausesValidation="false" /><br />
                                        <br />
                                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="<<" Width="60px"
                                            CausesValidation="false" />
                                    </td>
                                    <td align="center">
                                        <asp:ListBox ID="TargetListBox" runat="server" Height="190px" Width="180px"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            审批模式：
                        </td>
                        <td>
                            <asp:DropDownList ID="ReviewMode" runat="server" Width="90%">
                                <asp:ListItem>仅一人通过审批即可向下流转</asp:ListItem>
                                <asp:ListItem>必须全部人员通过审批才能向下流转</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            审批人员选择：
                        </td>
                        <td>
                            <asp:DropDownList ID="SelectMode" runat="server" Width="90%">
                                <asp:ListItem>审批时由当前用户从指定人员中选择</asp:ListItem>
                                <asp:ListItem>审批时由当前用户指定人员</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            如果当前节点在
                            <asp:TextBox ID="TimeLimit" runat="server" Width="28px" CssClass="mytext"></asp:TextBox>
                            小时仍未审批，则自动结束<font color="red">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            允许编辑附件：
                        </td>
                        <td>
                            <asp:DropDownList ID="ynEditAtt" runat="server" Width="90%">
                                <asp:ListItem>是</asp:ListItem>
                                <asp:ListItem>否</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            允许删除附件：
                        </td>
                        <td height="17" colspan="3" width="85%">
                            <asp:DropDownList ID="ynDelAtt" runat="server" Width="90%">
                                <asp:ListItem>是</asp:ListItem>
                                <asp:ListItem>否</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="CloseBtn" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value=" 关闭 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="lblfid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfno" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfname" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfno" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblwfname" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfnum" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblNodeNo" runat="server" Visible="False"></asp:TextBox>
    <asp:DropDownList ID="ynEndAudi" runat="server" Visible="False">
        <asp:ListItem>是</asp:ListItem>
        <asp:ListItem>否</asp:ListItem>
    </asp:DropDownList>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="NodeNum"
        ErrorMessage="请输入步骤序号">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NodeName"
        ErrorMessage="请输入步骤名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TimeLimit"
        ErrorMessage="请输入结束时间设置">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="NodeNum"
        Display="none" ErrorMessage="步骤序号必须为正整数" ValidationExpression="^[0-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="TimeLimit"
        Display="none" ErrorMessage="结束时间设置必须为正整数" ValidationExpression="^[0-9]{1}[\d]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
