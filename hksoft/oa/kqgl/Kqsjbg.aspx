<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsjbg.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsjbg" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>�������ݱ��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="2" width="800" border="0">
                        <tr>
                            <td style="height: 5px" colspan="6"></td>
                        </tr>
                        <tr>
                            <td align="right">ѡ���ţ�
                            </td>
                            <td>
                                <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="150" AutoPostBack="true"
                                    OnSelectedIndexChanged="bm_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td align="right">ѡ����Ա��
                            </td>
                            <td>
                                <asp:DropDownList ID="ry" runat="server" CssClass="mytext" Width="150">
                                </asp:DropDownList>
                            </td>
                            <td align="right">ͳ�Ʒ�Χ��
                            </td>
                            <td>
                                <asp:DropDownList ID="tjfw" runat="server" CssClass="mytext" Width="150">
                                    <asp:ListItem Text="ȫ����Ա" Value=""></asp:ListItem>
                                    <asp:ListItem Text="ֻ��ʾ���⿼����Ա" Value="1"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">�������ڣ�
                            </td>
                            <td colspan="5">
                                <asp:TextBox ID="kqrq_s" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                    Width="75"></asp:TextBox>��<asp:TextBox ID="kqrq_e" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="75"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Ref_Click"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 5px" colspan="6"></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="1200" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popView('Kqsjbg_View.aspx?id=<%# Eval("rybh") %>&rq=<%# Eval("kqrq") %>')"
                                                    class="gvlink">���</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�鿴">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblyh" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ui_id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblrq" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "kqrq")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lbltxt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��������">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("kqrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle Width="80px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="rybh" HeaderText="��Ӧ���ڻ�ID">
                                            <HeaderStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_id" HeaderText="��Ա����"></asp:BoundField>
                                        <asp:BoundField DataField="xm" HeaderText="����"></asp:BoundField>
                                        <asp:BoundField DataField="sb1" HeaderText="�ϰ�1"></asp:BoundField>
                                        <asp:BoundField DataField="xb2" HeaderText="�°�2"></asp:BoundField>
                                        <asp:BoundField DataField="sb3" HeaderText="�ϰ�3"></asp:BoundField>
                                        <asp:BoundField DataField="xb4" HeaderText="�°�4"></asp:BoundField>
                                        <asp:BoundField DataField="sb5" HeaderText="�ϰ�5"></asp:BoundField>
                                        <asp:BoundField DataField="xb6" HeaderText="�°�6"></asp:BoundField>
                                        <asp:BoundField DataField="cdcs" HeaderText="�ٵ�����"></asp:BoundField>
                                        <asp:BoundField DataField="ztcs" HeaderText="���˴���"></asp:BoundField>
                                        <asp:BoundField DataField="kgcs" HeaderText="��������"></asp:BoundField>
                                        <asp:BoundField DataField="wqdcs" HeaderText="��ǩ������"></asp:BoundField>
                                        <asp:BoundField DataField="wqtcs" HeaderText="��ǩ�˴���"></asp:BoundField>
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="kqrq_s"
            ErrorMessage="��ѡ���ڿ�ʼ����">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kqrq_e"
            ErrorMessage="��ѡ���ڽ�ֹ����">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
