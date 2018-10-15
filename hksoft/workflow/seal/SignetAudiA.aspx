<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignetAudiA.aspx.cs" Inherits="hkpro.workflow.seal.SignetAudiA" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>ӡ������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="3" style="height: 15px;"></td>
                        </tr>
                        <tr>
                            <td style="height: 20px; width: 168;">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td align="center" style="width: 84; height: 20; background-image: url(../../images/flow/sheetn.jpg)">
                                            <a href="SignetAudi.aspx" class="black">δ����</a>
                                        </td>
                                        <td align="center" style="width: 84; background-image: url(../../images/flow/sheety.jpg)">������
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;&nbsp;ӡ�����ƣ�
                            <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text=" ��ѯ " OnClick="Query_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td><div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    DataKeyNames="sID" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../Images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30"/>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sID" HeaderText="�Զ�ID">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="ӡ������">
                                            <HeaderStyle CssClass="mw150" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('SignetAudiA_Show.aspx?id=<%# Eval("sID") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("sNAME") %>'></asp:Label>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="sType" HeaderText="ӡ������">
                                            <ItemStyle HorizontalAlign="Center"/>
                                            <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sStatus" HeaderText="ӡ��״̬">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="ʹ����Ա" HtmlEncode="False">
                                            <HeaderStyle />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw80" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sRemark" HeaderText="��ע"><HeaderStyle CssClass="mwp80" /></asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font class=page_text>��%RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
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
