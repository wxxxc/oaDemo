<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zshdShow.aspx.cs" Inherits="hkpro.oa.zsgl.zshdShow" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>知识小类维护</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td colspan="4" style="height: 5px"></td>
                        </tr>
                        <tr>
                            <td>关于 <strong><font color="red">
                                <%=Name %></font></strong>的讨论
                            </td>
                            <td colspan="5" align="right" style="height: 25px">
                                <asp:Button ID="BtnB" runat="server" Text=" 返回 " OnClick="BtnB_Click" CssClass="mybtn" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px"></td>
                        </tr>
                    </table>
                    <table width="98%" style="height: 100%" border="0" cellpadding="0" cellspacing="0"
                        align="center">
                        <tr>
                            <td valign="top" colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                    AutoGenerateColumns="False" DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" ShowHeader="false" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderStyle ForeColor="white" Wrap="False" />
                                            <ItemTemplate>
                                                <asp:Label ID="Lid2" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                    Visible="false"></asp:Label>
                                                <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <font color="#666666">发帖人:<%#DataBinder.Eval(Container.DataItem, "Realname")%>&nbsp;&nbsp;&nbsp;<%#DataBinder.Eval(Container.DataItem, "Settime")%></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <br>
                                                            <font color="black"><b>
                                                            <%#DataBinder.Eval(Container.DataItem, "Title")%></b></font>
                                                            <br>
                                                            <br>
                                                            <%#DataBinder.Eval(Container.DataItem, "Content")%><br>
                                                            <br>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="Label2" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br>
                                            </ItemTemplate>
                                            <ItemStyle Wrap="False" />
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
    </form>
</body>
</html>
