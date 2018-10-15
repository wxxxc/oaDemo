<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sxx.aspx.cs" Inherits="hkpro.portal.xxgl.Sxx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>����Ϣ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 10px"></td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_y.gif)"
                                            align="center">
                                            <a href="sxx.aspx" class="mail_top">����Ϣ</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="yfsxx.aspx" class="black">�ѷ�����Ϣ</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="xxx.aspx" class="black">д��Ϣ</a>
                                        </td>
                                        <td align="right">
                                            <asp:DropDownList ID="jsfa" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Receive_Click">
                                                <asp:ListItem Text="ȫ����Ϣ" Value="ȫ��" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="δ����Ϣ" Value="0"></asp:ListItem>
                                                <asp:ListItem Text="�Ѷ���Ϣ" Value="1"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button CssClass="mybtn" ID="ReadBtn" runat="server" Text="����Ѷ�" OnClick="Read_Click"></asp:Button>
                                            <asp:Button CssClass="mybtn" ID="RecBtn" runat="server" Text="ˢ ��" OnClick="Receive_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                                 <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle CssClass="mw30"></HeaderStyle>
                                            <ItemStyle CssClass="mw30" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                               <HeaderStyle CssClass="mw30"  />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="id" HeaderText="����">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                            <FooterStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:ImageField DataImageUrlField="zt" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderText="״̬">
                                            <ItemStyle HorizontalAlign="center" />
                                            <HeaderStyle CssClass="mw40"  />
                                        </asp:ImageField>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("nr") %>' />
                                            </ItemTemplate>
                                             <HeaderStyle CssClass="mwp80"  />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle CssClass="mw70" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("ui_desc") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fssj" HeaderText="����ʱ��" DataFormatString="{0:yy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw100" />
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
