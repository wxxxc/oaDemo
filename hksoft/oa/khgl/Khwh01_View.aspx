<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Khwh01_View.aspx.cs" Inherits="hkpro.oa.khgl.Khwh01_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>客户维护</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>客户记录
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
                                        <font color="red">*</font>购买人：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="gmr" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        省份：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sf" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        城市：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cs" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrdh" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>单位：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrdw" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        部室：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrbs" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        职务：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrzw" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>购买日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrq" runat="server" CssClass="mytext" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"
                                            MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>商品名称：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="spmc" runat="server" CssClass="mytext" Width="90%" MaxLength="25"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>购买数量：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmsl" runat="server" CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        Email：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="email" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        邮政地址：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yzdz" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        购买备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="gmbz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        使用人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syr" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syrdh" runat="server" CssClass="mytext" Width="90%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        单位：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syrdw" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        上级主管：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sjzg" runat="server" CssClass="mytext" Width="90%" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        地址：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="syrdz" runat="server" CssClass="mytext" Width="96%" MaxLength="15"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        使用备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="sybz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="Labelhfqk11" Text="30天内回访：" runat="server" Enabled="false"></asp:Label><asp:Label
                                            ID="Labelhfqk1" runat="server" Enabled="false"></asp:Label>&nbsp;<asp:Label ID="Labelhfr1"
                                                runat="server" Enabled="false"></asp:Label>&nbsp;<asp:Label ID="Labelhfsj1" runat="server"
                                                    Enabled="false"></asp:Label>&nbsp;<br />
                                        <asp:Label ID="Labelhfqk22" Text="180天内回访：" runat="server" Enabled="false"></asp:Label><asp:Label
                                            ID="Labelhfqk2" runat="server" Enabled="false"></asp:Label>&nbsp;<asp:Label ID="Labelhfr2"
                                                runat="server" Enabled="false"></asp:Label>&nbsp;<asp:Label ID="Labelhfsj2" runat="server"
                                                    Enabled="false"></asp:Label>&nbsp;<br />
                                        <asp:Label ID="Labelhfqk33" Text="300天内回访：" runat="server" Enabled="false"></asp:Label><asp:Label
                                            ID="Labelhfqk3" runat="server" Enabled="false"></asp:Label>&nbsp;<asp:Label ID="Labelhfr3"
                                                runat="server" Enabled="false"></asp:Label>&nbsp;<asp:Label ID="Labelhfsj3" runat="server"
                                                    Enabled="false"></asp:Label>
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
                            <asp:Button ID="btnqk" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false"
                                CssClass="mybtn"></asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="gmr"
        ErrorMessage="请输入购买人">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="gmrdw"
        ErrorMessage="请输入单位">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gmrq"
        ErrorMessage="请输入购买日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="spmc"
        ErrorMessage="请输入商品名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="gmsl"
        ErrorMessage="请输入购买数量">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="gmrq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="购买日期格式错误" Type="date" runat="server">
    </asp:CompareValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="gmsl"
        Display="none" ErrorMessage="购买数量必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
