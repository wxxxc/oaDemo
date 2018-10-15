<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdsc.aspx.cs" Inherits="hkpro.oa.zsgl.wdsc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>�ҵ�֪ʶ</title>
    <script type="text/javascript">
        function showfrom(str) {
            var num = Math.random();
            window.open("zsshow.aspx?tmp=" + num + "&id=" + str + "", "_blank", "height=700, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=80,left=60")
        }

    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                            align="center">
                                            <a href="wdzs.aspx?i=2" class="black">�ҵ�֪ʶ</a>
                                        </td>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_n.gif)"
                                            align="center">
                                            <a href="wddy.aspx?" class="black">�ҵĶ���</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_y.gif)" align="center">
                                            <a href="wdsc.aspx" class="mail_top">�ҵ��ղ�</a>
                                        </td>
                                        <td align="right">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound" DataKeyNames="Id"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" OnRowCommand="GridView1_RowCommand" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <HeaderStyle Width="30px" />
                                            <ItemTemplate>
                                                <%# (Container.DataItemIndex+1).ToString()%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Title" HeaderText="֪ʶ����">
                                            <ItemStyle />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Realname" HeaderText="����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="LastTime" HeaderText="������ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                            HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="120px" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��ز���">
                                            <HeaderStyle Width="160px" />
                                            <ItemTemplate>
                                                <a href="javascript:void(0)" onclick="showfrom(<%# DataBinder.Eval(Container.DataItem, "id") %>);"
                                                    class="gvlink">�鿴</a>
                                                <asp:Label ID="HyId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:LinkButton ID="tuijian" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="tuijian" CssClass="gvlink">�Ƽ�</asp:LinkButton>
                                                <asp:LinkButton ID="dingyue" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="dingyue" CssClass="gvlink">����</asp:LinkButton>
                                                <asp:LinkButton ID="quxiaoshoucang" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="quxiaoshoucang" CssClass="gvlink">ȡ���ղ�</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Width="160px" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
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
