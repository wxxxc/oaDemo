<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppComm.aspx.cs" Inherits="hkpro.workflow.work.AppComm" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>

    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>审批意见</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        DataKeyNames="acID" EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="审批意见">
                                <ItemTemplate>
                                    <font color="red">
                                    <%# DataBinder.Eval(Container.DataItem, "acContent")%></font>
                                    <%# DataBinder.Eval(Container.DataItem, "ui_desc")%>
                                    <%# DataBinder.Eval(Container.DataItem, "AddTime", "{0:yyyy-MM-dd HH:mm}")%>
                                    <a href="WorkAttDown.aspx?number=<%# DataBinder.Eval(Container.DataItem, "acAttNewName") %>"
                                        target="_blank" class="gvlink">
                                        <%# DataBinder.Eval(Container.DataItem, "acAttName")%></a>&nbsp;
                                    【步骤名称：<%# DataBinder.Eval(Container.DataItem, "ac_fName")%>】
                                    <asp:Label ID="lblacID" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "acID")%>' Visible="false"></asp:Label>
                                    <asp:Label ID="lbltxt" runat="server"></asp:Label>
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
                <td align="center" height="25">
                    <input id="CloseBtn" class="mybtn" onclick="javascript: window.close()" type="button"
                        value=" 关闭 " />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
