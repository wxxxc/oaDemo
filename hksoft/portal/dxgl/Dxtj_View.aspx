<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dxtj_View.aspx.cs" Inherits="hkpro.portal.dxgl.Dxtj_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>短信发送明细</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" height="25px">
                    <asp:Label runat="server" ID="zymc" />
                    的全部短信发送明细
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ssendno" HeaderText="接收号码"></asp:BoundField>
                                        <asp:TemplateField HeaderText="短信内容">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("ssmsmessage") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nIsSend" HeaderText="发送结果">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dTimingTime" HeaderText="发送时间">
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
                                <asp:Button CssClass="mybtn" ID="OutBtn" runat="server" Text="导 出" CausesValidation="true"
                                    OnClick="Out_Click"></asp:Button>
                                <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
