<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageJy.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageJy" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                align="center">
                                <a href="FilesManageJy.aspx" class="mail_top">�������</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="FilesManageJy_ytg.aspx" class="black">δ�黹</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="FilesManageJy_wtg.aspx" class="black">�ܾ�����</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="FilesManageYgh.aspx" class="black">�ѹ黹</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td style="height: 25px">������:<asp:TextBox ID="jsNumber" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ��������:<asp:TextBox ID="jsName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                �������:<asp:TextBox ID="jsRoomName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ��������:<asp:TextBox ID="jsUnitName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ���ƻ���:<asp:TextBox ID="jsBzPost" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">��������:<asp:TextBox ID="jsBgTime" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ȫ&nbsp;��&nbsp;��:<asp:TextBox ID="jsQuanZong" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                Ŀ&nbsp;¼&nbsp;��:<asp:TextBox ID="jsMulu" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                �����ݺ�:<asp:TextBox ID="jsDaGuan" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                �������:<asp:TextBox ID="jsBaoXian" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">��&nbsp;΢&nbsp;��:<asp:TextBox ID="jsSuoWei" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                ƾ֤���:<asp:TextBox ID="jsPinZheng" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="�� ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
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
                                        <asp:BoundField DataField="Number" HeaderText="������">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Name" HeaderText="��������">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="RoomName" HeaderText="�������">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="BzPost" HeaderText="���ƻ���">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��������">
                                            <HeaderStyle Wrap="False" />
                                            <ItemTemplate>
                                                <%# ((Eval("UnitName").ToString().Replace("��", "").Replace("|", "")))%>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��ز���">
                                            <HeaderStyle Wrap="False" Width="100px" />
                                            <ItemTemplate>
                                                <asp:Label ID="HyId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <a href="FilesManageJy_show.aspx?id=<%#DataBinder.Eval(Container.DataItem, "id")%>"
                                                    class="gvlink">�鿴�ļ�</a>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="100px" />
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
