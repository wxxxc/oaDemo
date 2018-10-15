<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dwml_Add.aspx.cs" Inherits="hkpro.portal.xzgl.Dwml_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>单位名录</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                新增单位名录
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
                                    <td class="form-item">
                                        <font color="red">*</font>单位名称：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="dwmc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>单位类型：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="dwlx" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>单位级别：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="dwjb" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        上级部门：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sjbm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        负责人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fzr" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>单位地址：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="dwdz" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
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
                                        单位电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dwdh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        传真号码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czhm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        电子邮件：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dzyj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        简单介绍：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jdjs" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="3"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="3"></asp:TextBox>
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
                                class="mybtn"></asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dwmc"
        ErrorMessage="请输入单位名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dwdz"
        ErrorMessage="请输入单位地址">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dwlx"
        ErrorMessage="请输入单位类型">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="dwjb"
        ErrorMessage="请输入单位级别">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
