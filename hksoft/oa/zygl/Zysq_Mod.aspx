<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zysq_Mod.aspx.cs" Inherits="hkpro.oa.zygl.Zysq_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�ҵ�����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript">
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �鿴��Դ����
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
                                        ��Դ���ࣺ
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="zyfl" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        ������Դ��
                                    </td>
                                    <td style="width: 30%">
                                        <asp:DropDownList ID="sqzy" runat="server" Width="90%" CssClass="mytext">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ʹ��ʱ�䣺
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtSdate" runat="server" CssClass="mytext" Width="100" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="sxs" runat="server" Width="60">
                                                        <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="06��" Value="06"></asp:ListItem>
                                                        <asp:ListItem Text="07��" Value="07"></asp:ListItem>
                                                        <asp:ListItem Text="08��" Value="08"></asp:ListItem>
                                                        <asp:ListItem Text="09��" Value="09"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="11��" Value="11"></asp:ListItem>
                                                        <asp:ListItem Text="12��" Value="12"></asp:ListItem>
                                                        <asp:ListItem Text="13��" Value="13"></asp:ListItem>
                                                        <asp:ListItem Text="14��" Value="14"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                        <asp:ListItem Text="16��" Value="16"></asp:ListItem>
                                                        <asp:ListItem Text="17��" Value="17"></asp:ListItem>
                                                        <asp:ListItem Text="18��" Value="18"></asp:ListItem>
                                                        <asp:ListItem Text="19��" Value="19"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="21��" Value="21"></asp:ListItem>
                                                        <asp:ListItem Text="22��" Value="22"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                        <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="25��" Value="25"></asp:ListItem>
                                                        <asp:ListItem Text="30��" Value="30"></asp:ListItem>
                                                        <asp:ListItem Text="35��" Value="35"></asp:ListItem>
                                                        <asp:ListItem Text="40��" Value="40"></asp:ListItem>
                                                        <asp:ListItem Text="45��" Value="45"></asp:ListItem>
                                                        <asp:ListItem Text="50��" Value="50"></asp:ListItem>
                                                        <asp:ListItem Text="55��" Value="55"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �黹ʱ�䣺
                                    </td>
                                    <td colspan="3">
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="width: 108px">
                                                    <asp:TextBox ID="txtEdate" runat="server" CssClass="mytext" Width="100" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td style="width: 70">
                                                    <asp:DropDownList ID="exs" runat="server" Width="60">
                                                        <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="06��" Value="06"></asp:ListItem>
                                                        <asp:ListItem Text="07��" Value="07"></asp:ListItem>
                                                        <asp:ListItem Text="08��" Value="08"></asp:ListItem>
                                                        <asp:ListItem Text="09��" Value="09"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="11��" Value="11"></asp:ListItem>
                                                        <asp:ListItem Text="12��" Value="12"></asp:ListItem>
                                                        <asp:ListItem Text="13��" Value="13"></asp:ListItem>
                                                        <asp:ListItem Text="14��" Value="14"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                        <asp:ListItem Text="16��" Value="16"></asp:ListItem>
                                                        <asp:ListItem Text="17��" Value="17"></asp:ListItem>
                                                        <asp:ListItem Text="18��" Value="18"></asp:ListItem>
                                                        <asp:ListItem Text="19��" Value="19"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="21��" Value="21"></asp:ListItem>
                                                        <asp:ListItem Text="22��" Value="22"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="efz" runat="server" Width="60">
                                                        <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="00��" Value="00"></asp:ListItem>
                                                        <asp:ListItem Text="05��" Value="05"></asp:ListItem>
                                                        <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                        <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                        <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                        <asp:ListItem Text="25��" Value="25"></asp:ListItem>
                                                        <asp:ListItem Text="30��" Value="30"></asp:ListItem>
                                                        <asp:ListItem Text="35��" Value="35"></asp:ListItem>
                                                        <asp:ListItem Text="40��" Value="40"></asp:ListItem>
                                                        <asp:ListItem Text="45��" Value="45"></asp:ListItem>
                                                        <asp:ListItem Text="50��" Value="50"></asp:ListItem>
                                                        <asp:ListItem Text="55��" Value="55"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ʹ�ò��ţ�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="sybm" runat="server" Width="90%" CssClass="mytext" Enabled="false">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��Ҫ˵����
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jysm" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="5"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
