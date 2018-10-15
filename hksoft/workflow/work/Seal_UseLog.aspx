<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Seal_UseLog.aspx.cs" Inherits="hkpro.workflow.work.Seal_UseLog" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>印章记录</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table align="center" border="0" cellpadding="2" cellspacing="1" width="100%">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="印章使用记录">
                                <ItemTemplate>
                                    <table width="100%" border="0" cellspacing="3" cellpadding="0">
                                        <tr>
                                            <td align="center">
                                                <img src="../../Attach/flow/Seal/<%# DataBinder.Eval(Container.DataItem, "wsNewName")%>"
                                                    style="width: 140px; height: 140px" id="img1" name="img1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <b>印章名称：</b><%# DataBinder.Eval(Container.DataItem, "wsName")%>
                                                <b>&nbsp;&nbsp;&nbsp;&nbsp;使用人：</b><%# DataBinder.Eval(Container.DataItem, "ui_desc")%>
                                                <b>&nbsp;&nbsp;&nbsp;&nbsp;IP：</b><%# DataBinder.Eval(Container.DataItem, "wsIP")%>
                                            &nbsp;&nbsp;&nbsp;&nbsp;<b>时间：</b><%# DataBinder.Eval(Container.DataItem, "AddTime")%>
                                            </td>
                                        </tr>
                                    </table>
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
