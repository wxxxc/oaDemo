<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cydxview.aspx.cs" Inherits="hkpro.Choose.portal.Cydxview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ѡ���ö��ţ�����Ҫѡ����м��ɣ�</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
        function chuan(mobj) {
            //��ȡ������汾
            //var bstr = getBrowserType();
            //alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("nr").value = mobj.childNodes[2].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("nr").value = mobj.childNodes[1].innerText;
            //}

            window.close();
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <br>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td align="center" colspan="2">ѡ���ö��ŷ��ࣺ<asp:DropDownList ID="dxlx" runat="server" AutoPostBack="true" Width="180px">
                            </asp:DropDownList>
                                <asp:Button CssClass="mybtn" ID="NullBtn" runat="server" Text="��Ϊ��ֵ" OnClick="set_null"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="60px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="nr" HeaderText="��������"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
