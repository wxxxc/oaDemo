<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pfclsc_View.aspx.cs" Inherits="hkpro.oa.jxkh.Pfclsc_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>���������ϴ�</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    �ϴ��������˵����ֲ���
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" AllowPaging="false">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="�û�����">
                                <HeaderStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="xm" HeaderText="������������">
                                <HeaderStyle Width="15%" />
                                <ItemStyle Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bs" HeaderText="����">
                                <HeaderStyle Width="15%" />
                                <ItemStyle Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gw" HeaderText="��λ">
                                <HeaderStyle Width="15%" />
                                <ItemStyle Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gwf" HeaderText="��λ��">
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fgzrmc" HeaderText="�ֹܸ�����">
                                <HeaderStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fjsl" HeaderText="��������">
                                <HeaderStyle Width="60" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="����">
                                <HeaderStyle Width="40" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick='window.open("Pfclsc_Sc.aspx?kpid=<%# Eval("sskpid") %>&bid=<%# Eval("bid") %>", "_blank", "height=220, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110")' class="gvlink">�ϴ�</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="hkRowStyle" />
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <FooterStyle CssClass="hkBottomStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height:30" align="center">
                    <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()" accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
