<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qjdsp2_View.aspx.cs" Inherits="hkpro.oa.kqgl.Qjdsp2_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��ٵ�����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                ��������������ٵ�
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        ������ͣ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblqjlx" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        �������
                                    </td>
                                    <td>
                                        <asp:Label ID="lblgjlb" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        ��ٿ�ʼ���ڣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblqjkssj" runat="server"></asp:Label>(<asp:Label ID="lblqjkssd" runat="server"></asp:Label>)
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        ��ٽ�ֹ���ڣ�
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblqjjssj" runat="server"></asp:Label>(<asp:Label ID="lblqjjssd" runat="server"></asp:Label>)
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        ���������
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="lblqjts" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ������ɣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblqjly" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �������������
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="lblgztzqk" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ��ٸ�����
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="fujian" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ���벿�ţ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqbmmc" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        �����ˣ�
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqr" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ����ʱ�䣺
                                    </td>
                                    <td>
                                        <asp:Label ID="lblsqsj" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 25">
                                        <img src="../../images/arrow_s.gif" alt="" />
                                        <asp:Label ID="Label5" runat="server" Text="�������̼�¼" Font-Bold="true" ForeColor="Blue"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                             EmptyDataText="��ʱû���κ�������¼"  Width="100%" CssClass="hkgv">
                                            <Columns>
                                                <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="spsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                                    HtmlEncode="False">
                                                    <HeaderStyle Width="120px" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="������">
                                                    <HeaderStyle Width="80px" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("sprmc") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="����״̬">
                                                    <HeaderStyle Width="60px" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("spzt") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="spyj" HeaderText="�������"></asp:BoundField>
                                            </Columns>
                                            <RowStyle CssClass="hkRowStyle" />
                                            <HeaderStyle CssClass="hkHeadStyle" />
                                            <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                            <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 25">
                                        ��һ�������ˣ�<asp:Label ID="lblspr" runat="server" Font-Bold="true"></asp:Label>
                                        ����ʱ�䣺<asp:Label ID="sssj" runat="server" Font-Bold="true"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="�� ��" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
