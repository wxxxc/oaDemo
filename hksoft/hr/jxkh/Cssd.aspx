<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cssd.aspx.cs" Inherits="hkpro.oa.jxkh.Cssd" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����趨</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table id="search" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td style="height: 10px">
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="RowDataBound" AutoGenerateColumns="False"
                                DataSourceID="SqlDataSource1" Width="99%" DataKeyNames="P_Code" EmptyDataText="�Բ��𣬼��������κμ�¼��"
                                CssClass="hkgv">
                                <Columns>
                                    <asp:BoundField DataField="p_code" HeaderText="��������" ReadOnly="True" Visible="False" />
                                    <asp:BoundField DataField="P_name" HeaderText="��������" ReadOnly="True">
                                        <HeaderStyle Width="25%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="ֵ">
                                        <HeaderStyle Width="20%" />
                                        <EditItemTemplate>
                                            <asp:TextBox ID="value" runat="server" Text='<%# Bind("P_Value") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("P_Value") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="P_Desc" HeaderText="˵��" ReadOnly="True">
                                        <HeaderStyle Width="45%" />
                                    </asp:BoundField>
                                    <asp:CommandField ButtonType="Image" CancelImageUrl="../../images/cancel.gif" CancelText="ȡ���޸�"
                                        EditImageUrl="../../images/edit.gif" EditText="�޸Ĳ���" HeaderText="����" ShowEditButton="True"
                                        UpdateImageUrl="../../images/save.gif" UpdateText="�����޸�">
                                        <HeaderStyle Width="10%" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:CommandField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"
        CancelSelectOnNullParameter="false">
        <UpdateParameters>
            <asp:Parameter Name="P_Value" />
            <asp:Parameter Name="P_Code" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
