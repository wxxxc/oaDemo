<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Grjh_Gzx.aspx.cs" Inherits="hkpro.oa.jhgl.Grjh_Gzx" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��ϸ������Ŀ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                �鿴������Ŀ
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
                                    <td class="form-item">
                                        �������⣺
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="gzzt" runat="server" Width="96%" CssClass="mytext" MaxLength="150"
                                            ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �������ݣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="gznr" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        �ƻ���ʼʱ�䣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="jhkssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        �ƻ����ʱ�䣺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="jhwcsj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����ߣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="txtSendTo" Rows="2" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            ReadOnly="true" Width="96%"></asp:TextBox>
                                        <asp:TextBox runat="server" Width="0" ID="hdnTxtSendTo" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        Ԥ�ڽ����
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="yqjg" runat="server" Width="96%" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="3" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <asp:Panel ID="sjwc" runat="server" Visible="false">
                                    <tr>
                                        <td>
                                        </td>
                                        <td colspan="3">
                                            <hr class="hr1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            ʵ�����ʱ�䣺
                                        </td>
                                        <td>
                                            <asp:TextBox ID="sjwcsj" runat="server" Width="90%" CssClass="mytext" ReadOnly="true"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            ʵ����������
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="sjwcjg" runat="server" Width="451" CssClass="mytextarea" TextMode="multiLine"
                                                Rows="3" ReadOnly="true"></asp:TextBox>
                                        </td>
                                    </tr>
                                </asp:Panel>
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
