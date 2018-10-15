<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tmsz_r.aspx.cs" Inherits="hkpro.portal.tpgl.Tmsz_r" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="Form1" runat="server">
        <asp:Panel ID="panel1" runat="Server">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <table width="100%" align="center">
                        <tr>
                            <td>��ǰ��Ч������Ŀ��<font color="red">��<%=Request.QueryString["ClassID"]%>��</font>
                                <table cellspacing="1" cellpadding="0" width="100%" align="center">
                                    <table cellspacing="1" cellpadding="0" width="99%" align="center">
                                        <tr style="height: 30">
                                            <td></td>
                                            <td align="center">��Ŀ���ƣ�
                                            <asp:TextBox ID="name" runat="server" Width="200" CssClass="mytext"></asp:TextBox>&nbsp;&nbsp;
                                            <asp:Button ID="SaveBtn" CssClass="mybtn" OnClick="Save_Click" runat="server" Text="�� ��"></asp:Button>
                                            </td>
                                        </tr>
                                    </table>
                                </table>
                                <table class="" cellspacing="1" cellpadding="0" width="100%" align="center" border="0">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Msgtm" runat="server" ForeColor="red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <asp:DataGrid ID="DataGrid1" runat="server" Width="99%" AutoGenerateColumns="False" OnItemCommand="Grid1_Mod" OnUpdateCommand="Grid1_Update"
                                                OnCancelCommand="Grid1_Cancel" OnEditCommand="Grid1_Edit" CssClass="hkgv" AllowPaging="false">
                                                <AlternatingItemStyle CssClass="hkAltRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" HorizontalAlign="Center" />
                                                <ItemStyle CssClass="hkRowStyle" />
                                                <PagerStyle NextPageText="��һҳ" Font-Names="����" Font-Bold="True" PrevPageText="��һҳ"
                                                    HorizontalAlign="Right" ForeColor="Blue"></PagerStyle>
                                                <EditItemStyle BackColor="#E9F0F8"></EditItemStyle>
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblxh1" runat="server" Text="<%# DataGrid1.Items.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="subid" ReadOnly="True" HeaderText="��Ŀ���">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SubjectName" HeaderText="��Ŀ����"></asp:BoundColumn>
                                                    <asp:ButtonColumn Text="�༭ѡ��" HeaderText="�༭ѡ��" CommandName="editoption">
                                                        <HeaderStyle Width="60" />
                                                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                            Font-Underline="False" HorizontalAlign="Center" />
                                                    </asp:ButtonColumn>
                                                    <asp:TemplateColumn HeaderText="ɾ��">
                                                        <HeaderStyle Width="60" />
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" CommandName="Delete"
                                                                AlternateText="ɾ��" ImageUrl="../../images/del.gif" OnClientClick="return confirm('��ȷ��Ҫִ��ɾ����')"></asp:ImageButton>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="panel2" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <font color="red">��ǰ��Ŀ��<asp:Label ID="NameStrLabel" runat="server"></asp:Label></font>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellspacing="1" cellpadding="0" width="99%" align="center">
                            <tr style="height: 30">
                                <td>ѡ�����ƣ�
                                <asp:TextBox ID="xxname" runat="server" Width="150" CssClass="mytext"></asp:TextBox>
                                    ѡ�����ͣ�
                                <asp:DropDownList ID="ttype" runat="server" Width="80">
                                    <asp:ListItem Value="��ѡ" Selected="true">��ѡ</asp:ListItem>
                                    <asp:ListItem Value="��ѡ">��ѡ</asp:ListItem>
                                    <asp:ListItem Value="�ı�">�ı�</asp:ListItem>
                                </asp:DropDownList>
                                    <asp:Button CssClass="mybtn" ID="Button2" OnClick="Save2_Click" runat="server" Text="�� ��"></asp:Button>
                                </td>
                            </tr>
                        </table>
                        <table cellspacing="1" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td align="center">
                                    <asp:DataGrid ID="DataGrid2" runat="server" Width="99%" AutoGenerateColumns="False" OnItemCommand="Grid2_Mod"
                                        OnUpdateCommand="Grid2_Update" OnCancelCommand="Grid2_Cancel" OnEditCommand="Grid2_Edit" CssClass="hkgv">
                                        <AlternatingItemStyle CssClass="hkAltRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" HorizontalAlign="Center" />
                                        <ItemStyle CssClass="hkRowStyle" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblxh1" runat="server" Text="<%# DataGrid2.Items.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="keyid" ReadOnly="True" HeaderText="ѡ����">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="keyname" HeaderText="ѡ������"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="keytype" ReadOnly="True" HeaderText="ѡ������">
                                                <HeaderStyle Width="100" />
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                    Font-Underline="False" HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="�༭">
                                                <HeaderStyle Width="60" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="false" CommandName="Edit"
                                                        AlternateText="�༭" ImageUrl="../../images/edit.gif"></asp:ImageButton>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Update" AlternateText="����"
                                                        ImageUrl="../../images/save.gif" CausesValidation="false"></asp:ImageButton>
                                                    <asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="false" CommandName="Cancel"
                                                        AlternateText="ȡ��" ImageUrl="../../images/cancel.gif"></asp:ImageButton>
                                                </EditItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="ɾ��">
                                                <HeaderStyle Width="60" />
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="false" CommandName="Delete"
                                                        AlternateText="ɾ��" ImageUrl="../../images/del.gif" OnClientClick="return confirm('��ȷ��Ҫִ��ɾ����')"></asp:ImageButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>
                        <p align="center">
                            <asp:Button CssClass="mybtn" ID="RetBtn" OnClick="Ret_Click" runat="server" Text="�� ��"></asp:Button>
                        </p>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </form>
    <asp:Label ID="codelbl" runat="server" Visible="false"></asp:Label>
</body>
</html>
