<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs.aspx.cs" Inherits="hkpro.oa.zsgl.wdzs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>�ҵ�֪ʶ</title>
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
            //�ؼ���
            var ah = 400;
            //����ؼ�ˮƽλ��
            var al = (screen.width - aw) / 2 - 60;
            //����ؼ���ֱλ��
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
                                            <a href="wdzs.aspx?i=2" class="mail_top">�ҵ�֪ʶ</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="wddy.aspx" class="black">�ҵĶ���</a>
                                        </td>
                                        <td style="width: 61px; background-image: url(../../images/tab_n.gif)" align="center">
                                            <a href="wdsc.aspx" class="black">�ҵ��ղ�</a>
                                        </td>
                                        <td align="right">
                                            <b>��ӦС�ࣺ<%=Namefile%></b>&nbsp;
                                        <input type="button" name="AddBtn" id="AddBtn" runat="server" value="�½�֪ʶ" class="mybtn"
                                            onclick="javascript: addflow();" />
                                            <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��֪ʶ" OnClick="Del_Click"></asp:Button>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                    DataKeyNames="Id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ѡ��">
                                            <HeaderStyle Width="30px" />
                                            <ItemStyle HorizontalAlign="Center" Wrap="True" />
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" ToolTip="˫��ÿ������λ�ÿ���ѡ�л�ȡ��ѡ���" />
                                                <asp:Label ID="lblVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Id") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                                <asp:Label ID="lblNameVisible" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Title") %>'
                                                    Visible="False" Width="0px"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="֪ʶ����">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�ܵ����">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "PointNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="60px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�Ƽ���">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "TjNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="������">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "DyNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="�ղ���">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem, "ScNum")%>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="right" Width="50px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="״̬">
                                            <ItemTemplate>
                                                <asp:Label ID="lblzt" runat="server"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="��ز���">
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
                                <a href="javascript:void(0)" onclick="chkAllw()" class="page_text">ȫѡ</a> <a href="javascript:void(0)"
                                    onclick="nochkAll()" class="page_text">ȫ��</a> <a href="javascript:void(0)" onclick="revchkAll()"
                                        class="page_text">��ѡ</a>
                            </td>
                            <td style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
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
        <asp:DropDownList ID="dpform" runat="server" Visible="False">
        </asp:DropDownList>
    </form>
</body>
</html>
