<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdyjx.aspx.cs" Inherits="hkpro.portal.xzgl.Wdyjx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵ������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="Wdyjx.aspx" class="mail_top">�յ������</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="Wdyjx_f.aspx" class="black">���������</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" border="0" class="form">
                        <tr>
                            <td style="height: 40px">�������⣺<asp:DropDownList ID="tj" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Select_Click">
                                <asp:ListItem Value="���ظ�" Text="���ظ������" Selected="true"></asp:ListItem>
                                <asp:ListItem Value="�ѻظ�" Text="�ѻظ������"></asp:ListItem>
                            </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                        <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                        DataKeyNames="yjid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle  CssClass="mw30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="�������">
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('wdyjx_view.aspx?id=<%# Eval("yjid") %>')"
                                        class="gvlink">
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("yjbt") %>'></asp:Label></a>
                                </ItemTemplate>
                                 <HeaderStyle  CssClass="mwp50" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="mc" HeaderText="�����"> <HeaderStyle  CssClass="mw150" /></asp:BoundField>
                            <asp:BoundField DataField="fbrmc" HeaderText="������">
                                 <HeaderStyle  CssClass="mw150" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fbsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                 <HeaderStyle  CssClass="mw60" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="hfrmc" HeaderText="�ظ���">
                                 <HeaderStyle  CssClass="mw80" />
                            </asp:BoundField>
                            <asp:BoundField DataField="hfsj" HeaderText="�ظ�ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                HtmlEncode="False">
                                <HeaderStyle  CssClass="mw60" />
                                <ItemStyle HorizontalAlign="center" />
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
