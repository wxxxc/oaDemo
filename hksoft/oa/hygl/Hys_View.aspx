<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hys_View.aspx.cs" Inherits="hkpro.oa.hygl.Hys_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>会议室管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>会议室
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td style="width: 35%" class="form-item">
                            <font color="red">*</font>会议室名称：
                        </td>
                        <td style="width: 65%">
                            <asp:TextBox CssClass="mytext" ID="mc" runat="server" Width="300" MaxLength="25"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>管理人员：
                        </td>
                        <td>
                            <asp:DropDownList ID="glry" runat="server" Width="300">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            规模容量：
                        </td>
                        <td>
                            <asp:TextBox ID="gmrl" runat="server" CssClass="mytext" Width="300" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            联系电话：
                        </td>
                        <td>
                            <asp:TextBox ID="lxdh" runat="server" CssClass="mytext" Width="300" MaxLength="15"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            <asp:CheckBox ID="fwy" runat="server" Text="是否有服务人员" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            所属部门：
                        </td>
                        <td>
                            <asp:DropDownList ID="ssbm" runat="server" Width="300">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            简介：
                        </td>
                        <td>
                            <asp:TextBox ID="jj" runat="server" CssClass="mytextarea" Width="300" TextMode="multiLine"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button class="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"
                    Visible="false"></asp:Button>
                <asp:Button class="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button class="mybtn" ID="DelBtn" runat="server" Text="删除" OnClientClick="return confirm('确认要执行删除吗？')"
                    Visible="false" OnClick="Del_Click"></asp:Button>
                <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mc"
        ErrorMessage="请输入会议室名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="glry"
        ErrorMessage="请选择管理人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="gmrl"
        Display="none" ErrorMessage="规模容量必需为整数" ValidationExpression="^\d+$" runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="lxdh"
        Display="none" ErrorMessage="联系电话格式错误，参考格式010-62288888、62288888、010-62288888-815"
        ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}" runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
