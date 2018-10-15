<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_r_show.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_r_show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>员工通讯录</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table class="form" border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center" colspan="4">
                                <b>基本信息</b>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">所属部门：
                            </td>
                            <td style="width: 30%">
                                <asp:Label ID="Folder" runat="server"></asp:Label>
                            </td>
                            <td class="form-item" style="width: 20%">排序号：
                            </td>
                            <td style="width: 30%">
                                <asp:Label ID="PxNum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">姓名：
                            </td>
                            <td>
                                <asp:Label ID="Name" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">工号：
                            </td>
                            <td>
                                <asp:Label ID="Worknum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">职位：
                            </td>
                            <td>
                                <asp:Label ID="Post" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">性别：
                            </td>
                            <td>
                                <asp:Label ID="Sex" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">生日：
                            </td>
                            <td>
                                <script>SetNeed('BothDay')</script>
                                <asp:Label ID="BothDay" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">办公电话：
                            </td>
                            <td>
                                <asp:Label ID="Officetel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">传真：
                            </td>
                            <td>
                                <asp:Label ID="Fax" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">手机：
                            </td>
                            <td>
                                <asp:Label ID="MoveTel" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">住宅电话：
                            </td>
                            <td>
                                <asp:Label ID="HomeTel" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">E-mail ：
                            </td>
                            <td>
                                <asp:Label ID="Email" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">QQ号：
                            </td>
                            <td>
                                <asp:Label ID="QQNum" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">MSN：
                            </td>
                            <td>
                                <asp:Label ID="MsnNum" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">内部即时通：
                            </td>
                            <td>
                                <asp:Label ID="NbNum" runat="server"></asp:Label>
                            </td>
                            <td class="form-item">邮政编码：
                            </td>
                            <td>
                                <asp:Label ID="ZipCode" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">通信地址：
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Address" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">备注信息：
                            </td>
                            <td colspan="3">
                                <asp:Label ID="Remark" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <asp:Button ID="Button2" runat="server" Text="返回" CssClass="mybtn" OnClick="Button2_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
        <asp:Label ID="Unit" runat="server" Width="18%" Visible="False"></asp:Label>
        <asp:Label ID="FoldersID" runat="server" Visible="False" Width="18%"></asp:Label>
        <asp:Label ID="Respon" runat="server" Width="90%" Visible="False"></asp:Label>
    </form>
</body>
</html>
