<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pfclsc_View.aspx.cs" Inherits="hkpro.oa.jxkh.Pfclsc_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>评分资料上传</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    上传被考评人的评分材料
                </td>
                <td class="td_base" width="20%">
                </td>
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
                                <HeaderStyle Width="30" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="用户编码">
                                <HeaderStyle Width="10%" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="xm" HeaderText="被考评人姓名">
                                <HeaderStyle Width="15%" />
                                <ItemStyle Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bs" HeaderText="部室">
                                <HeaderStyle Width="15%" />
                                <ItemStyle Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gw" HeaderText="岗位">
                                <HeaderStyle Width="15%" />
                                <ItemStyle Wrap="false" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gwf" HeaderText="岗位分">
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fgzrmc" HeaderText="分管副主管">
                                <HeaderStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fjsl" HeaderText="附件数量">
                                <HeaderStyle Width="60" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作">
                                <HeaderStyle Width="40" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick='window.open("Pfclsc_Sc.aspx?kpid=<%# Eval("sskpid") %>&bid=<%# Eval("bid") %>", "_blank", "height=220, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=110,left=110")' class="gvlink">上传</a>
                                </ItemTemplate>
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
            <tr>
                <td colspan="2" style="height:30" align="center">
                    <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()" accesskey="q" />
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
