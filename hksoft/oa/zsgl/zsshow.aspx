<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zsshow.aspx.cs" Inherits="hkpro.oa.zsgl.zsshow" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('TitleContent').value == '') {
            alert('请输入评论内容');
            form1.TitleContent.focus();
            return false;
        }
    }
</script>
<head id="Head1" runat="server">
    <title></title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="height: 35">
                                <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="17">&nbsp;
                                        </td>
                                        <td valign="top">
                                            <table align="center" border="0" cellpadding="4" cellspacing="1" width="100%">
                                                <tr align="center" valign="bottom">
                                                    <td colspan="4" nowrap="nowrap" style="height: 25px">
                                                        <strong><font size="2">
                                                        <%=ShowTitle%></font></strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作者：<%=Realname%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="22%" align="center" valign="top" nowrap="nowrap">
                                                        <table width="99%" height="182" border="0" cellpadding="0" cellspacing="1">
                                                            <tr>
                                                                <td height="22px" align="center" bgcolor="#666666">
                                                                    <strong><font color="#FFFFFF">作者有话</font></strong>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="160px" valign="top" bgcolor="#FFFFFF" style="line-height: 160%">
                                                                    <%=AthourSay %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="78%" colspan="3" valign="top">
                                                        <table width="99%" border="0" cellspacing="0" cellpadding="4">
                                                            <tr>
                                                                <td>
                                                                    <strong>类别：</strong><%=LittleName%>
                                                                &nbsp;&nbsp;<strong>总点击：</strong><%=PointNum%>
                                                                &nbsp;<strong>总推荐：</strong><%=TjNum%>
                                                                &nbsp;<strong>总订阅：</strong><%=DyNum%>
                                                                &nbsp;<strong>总收藏：</strong><%=ScNum%>&nbsp;<strong>最后更新：</strong><%=LastTime%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td height="15"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="line-height: 180%">
                                                                    <%=Content%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>关键字：<%=KeyWord%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="Btnjrzj" runat="server" Text="进入章节" OnClick="Btnjrzj_Click" CssClass="mybtn" />
                                                                    <asp:Button ID="Btntjzs" runat="server" Text="推荐知识" OnClick="Btntjzs_Click" CssClass="mybtn" />
                                                                    <asp:Button ID="Btndyzs" runat="server" Text="订阅知识" OnClick="Btndyzs_Click" CssClass="mybtn" />
                                                                    <asp:Button ID="Btnsczs" runat="server" Text="收藏知识" OnClick="Btnsczs_Click" CssClass="mybtn" />
                                                                    &nbsp;<asp:Button ID="BtnS" runat="server" Text="禁止" OnClick="BtnS_Click" CssClass="mybtn"
                                                                        Style="color: red" OnClientClick="return confirm('确认要执行禁止吗？')" />
                                                                    <asp:Button ID="Btntj" runat="server" Text="强力推荐" OnClick="Btntj_Click" CssClass="mybtn"
                                                                        Style="width: 70; color: red" />
                                                                    <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript: window.close()" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="100%"
                                                            OnRowDataBound="GridView1_RowDataBound" ShowHeader="false" CssClass="hkgv">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lid" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                                            Visible="false"></asp:Label>
                                                                        <table width="100%" height="63" border="0" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <font color="#666666">评论人:<%#DataBinder.Eval(Container.DataItem, "Realname")%>(<%#DataBinder.Eval(Container.DataItem, "UnitName")%>)&nbsp;&nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "Settime")%></font>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td height="1px"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <font color="black"><b>
                                                                                    <%#DataBinder.Eval(Container.DataItem, "Title")%></b></font>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right">
                                                                                    <asp:Label ID="lb2" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Wrap="False" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <HeaderStyle CssClass="hkHeadStyle" />
                                                            <RowStyle CssClass="hkRowStyle" />
                                                            <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                            <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                            <EmptyDataTemplate>
                                                                <div align="center">
                                                                    暂无任何评论！
                                                                </div>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="height: 22px">
                                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                                            NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                                            PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                                        </webdiyer:AspNetPager>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:TextBox ID="TitleContent" runat="server" Width="759px"></asp:TextBox>
                                            <asp:Button ID="Btntjpl" runat="server" OnClick="Btntjpl_Click" Text="提交评论" CssClass="mybtn" />
                                        </td>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="Number" runat="server" Width="90%" Style="display: none"></asp:TextBox>
        <asp:Label ID="lblUserName" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
