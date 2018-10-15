<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zssp.aspx.cs" Inherits="hkpro.oa.zsgl.zssp" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>֪ʶ����</title>
    <script>
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
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 10px"></td>
                            <td align="right"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                            align="center">
                                            <a href="zssp.aspx?i=2" class="mail_top">δ����</a>
                                        </td>
                                        <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                            <a href="wzssp.aspx" class="black">������</a>
                                        </td>
                                        <td align="right">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                    AutoGenerateColumns="False" DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
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
                                        <asp:TemplateField HeaderText="����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="70px" />
                                            <ItemTemplate>
                                                <a href="javascript:void(0)" onclick="showfrom(<%# DataBinder.Eval(Container.DataItem, "id") %>);"
                                                    class="gvlink">�鿴</a> <a href="#" onclick="javascript:popMod('zssp_view.aspx?id=<%# Eval("ID") %>&type=<%=Request.QueryString["Type"] %>')"
                                                        class="gvlink">����</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
