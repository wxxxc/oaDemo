<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cgx.aspx.cs" Inherits="hkpro.portal.yjgl.Cgx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>�ݸ���</title>
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
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                            align="center">
                                            <a href="sjx.aspx?i=2" class="black">�ռ���</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="fajx.aspx" class="black">������</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="feijx.aspx" class="black">�ϼ���</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_y.gif)" align="center">
                                            <a href="cgx.aspx" class="mail_top">�ݸ���</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="xyj.aspx" class="black">׫д���ʼ�</a>
                                        </td>
                                        <td align="right">
                                            <asp:DropDownList ID="jsfa" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Receive_Click">
                                                <asp:ListItem Text="ȫ��" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="��Ҫ�ʼ�" Value="��Ҫ"></asp:ListItem>
                                                <asp:ListItem Text="��ͨ�ʼ�" Value="��ͨ"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ ��" OnClick="Del_Click"
                                                OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                                <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="yjid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"/>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                <a href="xyj.aspx?type=cg&id=<%# Eval("yjid") %>" class="gvlink">
                                                    <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("fsbt") %>' />
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="false" />
                                                <HeaderStyle CssClass="mwp30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="������">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("jsrNames") %>' />
                                            </ItemTemplate>
                                                <HeaderStyle CssClass="mwp30" />
                                        </asp:TemplateField>
                                        <asp:ImageField DataImageUrlField="fjbz" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderText="������־" HeaderImageUrl="../../images/y.gif">
                                            <ItemStyle HorizontalAlign="center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:ImageField>
                                        <asp:BoundField DataField="zyjb" HeaderText="��Ҫ����">
                                           <HeaderStyle CssClass="mw60" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fssj" HeaderText="����" DataFormatString="{0:yyyy-MM-dd}"
                                            HtmlEncode="False">
                                            <HeaderStyle CssClass="mw80" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="msbz" HeaderText="����">
                                            <HeaderStyle CssClass="mw40" />
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
