<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sjx.aspx.cs" Inherits="hkpro.portal.yjgl.Sjx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>�ռ���</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
                <td style="height: 10px"></td>
            </tr>
            <tr>
                <td valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td style="height: 21px; width: 61px; background-image: url(../../images/tab_y.gif)"
                                align="center">
                                <a href="sjx.aspx?i=2" class="mail_top">�ռ���</a>
                            </td>
                            <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                <a href="fajx.aspx" class="black">������</a>
                            </td>
                            <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                <a href="feijx.aspx" class="black">�ϼ���</a>
                            </td>
                            <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                <a href="cgx.aspx" class="black">�ݸ���</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="xyj.aspx" class="black">׫д���ʼ�</a>
                            </td>
                            <td align="right">���Ͳ���:<asp:DropDownList ID="ssbm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Receive_Click"
                                Width="100">
                            </asp:DropDownList>
                                ������:<asp:TextBox ID="fsr" runat="server" CssClass="mytext" Width="60"></asp:TextBox>
                                <asp:DropDownList ID="jsfa" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Receive_Click">
                                    <asp:ListItem Text="ȫ���ʼ�" Value="ȫ��" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="δ���ʼ�" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="�Ѷ��ʼ�" Value="1"></asp:ListItem>
                                    <asp:ListItem Value="">-------</asp:ListItem>
                                    <asp:ListItem Text="��Ҫ�ʼ�" Value="��Ҫ"></asp:ListItem>
                                    <asp:ListItem Text="��ͨ�ʼ�" Value="��ͨ"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button CssClass="mybtn" ID="RecBtn" runat="server" Text="��ѯ" OnClick="Receive_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click"
                                    OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                            </td>
                        </tr>
                    </table>
                       <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        DataKeyNames="jsid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="mw60" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="3%"></HeaderStyle>
                                <ItemStyle Height="18px" HorizontalAlign="center" />
                                <HeaderTemplate>
                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ImageField DataImageUrlField="jszt" DataImageUrlFormatString="../../images/{0}.gif"
                                HeaderText="״̬">
                                <ItemStyle HorizontalAlign="center" />
                                <HeaderStyle CssClass="mw60"/>
                            </asp:ImageField>
                            <asp:TemplateField HeaderText="����">
                                <HeaderStyle CssClass="mwp30"/>
                                <ItemTemplate>
                                    <a href="Viewyj.aspx?type=s&id=<%# Eval("jsid") %>" class="gvlink">
                                        <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("jsbt") %>' />
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="jsrNames2" HeaderText="ȫ���ռ���">
                                <HeaderStyle CssClass="mwp30" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="fjbz" DataImageUrlFormatString="../../images/{0}.gif"
                                HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                <ItemStyle HorizontalAlign="center" />
                                <HeaderStyle CssClass="mw30"/>
                            </asp:ImageField>
                            <asp:TemplateField HeaderText="������">
                                <HeaderStyle CssClass="mw120" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("fsrName") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="fssj" HeaderText="����" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                <HeaderStyle CssClass="mw120" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zyjb" HeaderText="��Ҫ����">
                                <HeaderStyle CssClass="mw120" />
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
    </form>
</body>
</html>
