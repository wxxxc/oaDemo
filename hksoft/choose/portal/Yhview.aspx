<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yhview.aspx.cs" Inherits="hkpro.Choose.portal.Yhview" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ѡ���û�������Ҫѡ����м��ɣ�</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
        function chuan(mobj)
            //˫����ѡ���е����Ƹ�ֵ��ĸ���ڲ��ر�,renyuan_view�и��������� renyuan�и����Ǳ���
        {
            //window.opener.document.body.all.rysq_view.value=mobj.childNodes[1].innerText;
            //window.opener.document.body.all.rysq.value = mobj.childNodes[0].innerText;

            //��ȡ������汾
            //var bstr = getBrowserType();
            //alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("rysq_view").value = mobj.childNodes[2].textContent;
                window.opener.document.getElementById("rysq").value = mobj.childNodes[1].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("rysq_view").value = mobj.childNodes[1].innerText;
            //    window.opener.document.getElementById("rysq").value = mobj.childNodes[0].innerText;
            //}

            window.close();
        }

        function chuan1(mobj) {
            //window.opener.document.body.all.rysq.value = mobj.childNodes[0].innerText;

            //��ȡ������汾
            //var bstr = getBrowserType();
            //alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("rysq").value = mobj.childNodes[1].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("rysq").value = mobj.childNodes[0].innerText;
            //}

            window.close();
        }

        function chuan2(mobj) {
            //window.opener.document.body.all.jdr.value = mobj.childNodes[0].innerText;
            //��ȡ������汾
            //var bstr = getBrowserType();
            //alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("jdr").value = mobj.childNodes[1].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("jdr").value = mobj.childNodes[0].innerText;
            //}

            window.close();
        }

        function chuan3(mobj) {
            //window.opener.document.body.all.xgr.value = mobj.childNodes[0].innerText;

            //��ȡ������汾
            //var bstr = getBrowserType();
            //alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("xgr").value = mobj.childNodes[1].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("xgr").value = mobj.childNodes[0].innerText;
            //}

            window.close();
        }

        function chuan4(mobj) {
            //window.opener.document.body.all.fzr.value = mobj.childNodes[1].innerText;
            //��ȡ������汾
            //var bstr = getBrowserType();
            //alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("fzr").value = mobj.childNodes[2].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("fzr").value = mobj.childNodes[1].innerText;
            //}

            window.close();
        }

        function chuan_null() {
            //window.opener.document.body.all.rysq_view.value="";
            //window.opener.document.body.all.rysq.value = "";

            window.opener.document.getElementById("rysq_view").value = "";
            window.opener.document.getElementById("rysq").value = "";

            window.close();
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
                            <td align="center" colspan="2">�ؼ���������<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="ui_id" Selected="True">�û�����</asp:ListItem>
                                <asp:ListItem Value="ui_desc">����</asp:ListItem>
                                <asp:ListItem Value="ui_role">��ɫ</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button class="mybtn" ID="NullBtn" runat="server" Text="��Ϊ��ֵ" OnClick="set_null"
                                    CausesValidation="False" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:HyperLinkField HeaderText="�û�����" DataTextField="ui_id" NavigateUrl="#">
                                            <HeaderStyle Width="70px" CssClass="main" />
                                        </asp:HyperLinkField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="����">
                                            <HeaderStyle Width="100px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="role_name" HeaderText="��ɫ"></asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
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
    </form>
</body>
</html>
