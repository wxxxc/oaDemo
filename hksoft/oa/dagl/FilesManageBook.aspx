<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageBook.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageBook" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>文件管理</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script>
        function Statefrom(str) {
            var aw = 160;
            //控件高
            var ah = 400;
            //计算控件水平位置
            var al = (screen.width - aw) / 2 - 60;
            //计算控件垂直位置
            var at = screen.availHeight - 550;

            var num = Math.random();
            window.open("FilesManageBook_state.aspx?tmp=" + num + "&id=" + str + "&LittleId=<%=Request.QueryString["LittleId"] %>", "_blank", "height=" + aw + ", width=" + ah + ",toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=" + at + ",left=" + al + "")
    }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td style="height: 25px">文&nbsp;件&nbsp;号:<asp:TextBox ID="jsNum" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                主&nbsp;题&nbsp;词:<asp:TextBox ID="jsName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                文件标题:<asp:TextBox ID="jsTitle" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                辅&nbsp;标&nbsp;题:<asp:TextBox ID="jsOtherTitle" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                发文单位:<asp:TextBox ID="jsFwCompany" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">发文日期:<asp:TextBox ID="jsFwTime" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                密&nbsp;&nbsp;&nbsp;&nbsp;级:<asp:TextBox ID="jsMiji" runat="server" CssClass="mytext"
                                    Width="90"></asp:TextBox>
                                紧急等级:<asp:TextBox ID="jsDengji" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                文件分类:<asp:TextBox ID="jsWjType" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                公文类别:<asp:TextBox ID="jsGwType" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 25px">所属案卷:<asp:TextBox ID="jsFilesName" runat="server" CssClass="mytext" Width="90"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查 询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <input type="button" id="AddBtn" name="AddBtn" value="增 加" class="mybtn" onclick="javascript: popAdd('FilesManageBook_Add.aspx');"
                                    runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Num" HeaderText="文件号">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Title" HeaderText="文件标题">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Miji_MC" HeaderText="密级">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="FilesName" HeaderText="所属案卷">
                                            <ItemStyle Wrap="False" />
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="状态">
                                            <HeaderStyle Wrap="False" />
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="相关操作">
                                            <HeaderStyle Wrap="False" Width="200px" />
                                            <ItemTemplate>
                                                <asp:Label ID="HyId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <a href="#" onclick="javascript:popMod('FilesManageBook_show.aspx?id=<%# Eval("id") %>')"
                                                    class="gvlink">查看</a> <a href="#" onclick="javascript:popMod('FilesManageBook_update.aspx?id=<%# Eval("id") %>')"
                                                        class="gvlink">修改</a>
                                                <asp:LinkButton ID="Shanchu" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="Shanchu" CssClass="gvlink">删除</asp:LinkButton>
                                                <a href="#" onclick="javascript:popMod('FilesManageBook_jyjl.aspx?id=<%# Eval("id") %>')"
                                                    class="gvlink">借阅记录</a>
                                                <asp:LinkButton ID="ShouHui" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="ShouHui" CssClass="gvlink">收回</asp:LinkButton>
                                                <asp:LinkButton ID="XiaoHui" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID") %>'
                                                    CommandName="XiaoHui" CssClass="gvlink">销毁</asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="220px" />
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
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
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
