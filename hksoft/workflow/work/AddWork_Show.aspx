<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWork_Show.aspx.cs" Inherits="hkpro.workflow.work.AddWork_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <title>新建工作</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td height="25">
                    <img src="../../images/arrow_r.gif" border="0" alt=""><b>当前表单：<%=Namefile%></b>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <div class="mytable table-responsive">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table" AllowPaging="false" UseAccessibleHeader="false">
                        <Columns>
                            <asp:TemplateField HeaderText="流程名称">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "wfName")%>
                                </ItemTemplate>
                                  <HeaderStyle CssClass="mwp80" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="相关操作">
                             
                                <ItemTemplate>
                                    <a href="#" onclick='window.open("AddWork_Add.aspx?FlowNumber=<%#DataBinder.Eval(Container.DataItem, "wfNo")%>&FormId=<%=Request.QueryString["FormId"]%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">新建工作</a>
                                    <a href="#" onclick='window.open("Flow_Show.aspx?FlowNumber=<%#DataBinder.Eval(Container.DataItem, "wfNo")%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">流程结构</a>
                                    <a href="#" onclick='window.open("Form_Show.aspx?id=<%=Request.QueryString["FormId"]%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">表单模板</a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                  <HeaderStyle CssClass="mw200" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <RowStyle CssClass="hkRowStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                        </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
