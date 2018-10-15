<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdmp_Add.aspx.cs" Inherits="hkpro.oa.mpgl.Wdmp_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>我的名片夹</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                新增名片
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>姓名：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="xm" runat="server" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>职务：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="zw" runat="server" CssClass="mytext" Width="75%" MaxLength="10"></asp:TextBox>&nbsp;<img
                                            alt="选择系统提供的职务名称" src="../../images/choose.gif" onclick="openA('../../choose/portal/zwview.aspx?id=zw')" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        公司名称：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gsmc" runat="server" CssClass="mytext" Width="90%" MaxLength="25"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        性质：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xz" CssClass="mytext" Width="90%" runat="server">
                                            <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="私营企业" Value="私营企业"></asp:ListItem>
                                            <asp:ListItem Text="国有企业" Value="国有企业"></asp:ListItem>
                                            <asp:ListItem Text="外资企业" Value="外资企业"></asp:ListItem>
                                            <asp:ListItem Text="合资企业" Value="合资企业"></asp:ListItem>
                                            <asp:ListItem Text="其它" Value="其它"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>公司电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gsdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        传真电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        行业类别：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="hylb" runat="server" CssClass="mytext" Width="75%" MaxLength="10"></asp:TextBox>&nbsp;<img
                                            alt="选择系统提供的行业类别" src="../../images/choose.gif" onclick="openA('../../choose/oa/hylbview.aspx')" />
                                    </td>
                                    <td class="form-item">
                                        邮政编码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yzbm" runat="server" CssClass="mytext" Width="90%" MaxLength="6"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        公司地址：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="gsdz" runat="server" CssClass="mytext" Width="96%" MaxLength="50" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        工作邮箱：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="w_mail" runat="server" CssClass="mytext" Width="90%" MaxLength="30" />
                                    </td>
                                    <td class="form-item">
                                        移动电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="90%" MaxLength="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <hr class="hr1" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        公司网址：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gswz" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        部门名称：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bmmc" runat="server" CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        住宅电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zzdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        个人邮箱：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="h_mail" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        QQ号码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="qq" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        MSN号码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="msn" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="2">
                                        <asp:RadioButtonList ID="mplx" runat="server" CssClass="mytext" Width="90%" RepeatDirection="horizontal"
                                            RepeatLayout="Flow">
                                            <asp:ListItem Text="私人名片" Value="私人名片" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="共享名片" Value="共享名片"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                            </asp:Button>
                            <asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                class="mybtn" />
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ControlToValidate="xm"
        ErrorMessage="请输入姓名">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zw"
        ErrorMessage="请输入职务">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ControlToValidate="gsdh"
        ErrorMessage="请输入公司电话">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="yzbm"
        Display="none" ErrorMessage="邮政编码必需为6位数字" ValidationExpression="\d{6}" runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
