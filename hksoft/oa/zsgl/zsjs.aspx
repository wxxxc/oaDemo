<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zsjs.aspx.cs" Inherits="hkpro.oa.zsgl.zsjs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>知识检索</title>
    <script>
        function showfrom(str) {
            var num = Math.random();
            window.open("zsshow.aspx?tmp=" + num + "&id=" + str + "", "_blank", "height=700, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=80,left=60")
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
                            <td style="height: 40px; width: 350">
                                <asp:RadioButtonList ID="Rbl" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="1" Selected="True">知识标题</asp:ListItem>
                                    <asp:ListItem Value="2">知识描述</asp:ListItem>
                                    <asp:ListItem Value="3">作者</asp:ListItem>
                                    <asp:ListItem Value="4">关键字</asp:ListItem>
                                    <asp:ListItem Value="5">综合搜索</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="nr" runat="server" Width="200px"></asp:TextBox>
                                <asp:Button ID="BtnS" runat="server" Text="快速检索" OnClick="BtnS_Click" CssClass="mybtn" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">搜索条件：<font color="red"><%=tjStr%></font>&nbsp;&nbsp;&nbsp;搜索内容：<font color="red"><%=nrStr%></font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" ShowHeader="false" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderStyle Wrap="False" />
                                            <ItemTemplate>
                                                <table width="100%" border="0" cellpadding="4" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <%# (Container.DataItemIndex+1).ToString()%>.<font color="#0000FF"> <a href="javascript:void(0)"
                                                            onclick="showfrom(<%# DataBinder.Eval(Container.DataItem, "id") %>);"><font color="#0000FF">
                                                                <%#DataBinder.Eval(Container.DataItem, "Title")%></font></a> &nbsp;&nbsp;/&nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "Realname")%>&nbsp;&nbsp;/&nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "LittleName")%></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="1px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <font color="#000000">
                                                            <%#DataBinder.Eval(Container.DataItem, "Content")%></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <font color="#000000">最后更新时间：<%#DataBinder.Eval(Container.DataItem, "LastTime")%>
                                                            －关键字：<%#DataBinder.Eval(Container.DataItem, "KeyWord")%></font>
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
                                </asp:GridView>
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
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nr"
            ErrorMessage="请输入检索条件">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
