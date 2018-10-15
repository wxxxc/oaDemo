<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dbsxfz_Yh.aspx.cs" Inherits="hkpro.portal.yhgl.Dbsxfz_Yh" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>待办事项授权</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table cellspacing="0" cellpadding="0" width="98%" border="0">
                    <tr>
                        <td style="height: 40px">
                            分配『<asp:Label ID="labTitle" runat="server"></asp:Label>』分组的待办事项
                        </td>
                        <td align="right">
                            <input type="button" class="mybtn" name="BackBtn" value="确定返回" onclick="javascript:location.href='Dbsxfz.aspx'" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%">
                                <tr>
                                    <td style="width: 50%" align="center" valign="top">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 400px;">
                                            <tr>
                                                <td style="width: 40%">
                                                    <asp:Label ID="Label1" runat="server">1.按角色绑定-待选角色：</asp:Label>
                                                </td>
                                                <td style="width: 20%">
                                                </td>
                                                <td style="width: 40%">
                                                    <asp:Label ID="Label2" runat="server">已选角色：</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ListBox ID="lstAllRole" runat="server" Width="165px" Height="140px" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                </td>
                                                <td align="center">
                                                    <asp:Button ID="cmdAdd" runat="server" Height="24px" Width="26px" CssClass="pagebtn"
                                                        Text=">>" OnClick="cmdAdd_Click"></asp:Button><br>
                                                    <br>
                                                    <asp:Button ID="cmdDelete" runat="server" Height="24px" Width="26px" CssClass="pagebtn"
                                                        Text="<<" OnClick="cmdDelete_Click"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:ListBox ID="lstCurRole" runat="server" Width="159px" Height="140px" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server">2.按职位绑定-待选职位：</asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server">已选职位：</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ListBox ID="lstAllPosition" runat="server" Height="140px" Width="167px" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                </td>
                                                <td align="center">
                                                    <p>
                                                        <asp:Button ID="cmdAddPositon" runat="server" Height="24" Width="26" CssClass="pagebtn"
                                                            Text=">>" OnClick="cmdAddPositon_Click"></asp:Button></p>
                                                    <p>
                                                        <asp:Button ID="cmdDeletePosition" runat="server" Height="24" Width="26" CssClass="pagebtn"
                                                            Text="<<" OnClick="cmdDeletePosition_Click"></asp:Button></p>
                                                </td>
                                                <td>
                                                    <asp:ListBox ID="lstCurPosition" runat="server" Height="140px" Width="159px" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label7" runat="server">3.按人员绑定-待选用户：</asp:Label>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label6" runat="server">已选用户：</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:ListBox ID="lstAllStaff" runat="server" Height="140px" Width="168px" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                </td>
                                                <td align="center">
                                                    <asp:Button ID="cmdAddStaff" runat="server" Height="24" Width="26" CssClass="pagebtn"
                                                        Text=">>" OnClick="cmdAddStaff_Click"></asp:Button></P>
                                                    <asp:Button ID="cmdDeleteStaff" runat="server" Height="24" Width="26" CssClass="pagebtn"
                                                        Text="<<" OnClick="cmdDeleteStaff_Click"></asp:Button>
                                                </td>
                                                <td>
                                                    <asp:ListBox ID="lstCurStaff" runat="server" Width="159px" Height="140px" SelectionMode="Multiple">
                                                    </asp:ListBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 50%" align="center" valign="top">
                                        已选中的全部人员：<br />
                                        <asp:ListBox ID="lstAllMember" runat="server" Width="300px" Height="350px"></asp:ListBox>
                                        <br />
                                        <font color="red">提示:可用左则三种方法中一种或多种进行授权</font>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbltid" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
