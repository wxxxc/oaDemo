<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yh_Bm.aspx.cs" Inherits="hksoft.portal.yhgl.Yh_Bm" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>附加部门设定</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" height="25px">设定【<asp:Label ID="lblyh" runat="server"></asp:Label>】的附加部门
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 10px"></td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/<%Response.Write(GetSelectImage("tab_b_n", "tab_b_y", ListType, 1)); %>.gif)"
                                            align="center">
                                            <asp:LinkButton ID="lbMyApprove" runat="server" CssClass="black" OnClick="YX_Click">已选部门</asp:LinkButton>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/<%Response.Write(GetSelectImage("tab_b_n","tab_b_y",ListType,2)); %>.gif)"
                                            align="center">
                                            <asp:LinkButton ID="lbMyDocument" runat="server" CssClass="black" OnClick="DX_Click">待选部门</asp:LinkButton>
                                        </td>
                                        <td align="right"></td>
                                        <td align="right">
                                            <asp:Button CssClass="mybtn" ID="DelBm" runat="server" Text="删除部门" OnClick="DelBm_Click"></asp:Button>
                                            <asp:Button CssClass="mybtn" ID="AddBm" runat="server" Text="添加部门" OnClick="AddBm_Click"
                                                Visible="false"></asp:Button>
                                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript: window.close()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="bm_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="bm_bm" HeaderText="部门编码">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="部门名称">
                                            <HeaderStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bm_bz" HeaderText="备注"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
