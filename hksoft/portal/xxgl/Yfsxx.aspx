<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yfsxx.aspx.cs" Inherits="hkpro.portal.xxgl.Yfsxx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>�ѷ�����Ϣ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">       
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 10px">
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                <tr>
                                    <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                        align="center">
                                        <a href="sxx.aspx" class="black">����Ϣ</a>
                                    </td>
                                    <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                        <a href="yfsxx.aspx" class="mail_top">�ѷ�����Ϣ</a>
                                    </td>
                                    <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                        <a href="xxx.aspx" class="black">д��Ϣ</a>
                                    </td>
                                    <td align="right">
                                        <asp:DropDownList ID="jsfa" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Receive_Click">
                                            <asp:ListItem Text="ȫ���ѷ�����Ϣ" Value="ȫ��" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="�Է�δ��ȡ��Ϣ" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="�Է��Ѷ�ȡ��Ϣ" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button CssClass="mybtn" ID="Button1" runat="server" Text="ˢ ��" OnClick="Receive_Click">
                                        </asp:Button>
                                    </td>
                                </tr>
                            </table>
                                <div class="mytable table-responsive">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                 DataKeyNames="id"   EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                <Columns>
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle CssClass="mw30" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="id" HeaderText="����">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="������">
                                        <HeaderStyle CssClass="mwp30" />
                                        <ItemTemplate>
                                            <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("ui_desc") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="nr" HeaderText="����">
                                         <HeaderStyle CssClass="mwp50" />
                                    </asp:BoundField>
                                    <asp:ImageField DataImageUrlField="zt" DataImageUrlFormatString="../../images/{0}.gif"
                                        HeaderText="״̬">
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle CssClass="mw30" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="fssj" HeaderText="����ʱ��" DataFormatString="{0:yy-MM-dd HH:mm}"
                                        HtmlEncode="False">
                                        <HeaderStyle CssClass="mw100"/>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <RowStyle CssClass="hkRowStyle" />
                                <HeaderStyle CssClass="hkHeadStyle" />
                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                            </asp:GridView>
                                    </div>
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
