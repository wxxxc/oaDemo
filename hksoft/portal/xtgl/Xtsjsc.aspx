<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xtsjsc.aspx.cs" Inherits="hkpro.portal.xtgl.Xtsjsc" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>ϵͳ��ʼ��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 40px">ѡ����ϵͳ������<asp:DropDownList ID="xt" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click">
                            </asp:DropDownList>
                                <font color="red">*</font>����Ա��Կ��<asp:TextBox ID="superpwd" runat="server" CssClass="mytext"
                                    Width="100" TextMode="Password"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                                    OnClientClick="return confirm('���棺ִ��ɾ�������ݽ��޷��ָ��������ȱ���һ�����ݿ���ִ��ɾ��������\r\nȷ��Ҫ������')"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="SourceDesc" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false">
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
                                        <asp:BoundField DataField="SourceClass" HeaderText="����">
                                            <HeaderStyle Width="150" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SourceDesc" HeaderText="��ɾ��������"></asp:BoundField>
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    </form>
</body>
</html>
