<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign.aspx.cs" Inherits="hkpro.workflow.form.FormDesign" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script>
        function FormShow(str) {
            var rdm = Math.random();
            window.open("FormDesign_Show.aspx?tmp=" + rdm + "&id=" + str + "", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
        }

        function FormMod(str) {
            var rdm = Math.random();
            window.open("FormDesign_Mod.aspx?tmp=" + rdm + "&id=" + str + "", "_blank", "height=650 width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
        }

        function FormAdd() {
            var rdm = Math.random();
            window.open("FormDesign_Add.aspx?tmp=" + rdm + "", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")
        }
    </script>
    <title>�����</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td style="height: 38px">&nbsp;���ټ�����<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="fName" Selected="True">������</asp:ListItem>
                                <asp:ListItem Value="fcName">������</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="150"></asp:TextBox>
                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-info" ID="QueBtn" runat="server" Text=" ��ѯ " OnClick="Query_Click" />
                                <input type="button" name="AddBtn" id="AddBtn" runat="server" value=" ���� " class="btn btn-success"
                                    onclick="javascript: FormAdd();" />
                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text=" ɾ�� " OnClick="Del_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                   <div class="mytable table-responsive">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    DataKeyNames="fID" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../Images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle CssClass="mw30" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ѡ��">
                                            <HeaderStyle CssClass="mw30" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="True" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" ToolTip="˫��ÿ������λ�ÿ���ѡ�л�ȡ��ѡ���" />
                                                <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fID") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "fNAME") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fID" HeaderText="��ID">
                                            <HeaderStyle CssClass="hidden" />
                                            <ItemStyle CssClass="hidden" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="������">
                                            <HeaderStyle />
                                            <ItemTemplate>
                                                <%--<a href="#" onclick="javascript:popMod('FormDesign_Show.aspx?id=<%# Eval("fID") %>')" class="gvlink">--%>
                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("fNAME") %>'></asp:Label>
                                                <%--</a>--%>
                                            </ItemTemplate>
                                                <HeaderStyle CssClass="mwp50" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fcName" HeaderText="������">  
                                              <HeaderStyle CssClass="mwp50" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��ز���">
                                            <HeaderStyle CssClass="mw100" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="javascript:void(0)" onclick="FormShow(<%# DataBinder.Eval(Container.DataItem, "fID") %>);"
                                                    class="gvlink">�鿴</a> <a href="javascript:void(0)" onclick="FormMod(<%# DataBinder.Eval(Container.DataItem, "fID") %>);"
                                                        class="gvlink">�޸�</a>
                                            </ItemTemplate>
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
                </td>
            </tr>
            <tr>
                <td>
                    <table style="width: 100%;" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 105; height: 25" align="center">
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">ȫѡ</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">ȫ��</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">��ѡ</a>
                            </td>
                            <td>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font class=page_text>��%RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                    NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                    PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
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
