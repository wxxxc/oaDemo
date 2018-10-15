<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rwview1.aspx.cs" Inherits="hkpro.Choose.oa.rwview1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ѡ���û���ͨ����ѡ��ǰ��ķ������ѡ��</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
<!--
        var openerFiled = "qtld";
        function clickemail(stremail) {
        select = (document.getElementById(stremail).checked) ? '1' : '0';
        if (select == '1') {
            add_email(stremail);
        } else {
            del_email(stremail);
        }
    }

    function add_email(stremail) {
        addressList = window.opener.document.getElementById(openerFiled).value;
        if (addressList.length == 0) {
            addressList = stremail;
            window.opener.document.getElementById(openerFiled).value = addressList;
        } else {
            if (addressList.indexOf(stremail) == -1) {
                addressList = addressList + "," + stremail;
                window.opener.document.getElementById(openerFiled).value = addressList;
            }
        }
    }

    function del_email(stremail) {
        addressList = window.opener.document.getElementById(openerFiled).value;
        index = addressList.indexOf(stremail);
        if (index == 0) {
            addressList = addressList.substr(stremail.length + 1);
            window.opener.document.getElementById(openerFiled).value = addressList;
        } else if (index > 1) {
            addressList = addressList.substr(0, index - 1) + addressList.substr(index + stremail.length);
            window.opener.document.getElementById(openerFiled).value = addressList;
        }
    }

    function init_checkbox() {
        openerFiled = window.opener.document.getElementById("textfiled").value;
        addressList = window.opener.document.getElementById(openerFiled).value;
        if (addressList.length == 0) {
            return;
        }
        for (var i = 0; i < choose.elements.length; i++) {
            var e = choose.elements[i];
            if (addressList.indexOf(e.id) >= 0) {
                e.checked = true;
            }
        }
    }

    function CheckAll(choose) {
        select = (choose.chkall.checked) ? '1' : '0';
        for (var i = 0; i < choose.elements.length; i++) {
            var e = choose.elements[i];
            if (e.name == "chk") {
                e.checked = choose.chkall.checked;
                if (select == '1') {
                    add_email(e.id);
                }
                else {
                    del_email(e.id);
                }
            }
        }
    }
    //--> 
    </script>
</head>
<body class="main">
    <form id="choose" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <asp:label runat="server" hidden="true" ID="openerFiled"></asp:label>
                            <td colspan="2" style="height: 20px">ѡ���ţ�<asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="250">
                                <asp:ListItem Selected ="true" Text="�쵼&�Ƽ��ɲ����������ĸ�����" Value="1000000"></asp:ListItem>
                                
                            </asp:DropDownList>
                                <%--<asp:CheckBox ID="yn_bmglz" runat="server" Text="ֻ��ʾ���Ź�����" />--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">��ѯ������<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="ui_id" Selected="True">�û�����</asp:ListItem>
                                <asp:ListItem Value="ui_desc">�û�����</asp:ListItem>
                                <asp:ListItem Value="ui_sex">�Ա�</asp:ListItem>
                                <asp:ListItem Value="zwmc">ְλ</asp:ListItem>
                                <asp:ListItem Value="bm_mc">��������</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button CssClass="mybtn" ID="NullBtn" runat="server" Text="��Ϊ��ֵ" OnClick="set_null"
                                    CausesValidation="False" />
                                <input type="button" name="BackBtn" value="ȷ���ر�" class="mybtn" onclick="javascript:window.close()" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="checkbox" name="chkall" id="Checkbox1" title="ȫѡ��ȫ��ѡ" onclick="CheckAll(this.form)"
                                                    style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <input style="width: 16; height: 16" name="chk" id="<%# Eval("ui_id") %>" title="ѡ���ȡ��"
                                                    type="checkbox" onclick="javascript:clickemail('<%# Eval("ui_id") %>');" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_id" HeaderText="�û�����">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="�û�����"></asp:BoundField>
                                        <asp:BoundField DataField="ui_sex" HeaderText="�Ա�">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zwmc" HeaderText="ְλ"></asp:BoundField>
                                        <asp:BoundField DataField="bm_mc" HeaderText="��������"></asp:BoundField>
                                        <asp:ImageField DataImageUrlField="yn_bmglz" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderText="���Ź�����">
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:ImageField>
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
