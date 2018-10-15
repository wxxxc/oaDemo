<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Khhf01_View.aspx.cs" Inherits="hkpro.oa.khgl.Khhf01_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>客户回访</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>客户回访
            </td>
            <td class="td_base" style="width: 20%">
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
                                        购买人：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="gmr" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        省份：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sf" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        城市：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cs" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        单位：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrdw" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        部室：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrbs" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        职务：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrzw" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        购买日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmrq" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        商品名称：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="spmc" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        购买数量：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="gmsl" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        Email：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="email" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        邮政地址：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yzdz" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        购买备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="gmbz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        使用人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syr" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syrdh" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        单位：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="syrdw" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        上级主管：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="sjzg" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        地址：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="syrdz" runat="server" CssClass="mytext" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        使用备注：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="sybz" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        30天内回访情况：
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="RBL1hfqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text=" 优 " Value="优"></asp:ListItem>
                                            <asp:ListItem Text=" 良 " Value="良"></asp:ListItem>
                                            <asp:ListItem Text=" 中 " Value="中"></asp:ListItem>
                                            <asp:ListItem Text=" 差 " Value="差"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        180天内回访情况：
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="RBL2hfqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text=" 优 " Value="优"></asp:ListItem>
                                            <asp:ListItem Text=" 良 " Value="良"></asp:ListItem>
                                            <asp:ListItem Text=" 中 " Value="中"></asp:ListItem>
                                            <asp:ListItem Text=" 差 " Value="差"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        300天内回访情况：
                                    </td>
                                    <td colspan="3">
                                        <asp:RadioButtonList ID="RBL3hfqk" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Text=" 优 " Value="优"></asp:ListItem>
                                            <asp:ListItem Text=" 良 " Value="良"></asp:ListItem>
                                            <asp:ListItem Text=" 中 " Value="中"></asp:ListItem>
                                            <asp:ListItem Text=" 差 " Value="差"></asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
