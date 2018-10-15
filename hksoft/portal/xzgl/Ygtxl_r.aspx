<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ygtxl_r.aspx.cs" Inherits="hkpro.portal.xzgl.Ygtxl_r" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>员工通讯录</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script>
        function delf() {
            if (!confirm("是否确定删除此部门？"))
                return false;
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0" class="form">
                        <tr>
                            <td align="right">姓名：
                            </td>
                            <td>
                                <asp:TextBox ID="jsName" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right">职位：
                            </td>
                            <td>
                                <asp:TextBox ID="jsPost" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                            <td align="right">性别：
                            </td>
                            <td>
                                <asp:TextBox ID="jsSex" runat="server" CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td colspan="5">
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button CssClass="mybtn" ID="AddBtn" runat="server" Text="增加" OnClick="ImageButton1_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="showbtn" runat="server" Text="查看" OnClick="ImageButton6_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="updatebtn" runat="server" Text="修改" OnClick="ImageButton2_Click"></asp:Button>
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除" OnClick="ImageButton3_Click"></asp:Button>
                                <a href="javascript:void(0)" onclick="chkAllw()" class="gvlink">全选</a>
                                <a href="javascript:void(0)" onclick="revchkAll()" class="gvlink">反选</a>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">姓氏索引：
                            </td>
                            <td colspan="5"><%=XMStr %></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="lblxh" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="选择">
                                <ItemStyle HorizontalAlign="Center" Wrap="True" Width="30px" />
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="CheckSelect" runat="server" />
                                    <asp:Label ID="LabVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                    <asp:Label ID="LabNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>'
                                        Visible="False" Width="0px"></asp:Label>
                                </ItemTemplate>
                                <FooterStyle Wrap="True" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Name" HeaderText="姓名"></asp:BoundField>
                            <asp:BoundField DataField="Post" HeaderText="职位"></asp:BoundField>
                            <asp:BoundField DataField="Officetel" HeaderText="办公电话"></asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="hkRowStyle" />
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td align="right" width="15%" style="height: 30; width: 15%">类别操作：</td>
                <td colspan="3" style="width: 85%">
                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">新建子类别</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">修改类别</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" OnClick="LinkButton5_Click">删除此类别</asp:LinkButton>
                    类别名：<%=Namefile %>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
