<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsmsp_View.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsmsp_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����˵������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="width: 80%; height: 25px">����˵������
                </td>
                <td class="td_base" style="width: 20%">&nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top" colspan="2">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                    <tr>
                                        <td class="form-item" style="width: 20%">���ڣ�
                                        </td>
                                        <td style="width: 30%">
                                            <asp:Label ID="lblqdsj" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item" style="height: 25; width: 20%">&nbsp;
                                        </td>
                                        <td style="width: 30%">&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">����ࣺ
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ynqd1" runat="server" Text="ǩ��" Enabled="false" />
                                            <asp:CheckBox ID="ynqt1" runat="server" Text="ǩ��" Enabled="false" />
                                        </td>
                                        <td class="form-item" style="height: 25;">&nbsp;
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">����ࣺ
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ynqd2" runat="server" Text="ǩ��" Enabled="false" />
                                            <asp:CheckBox ID="ynqt2" runat="server" Text="ǩ��" Enabled="false" />
                                        </td>
                                        <td class="form-item" style="height: 25;">&nbsp;
                                        </td>
                                        <td>&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">���ϰࣺ
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="ynqd3" runat="server" Text="ǩ��" Enabled="false" />
                                            <asp:CheckBox ID="ynqt3" runat="server" Text="ǩ��" Enabled="false" />
                                        </td>
                                        <td class="form-item" style="height: 25;">���������
                                        </td>
                                        <td>
                                            <asp:Label ID="lblsscs" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�������˵����
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblkqqksm" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">˵��������
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="fujian" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">���벿�ţ�
                                        </td>
                                        <td>
                                            <asp:Label ID="lblsqbmmc" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">�����ˣ�
                                        </td>
                                        <td>
                                            <asp:Label ID="lblsqr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">����ʱ�䣺
                                        </td>
                                        <td>
                                            <asp:Label ID="lblsqsj" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">&nbsp;
                                        </td>
                                        <td>&nbsp;
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
                                                EmptyDataText="��ʱû���κ�������¼" Width="100%" CssClass="hkgv">
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
                                        <td colspan="4" style="height: 25">��һ�������ˣ�<asp:Label ID="lblspr" runat="server" Font-Bold="true"></asp:Label>
                                            ����ʱ�䣺<asp:Label ID="sssj" runat="server" Font-Bold="true"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr style="height: 25px">
                                        <td class="form-item">
                                            <font color="red">*</font>���������
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="spyj" runat="server" Width="93%" TextMode="MultiLine" Rows="2" CssClass="mytextarea" /><img
                                                src="../../images/choose.gif" onclick="openA('../../choose/portal/Spyjview.aspx')"
                                                alt="ѡ��ϵͳ�ṩ���������" />
                                        </td>
                                    </tr>
                                    <tr style="height: 25px">
                                        <td class="form-item">
                                            <asp:Label ID="lcsm" runat="server" Text="����鿴����˵��" Font-Underline="true" ForeColor="Blue"
                                                Visible="false"></asp:Label>
                                        </td>
                                        <td colspan="3">
                                            <asp:DropDownList ID="jsr" CssClass="mytext" runat="server" AutoPostBack="true" OnSelectedIndexChanged="jsr_Changed"
                                                ToolTip="��ʾӵ�п�������Ȩ�޵���Ա">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="kqry" CssClass="mytext" runat="server" Visible="false" ToolTip="��ʾ��Ҫ���ս��п���ȷ�ϵ���Ա">
                                                <asp:ListItem Text="ѡ���ڹ�����Ա" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 25px" class="form-item"></td>
                                        <td colspan="3">
                                            <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ��һ��������" Checked="true" />
                                            <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ��һ��������" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height: 30">
                                <asp:Button CssClass="mybtn" ID="PassBtn" runat="server" Text="����ͨ��" OnClick="Pass_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="BackBtn" runat="server" Text="�����˻�" OnClick="Back_Click"
                                    CausesValidation="false"></asp:Button>
                                <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblsqbmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="smzt" runat="server" Visible="false" />
        <asp:Label ID="sidstr" runat="server" Visible="False"></asp:Label>
        <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="spyj"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="jsr"
            ErrorMessage="��ѡ����һ��������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="kqry"
            ErrorMessage="��ѡ���ڹ�����Ա">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
