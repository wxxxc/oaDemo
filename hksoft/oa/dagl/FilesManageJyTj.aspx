<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageJyTj.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageJyTj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����ͳ��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script>
        function showfrom(str) {
            var num = Math.random();
            window.open("FilesManageBook_show.aspx?tmp=" + num + "&id=" + str + "", "_blank", "height=650, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
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
                            <td style="height: 25px">��&nbsp;��&nbsp;��:<asp:TextBox ID="jsNum" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ��&nbsp;��&nbsp;��:<asp:TextBox ID="jsName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                �ļ�����:<asp:TextBox ID="jsTitle" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ��&nbsp;��&nbsp;��:<asp:TextBox ID="jsOtherTitle" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ���ĵ�λ:<asp:TextBox ID="jsFwCompany" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">��������:<asp:TextBox ID="jsFwTime" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ��&nbsp;&nbsp;&nbsp;&nbsp;��:<asp:TextBox ID="jsMiji" runat="server" CssClass="mytext"
                                    Width="90"></asp:TextBox>
                                �����ȼ�:<asp:TextBox ID="jsDengji" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                �ļ�����:<asp:TextBox ID="jsWjType" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                �������:<asp:TextBox ID="jsGwType" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">��������:<asp:TextBox ID="jsFilesName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�ļ���">
                                            <HeaderStyle Wrap="False" />
                                            <ItemTemplate>
                                                <a href="javascript:void(0)" onclick="showfrom(<%# DataBinder.Eval(Container.DataItem, "id") %>);"
                                                    class="gvlink">
                                                    <%# ((Eval("Num").ToString()))%></a>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Title" HeaderText="�ļ�����">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Miji_MC" HeaderText="�ܼ�">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FilesName" HeaderText="��������">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="״̬">
                                            <HeaderStyle Wrap="False" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle Wrap="False" Width="80px" />
                                            <ItemTemplate>
                                                <asp:Label ID="HyId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="80px" />
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
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
