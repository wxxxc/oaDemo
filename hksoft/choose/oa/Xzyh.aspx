<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xzyh.aspx.cs" Inherits="hksoft.choose.oa.Xzyh" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>选择用户</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <base target="_self" />
    <script language="javascript">
        function checkbtn() {
            var a = 0

            //001
            //for (var i = 0; i < document.Form1.elements.length; i++) {
            //    if (document.Form1.elements[i].checked == true)
            //    { a = a + 1 }
            //}

            //002
            for (var i = 0; i < document.getElementsByName("Rad").length; i++) {
                if (document.getElementsByName("Rad")[i].checked == true) {
                    a = a + 1
                }
            }

            if (a > 0) {
                sendFromChild();
            }
            else {
                alert('您未选中任何项');
                return false;
            }
        }

        var getFromParent = window.dialogArguments;
        function chkSelect() {
            //001
            //for (var i = 0; i < window.document.Form1.elements.length; i++) {
            //    var e = Form1.elements[i];
            //    if (e.checked)
            //        return e.value;
            //}

            //002
            for (var i = 0; i < window.document.getElementsByName("Rad").length; i++) {
                var e = window.document.getElementsByName("Rad")[i];
                if (e.checked)
                    return e.value;
            }

            var retrunstr = "";
            return retrunstr;
        }

        function sendFromChild() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue(chkSelect());
            }
            else {
                window.returnValue = chkSelect();
            }

            window.close();
        }

        function clearwin() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue("|");
            }
            else {
                window.returnValue = "|";
            }

            window.close();
        }

        window.onbeforeunload = function () {
            var n = window.event.screenX - window.screenLeft;
            var b = n > document.documentElement.scrollWidth - 20;
            if (b && window.event.clientY < 0 || window.event.altKey) {
            }
        }

        function closewin() {
            window.close();
        }
    </script>
</head>
<body class="main">
    <form id="Form1" method="post" runat="server">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top" style="text-align: center">
                    <table border="0" cellspacing="0" cellpadding="0" style="width: 100%">
                        <tr>
                            <td colspan="2" style="height: 30px;">&nbsp;部门：<asp:DropDownList ID="Unit" runat="server">
                            </asp:DropDownList>名称：<asp:TextBox ID="name" runat="server" CssClass="mytext"></asp:TextBox>
                                <asp:Button ID="Button4" runat="server" CssClass="mybtn" Text="查询" OnClick="Button4_Click" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="98%" CssClass="hkgv" PageSize="12" OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField HeaderText="选择">
                                            <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="True" />
                                            <HeaderStyle HorizontalAlign="Center"
                                                Wrap="False" />
                                            <ItemTemplate>
                                                <input id="Radio1" type="radio" value='<%#DataBinder.Eval(Container.DataItem, "ui_id")%>|<%#DataBinder.Eval(Container.DataItem, "ui_desc")%>' name="Rad" />
                                            </ItemTemplate>
                                            <FooterStyle Wrap="True" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="ui_desc" HeaderText="名称">
                                            <HeaderStyle Wrap="False" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 30px; text-align: center;">
                                <input type="button" value="确定" onclick="return checkbtn();" class="mybtn" id="Button1">
                                <input type="button" value="关闭" onclick="closewin();" class="mybtn" id="Button3">
                                <input type="button" value="清空" onclick="clearwin();" class="mybtn" id="Button2">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
