<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xmcx_Lxr.aspx.cs" Inherits="hkpro.oa.xmgl.Xmcx_Lxr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>��Ŀ��ѯ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" width="80%" height="25px">�鿴��ϵ��
                </td>
                <td class="td_base" width="20%"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tr>
                            <td style="height: 10px"></td>
                            <td></td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                            align="center">
                                            <a href="xmcx_view.aspx?id=<%=xmid.Text %>" class="black">��Ŀ�嵥</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmcx_gzjl.aspx?id=<%=xmid.Text %>" class="black">���ټ�¼</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                            <a href="xmcx_lxr.aspx?id=<%=xmid.Text %>" class="mail_top">��ϵ��</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xmcx_fj.aspx?id=<%=xmid.Text %>" class="black">��Ŀ����</a>
                                        </td>
                                        <td align="right" colspan="4">
                                            <asp:Button ID="PrnBtn" runat="server" Text="��ӡ" CssClass="mybtn" CausesValidation="false"></asp:Button>
                                            <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript: window.close()" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="98%">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        DataSourceID="SqlDataSource1" DataKeyNames="lxrid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="xm" HeaderText="����">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bm" HeaderText="����">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zw" HeaderText="ְ��">
                                <HeaderStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gzdw" HeaderText="������λ"></asp:BoundField>
                            <asp:BoundField DataField="dh" HeaderText="�绰">
                                <HeaderStyle Width="120px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gjry" HeaderText="�ؼ���">
                                <HeaderStyle Width="60px" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
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
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                        NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                        PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
        <asp:Label ID="xmid" runat="server" Visible="false"></asp:Label>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:haokeConnectionString %>"></asp:SqlDataSource>
    </form>
</body>
</html>
