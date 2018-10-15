<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpjk_View.aspx.cs" Inherits="hkpro.oa.jxkh.Kpjk_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>考评过程监控</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    当前考评项目：<asp:Label ID="lblxmmc" runat="server" ForeColor="Yellow"></asp:Label>
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" cellpadding="0" cellspacing="0" align="center" class="form" width="100%">
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" AllowPaging="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="评委编码">
                                            <HeaderStyle Width="20%" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("pid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="pwxm" HeaderText="评委姓名">
                                            <HeaderStyle Width="25%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="pfxm" HeaderText="应评分项(个)">
                                            <HeaderStyle Width="20%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sjpf" HeaderText="已评分项(个)">
                                            <HeaderStyle Width="20%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="操作">
                                            <HeaderStyle Width="10%" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblpid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "pid")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblpfxm" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "pfxm")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblsjpf" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "sjpf")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lbltxt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" Wrap="False" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <FooterStyle CssClass="hkBottomStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 30" align="center">
                    <asp:Button CssClass="mybtn" ID="ZeroBtn" runat="server" Text="总经理评分补零" OnClick="Zero_Click"
                        OnClientClick="return confirm('确认要将总经理的评分设置为0吗？')"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="结束考评" OnClick="Save_Click"
                        OnClientClick="return confirm('确认要结束本次考评吗？')"></asp:Button>
                    <input type="button" name="BackBtn" value="返 回" class="btn btn-info" onclick="javascript:location.href='Kpjk.aspx'"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
