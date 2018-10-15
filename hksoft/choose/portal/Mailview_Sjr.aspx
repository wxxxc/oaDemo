<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mailview_Sjr.aspx.cs" Inherits="hkpro.Choose.portal.Mailview_Sjr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>选择收件人（通过勾选最前面的方框完成选择）</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
<!--
    var openerFiled = "sjr";

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
                            <td colspan="2" style="height: 20px">
                                <font color="red">提示：这里只显示用户档案中有电子邮件的用户！</font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:DropDownList ID="yhlx" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                    Visible="false">
                                    <asp:ListItem Value="">全部人员</asp:ListItem>
                                    <asp:ListItem Value="企业" Selected="True">企业</asp:ListItem>
                                    <asp:ListItem Value="供应商">供应商</asp:ListItem>
                                </asp:DropDownList>
                                关键字搜索：<asp:DropDownList ID="query_tj" runat="server">
                                    <asp:ListItem Value="ui_id" Selected="True">用户编码</asp:ListItem>
                                    <asp:ListItem Value="ui_desc">用户名称</asp:ListItem>
                                    <asp:ListItem Value="ui_mail">电子邮件</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="80"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button CssClass="mybtn" ID="NullBtn" runat="server" Text="置为空值" OnClick="set_null"
                                    CausesValidation="False" />
                                <input type="button" name="BackBtn" value="确定关闭" class="mybtn" onclick="javascript:window.close()" />
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                <input type="checkbox" name="chkall" id="Checkbox1" title="全选或全不选" onclick="CheckAll(this.form)"
                                                    style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <input style="width: 16; height: 16" name="chk" id="<%# Eval("ui_mail") %>" title="选择或取消"
                                                    type="checkbox" onclick="javascript:clickemail('<%# Eval("ui_mail") %>');" />
                                            </ItemTemplate>
                                            <HeaderStyle Width="30px" HorizontalAlign="Center"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_id" HeaderText="用户编码">
                                            <HeaderStyle Width="80px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="用户名称"></asp:BoundField>
                                        <asp:BoundField DataField="ui_lx" HeaderText="类型">
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ui_mail" HeaderText="电子邮件"></asp:BoundField>
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
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
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
