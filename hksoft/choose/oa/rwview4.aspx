<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rwview4.aspx.cs" Inherits="hksoft.choose.oa.rwview4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title></title>
    
     <script language="javascript">
<!--
    var openerFiled = "zrbm";

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
    </script>
</head>

<body class="main">
    <form id="choose" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                       
                        <tr>
                            <td colspan="2">查询条件：<asp:DropDownList ID="query_tj" runat="server">
                                <asp:ListItem Value="ui_sex">单位名称</asp:ListItem>
                            </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button CssClass="mybtn" ID="NullBtn" runat="server" Text="置为空值" OnClick="set_null"
                                    CausesValidation="False" />
                                <input type="button" name="BackBtn" value="确定关闭" class="mybtn" onclick="javascript:window.close()" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="bm_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="checkbox" name="chkall" id="Checkbox1" title="全选或全不选" onclick="CheckAll(this.form)"
                                                    style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <input style="width: 16; height: 16" name="chk" id="<%# Eval("bm_mc") %>" title="选择或取消"
                                                    type="checkbox" onclick="javascript:clickemail('<%# Eval("bm_mc") %>')" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="bm_bm" HeaderText="编码">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                       
                                        <asp:BoundField DataField="bm_mc" HeaderText="部门名称"></asp:BoundField>
                                        <asp:BoundField DataField="bm_fzr" HeaderText="部门负责人">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                       
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
