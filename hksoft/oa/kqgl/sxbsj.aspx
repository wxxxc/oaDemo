<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sxbsj.aspx.cs" Inherits="hkpro.oa.kqgl.sxbsj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ʱ��ά��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            <font color="red">���ѣ����Ű������е�ʹ����Ա�����ظ���������������������Ա���౨��ʱ������Ϊ�����Ρ�</font>
                        </td>
                        <td align="right">
                            <input type="button" name="AddBtn" value="�� ��" class="mybtn" onclick="javascript:popAdd('sxbsj_view.aspx');"
                                 />
                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                                OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" ></asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                 DataKeyNames="id"    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                <Columns>
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            <asp:Label ID="LabVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                Visible="False" Width="0px"></asp:Label>
                                            <asp:Label ID="LabNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PbType") %>'
                                                Visible="False" Width="0px"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderStyle Width="30px"></HeaderStyle>
                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                        <HeaderTemplate>
                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16;
                                                height: 16" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="�Ű�����">
                                        <HeaderStyle Wrap="false" />
                                        <ItemStyle Wrap="false" />
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:popMod('sxbsj_view.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("PbType") %>'></asp:Label></a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SyRealname" HeaderText="ʹ����Ա"></asp:BoundField>
                                    <asp:BoundField DataField="QyType" HeaderText="״̬">
                                        <ItemStyle HorizontalAlign="Center" Width="60px" />
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
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
