<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwwh.aspx.cs" Inherits="hkpro.oa.jxkh.Pwwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>��ίά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tbody>
                            <tr>
                                <td style="height: 40px">
                                    �������ţ�<asp:DropDownList ID="ssbm" runat="server">
                                    </asp:DropDownList>
                                    ���ټ�����<asp:DropDownList ID="query_tj" runat="server">
                                        <asp:ListItem Value="a.pid" Selected="True">��ί����</asp:ListItem>
                                        <asp:ListItem Value="a.pwxm">��ί����</asp:ListItem>
                                        <asp:ListItem Value="a.pwlx">��ί����</asp:ListItem>
                                        <asp:ListItem Value="a.pwbz">��ע</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"
                                        CausesValidation="False" AccessKey="f" />
                                    <input type="button" id="AddBtn" name="AddBtn" value="�� ��" class="btn btn-success" onclick="javascript:popAdd('Pwwh_View.aspx');"
                                        accesskey="a" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="pid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                        <Columns>
                                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="��ί����">
                                                <HeaderStyle Width="10%" />
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popAdd('Pwwh_View.aspx?id=<%# Eval("pid") %>')" class="gvlink">
                                                        <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("pid") %>'></asp:Label></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="pwxm" HeaderText="��ί����">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pwlx" HeaderText="��ί����">
                                                <HeaderStyle Width="10%" />
                                                <ItemStyle Wrap="false" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="pwbz" HeaderText="��ע">
                                            </asp:BoundField>
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
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>