<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zsjs.aspx.cs" Inherits="hkpro.oa.zsgl.zsjs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>֪ʶ����</title>
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
                                    <asp:ListItem Value="1" Selected="True">֪ʶ����</asp:ListItem>
                                    <asp:ListItem Value="2">֪ʶ����</asp:ListItem>
                                    <asp:ListItem Value="3">����</asp:ListItem>
                                    <asp:ListItem Value="4">�ؼ���</asp:ListItem>
                                    <asp:ListItem Value="5">�ۺ�����</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:TextBox ID="nr" runat="server" Width="200px"></asp:TextBox>
                                <asp:Button ID="BtnS" runat="server" Text="���ټ���" OnClick="BtnS_Click" CssClass="mybtn" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">����������<font color="red"><%=tjStr%></font>&nbsp;&nbsp;&nbsp;�������ݣ�<font color="red"><%=nrStr%></font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" ShowHeader="false" CssClass="hkgv">
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
                                                            <font color="#000000">������ʱ�䣺<%#DataBinder.Eval(Container.DataItem, "LastTime")%>
                                                            ���ؼ��֣�<%#DataBinder.Eval(Container.DataItem, "KeyWord")%></font>
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
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="nr"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
