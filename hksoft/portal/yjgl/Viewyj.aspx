<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Viewyj.aspx.cs" Inherits="hkpro.portal.yjgl.Viewyj" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>�Ķ��ʼ�</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 25px;" class="td_base">
                    <b>�Ķ��ʼ�</b>
                </td>
                <td class="td_base"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
                        <tr style="height: 25px">
                            <td width="10%" class="form-item">�����ˣ�
                            </td>
                            <td width="90%">
                                <asp:Label ID="fjr" runat="server" />
                            </td>
                        </tr>
                        <tr style="height: 25px">
                            <td class="form-item">�ռ��ˣ�
                            </td>
                            <td>
                                <asp:Label ID="sjr" runat="server" />
                            </td>
                        </tr>
                        <tr style="height: 25px">
                            <td class="form-item">ʱ&nbsp;&nbsp;�䣺
                            </td>
                            <td>
                                <asp:Label ID="rq" runat="server" />
                            </td>
                        </tr>
                        <tr style="height: 25px">
                            <td class="form-item">��&nbsp;&nbsp;�⣺
                            </td>
                            <td>
                                <asp:Label ID="bt" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                                <asp:Label ID="nr" runat="server" Text="Label"></asp:Label>
                            </td>
                        </tr>
                        <tr style="height: 25px">
                            <td class="form-item">��&nbsp;&nbsp;����
                            </td>
                            <td>
                                <asp:Label ID="fujian" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <asp:Panel ID="p_cyzt" runat="server" Visible="false">
                            <tr style="height: 25px">
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ui_desc" HeaderText="�ռ���"></asp:BoundField>
                                            <asp:ImageField DataImageUrlField="jszt" DataImageUrlFormatString="../../images/{0}.gif"
                                                HeaderText="����״̬">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle Width="60px" />
                                            </asp:ImageField>
                                            <asp:BoundField DataField="jssj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                                HtmlEncode="False">
                                                <HeaderStyle Width="120px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="hkRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" />
                                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30px">&nbsp;<asp:Button CssClass="mybtn" ID="WriteBtn" runat="server" Text="�ظ�" OnClick="Roll_Click"
                    Visible="false"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="ZhuanBtn" runat="server" Text="ת��" OnClick="Zhuan_Click"
                        Visible="false"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="DelBtn_s" runat="server" Text="ɾ��" OnClick="Del_Click_s"
                        OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Visible="false"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="DelBtn_f" runat="server" Text="ɾ��" OnClick="Del_Click_f"
                        OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Visible="false"></asp:Button>
                    <input type="button" id="BackBtn_s" name="BackBtn" value="����" class="mybtn" onclick="javascript: location.href = 'sjx.aspx?i=2'"
                        runat="server" visible="false" />
                    <input type="button" id="BackBtn_f" name="BackBtn" value="����" class="mybtn" onclick="javascript: location.href = 'fajx.aspx'"
                        runat="server" visible="false" />&nbsp;
                </td>
            </tr>
        </table>
        <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
