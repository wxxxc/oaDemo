<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_r.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_r" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>Ա��ͨѶ¼</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script>
        function delf() {
            if (!confirm("�Ƿ�ȷ��ɾ���˲��ţ�"))
                return false;
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="form">
                        <tr>
                            <td align="right">������
                            </td>
                            <td>
                                <asp:TextBox ID="jsName" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right">ְλ��
                            </td>
                            <td>
                                <asp:TextBox ID="jsPost" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right">�Ա�
                            </td>
                            <td>
                                <asp:TextBox ID="jsSex" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="5">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button CssClass="mybtn" ID="AddBtn" runat="server" Text="����" OnClick="ImageButton1_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="showbtn" runat="server" Text="�鿴" OnClick="ImageButton6_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="updatebtn" runat="server" Text="�޸�" OnClick="ImageButton2_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="ImageButton3_Click"></asp:Button>
                                <a href="javascript:void(0)" onclick="chkAllw()" class="gvlink">ȫѡ</a>
                                <a href="javascript:void(0)" onclick="revchkAll()" class="gvlink">��ѡ</a>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">����������
                            </td>
                            <td colspan="5"><%=XMStr %></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="lblxh" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ѡ��">
                                <ItemStyle HorizontalAlign="Center" Wrap="True" Width="30px" />
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckSelect" runat="server" />
                                    <asp:Label ID="LabVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                    <asp:Label ID="LabNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                </ItemTemplate>
                                <FooterStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="����"></asp:BoundField>
                            <asp:BoundField DataField="Post" HeaderText="ְλ"></asp:BoundField>
                            <asp:BoundField DataField="Officetel" HeaderText="�칫�绰"></asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="hkRowStyle" />
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="right" width="15%" style="height: 30; width: 15%">��������</td>
                <td colspan="3" style="width: 85%">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">�½������</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">�޸����</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">ɾ�������</asp:LinkButton>
                    �������<%=Namefile %>
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
    </form>
</body>
</html>
