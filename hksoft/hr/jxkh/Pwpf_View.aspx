<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pwpf_View.aspx.cs" Inherits="hkpro.oa.jxkh.Pwpf_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>评委评分</title>
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
                            <td class="form-item" style="width:20%">公共评分参考材料：</td>
                            <td style="width:80%"><asp:Label ID="fujian" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="2">
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
                                        <asp:TemplateField HeaderText="用户编码">
                                            <HeaderStyle Width="10%" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="xm" HeaderText="被考评人姓名">
                                            <HeaderStyle Width="13%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="bs" HeaderText="部室">
                                            <HeaderStyle Width="12%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gw" HeaderText="岗位">
                                            <HeaderStyle Width="10%" />
                                            <ItemStyle Wrap="false" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gwf" HeaderText="岗位分">
                                            <HeaderStyle Width="8%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fgzrmc" HeaderText="分管副主管">
                                            <HeaderStyle Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ykp" HeaderText="应评分项(个)">
                                            <HeaderStyle Width="12%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sjkp" HeaderText="已评分项(个)">
                                            <HeaderStyle Width="12%" />
                                            <ItemStyle HorizontalAlign="Right" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="操作">
                                            <HeaderStyle Width="8%" />
                                            <ItemTemplate>
                                                <asp:Label ID="lblbid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "bid")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblkpid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "sskpid")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblypf" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "ykp")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblsjpf" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "sjkp")%>'
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
                    <input type="button" name="BackBtn" value="返 回" class="btn btn-info" onclick="javascript:location.href='Pwpf.aspx'"
                        accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    
    <asp:Label ID="lblpwlx" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblkpzt" runat="server" Visible="false"></asp:Label>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
