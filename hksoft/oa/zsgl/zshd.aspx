<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zshd.aspx.cs" Inherits="hkpro.oa.zsgl.zshd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>֪ʶ����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 5px" colspan="2"></td>
                        </tr>
                        <tr>
                            <td>���⣺<asp:TextBox ID="title" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right" style="height: 25px">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text=" ��ѯ " OnClick="Query_Click"
                                    CausesValidation="False" />
                                <input type="button" name="AddBtn" value=" ���� " class="mybtn" onclick="javascript: popAdd('zshdAdd.aspx');" />
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px" colspan="2"></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                    AutoGenerateColumns="False" DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle HorizontalAlign="center" />
                                            <ItemTemplate>
                                                <a href='zshdShow.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id")%>' class="gvlink">
                                                    <asp:Label ID="Labeltitle" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle Width="80px" />
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Realname") %>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��/��">
                                            <HeaderStyle Width="80px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblid1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="���ظ�">
                                            <HeaderStyle Width="180px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblid2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="Label2" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="180px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                    NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                    PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
