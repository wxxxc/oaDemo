<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yh_Js.aspx.cs" Inherits="hkpro.portal.yhgl.Yh_Js" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ӽ�ɫ�趨</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" height="25px">�趨��<asp:Label ID="lblyh" runat="server"></asp:Label>���ĸ��ӽ�ɫ
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
                                            <asp:LinkButton ID="lbMyApprove" runat="server" CssClass="black" OnClick="YX_Click">��ѡ��ɫ</asp:LinkButton>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/<%Response.Write(GetSelectImage("tab_b_n","tab_b_y",ListType,2)); %>.gif)"
                                            align="center">
                                            <asp:LinkButton ID="lbMyDocument" runat="server" CssClass="black" OnClick="DX_Click">��ѡ��ɫ</asp:LinkButton>
                                        </td>
                                        <td align="right"></td>
                                        <td align="right">
                                            <asp:Button CssClass="mybtn" ID="DelJs" runat="server" Text="ɾ����ɫ" OnClick="DelJs_Click"></asp:Button>
                                            <asp:Button CssClass="mybtn" ID="AddJs" runat="server" Text="��ӽ�ɫ" OnClick="AddJs_Click"
                                                Visible="false"></asp:Button>
                                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript: window.close()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="role_id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
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
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="role_name" HeaderText="��ɫ����">
                                            <HeaderStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="role_comm" HeaderText="��ע"></asp:BoundField>
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
