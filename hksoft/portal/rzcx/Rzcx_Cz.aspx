<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rzcx_Cz.aspx.cs" Inherits="hkpro.portal.rzcx.Rzcx_Cz" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��־��ѯ</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 10"></td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="98%" align="center">
                        <tr>
                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_n.gif)"
                                align="center">
                                <a href="rzcx.aspx" class="black">��¼��־����</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                <a href="rzcx_mx.aspx" class="black">��¼��־��ϸ</a>
                            </td>
                            <td style="width: 91px; background-image: url(../../images/tab_b_y.gif)" align="center">
                                <a href="rzcx_cz.aspx" class="mail_top">������־��ϸ</a>
                            </td>
                            <td align="right">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0" class="form">
                        <tr>
                            <td align="right">������Ա��
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right">ģ�����ƣ�
                            </td>
                            <td>
                                <asp:TextBox ID="ModuName" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right">��־���ݣ�
                            </td>
                            <td>
                                <asp:TextBox ID="LogContent" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">IP��ַ��
                            </td>
                            <td>
                                <asp:TextBox ID="IPAddress" runat="server" CssClass="mytext" Width="150px" />
                            </td>
                            <td align="right">�������ڣ�
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                    CssClass="mytext" Width="70"></asp:TextBox>��<asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="mytext" Width="70"></asp:TextBox>
                                <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="��ѯ" CausesValidation="true"
                                    OnClick="Query_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-warning" ID="ClearBtn" runat="server" Text="���" CausesValidation="true"
                                    OnClick="Clear_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-success" ID="ExpBtn" runat="server" Text="����" OnClick="Exp_Click" />
                            </td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="2">
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
                                        <asp:BoundField DataField="NowTime" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                            HtmlEncode="False">
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="IPAddress" HeaderText="IP��ַ">
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="ģ������">
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="LogContent" HeaderText="��־����"></asp:BoundField>
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
