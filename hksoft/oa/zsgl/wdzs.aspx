<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs.aspx.cs" Inherits="hkpro.oa.zsgl.wdzs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>我的知识</title>
    <script>
        function showflow(str) {
            var num = Math.random();
            window.open("wdzs_Show.aspx?tmp=" + num + "&id=" + str + "&LittleId=<%=Request.QueryString["LittleId"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=80,left=100")
        }

        function modflow(str) {
            var num = Math.random();
            window.open("wdzs_Mod.aspx?tmp=" + num + "&id=" + str + "&LittleId=<%=Request.QueryString["LittleId"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=80,left=100")
        }

        function addflow() {
            var num = Math.random();
            window.open("wdzs_Add.aspx?tmp=" + num + "&id=<%=Request.QueryString["LittleId"] %>", "_blank", "height=560, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=80,left=100")
        }

        function Statefrom(str) {

            var aw = 160;
            //控件高
            var ah = 400;
            //计算控件水平位置
            var al = (screen.width - aw) / 2 - 60;
            //计算控件垂直位置
            var at = screen.availHeight - 550;

            var num = Math.random();
            window.open("wdzs_show_state.aspx?tmp=" + num + "&id=" + str + "&LittleId=<%=Request.QueryString["LittleId"] %>", "_blank", "height=" + aw + ", width=" + ah + ",toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=" + at + ",left=" + al + "")
    }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                                    <tr>
                                        <td style="height: 21px; width: 61px; background-image: url(../../images/tab_y.gif)"
                                            align="center">
                                            <a href="wdzs.aspx?i=2" class="mail_top">我的知识</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="wddy.aspx" class="black">我的订阅</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="wdsc.aspx" class="black">我的收藏</a>
                                        </td>
                                        <td align="right">
                                            <b>对应小类：<%=Namefile%></b>&nbsp;
                                        <input type="button" name="AddBtn" id="AddBtn" runat="server" value="新建知识" class="mybtn"
                                            onclick="javascript: addflow();" />
                                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除知识" OnClick="Del_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    DataKeyNames="Id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="选择">
                                            <HeaderStyle Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="True" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" ToolTip="双击每行任意位置可以选中或取消选择框" />
                                                <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Id") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Title") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="知识名称">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="总点击数">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "PointNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="推荐数">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "TjNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="订阅数">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "DyNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="收藏数">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "ScNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="状态">
                                            <ItemTemplate>
                                                <asp:Label ID="lblzt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="相关操作">
                                            <HeaderStyle Width="120px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:Label ID="lableId" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="LNumber" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Number")%>'
                                                    Visible="false"></asp:Label>
                                                <asp:Label ID="lblshow" runat="server"></asp:Label>
                                                <asp:Label ID="lblmod" runat="server"></asp:Label>
                                                <asp:Label ID="lbldesign" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105; height: 25" align="center">
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">全选</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">全消</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">反选</a>
                            </td>
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
        <asp:DropDownList ID="dpform" runat="server" Visible="False">
        </asp:DropDownList>
    </form>
</body>
</html>
