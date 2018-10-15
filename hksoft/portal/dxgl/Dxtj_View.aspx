<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dxtj_View.aspx.cs" Inherits="hkpro.portal.dxgl.Dxtj_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>���ŷ�����ϸ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" height="25px">
                    <asp:Label runat="server" ID="zymc" />
                    ��ȫ�����ŷ�����ϸ
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ssendno" HeaderText="���պ���"></asp:BoundField>
                                        <asp:TemplateField HeaderText="��������">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("ssmsmessage") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nIsSend" HeaderText="���ͽ��">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dTimingTime" HeaderText="����ʱ��">
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <PagerStyle CssClass="hkBottomStyle" Font-Bold="False" Font-Italic="False" Font-Names="Batang"
                                        Font-Overline="False" Font-Strikeout="True" ForeColor="#0000C0" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    <PagerSettings PageButtonCount="25" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="Center" style="height: 30">
                                <asp:Button CssClass="mybtn" ID="OutBtn" runat="server" Text="�� ��" CausesValidation="true"
                                    OnClick="Out_Click"></asp:Button>
                                <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
