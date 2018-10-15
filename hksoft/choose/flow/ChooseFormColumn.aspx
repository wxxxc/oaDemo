<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseFormColumn.aspx.cs"
    Inherits="hkpro.Choose.flow.ChooseFormColumn" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>请选择表单字段</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <base target="_self" />

    <script language="javascript">
        function checkbtn() {
            var a = 0
            //001
            //for (var i = 0; i < document.Form1.elements.length; i++) {
            //    if (document.Form1.elements[i].checked == true) {
            //        a = a + 1
            //    }
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
                alert('您未选择任何表单字段！');
                return false;
            }
        }

        var getFromParent = window.dialogArguments;
        function CheckSelect() {
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
                window.opener.setValue_fc(CheckSelect());
            }
            else {
                window.returnValue = CheckSelect();
            }

            window.close();
        }

        function clearwin() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue_fc("||");
            }
            else {
                window.returnValue = "||";
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
<body scroll="no" class="main">
    <form id="Form1" method="post" runat="server">
        <asp:TextBox ID="rqstr" runat="server" Style="display: none"></asp:TextBox>
        <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
            <tr>
                <td colspan="2" style="height: 31px; text-align: left">&nbsp;字段名称：<asp:TextBox ID="name" runat="server"></asp:TextBox>
                    <asp:Button ID="QueBtn" runat="server" CssClass="mybtn" Text="查询" OnClick="QueBtn_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 31px; text-align: center;">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="选择">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                                <ItemTemplate>
                                    <input id="Radio1" type="radio" value='<%#DataBinder.Eval(Container.DataItem, "clNo")%>|<%#DataBinder.Eval(Container.DataItem, "clName")%>|<%#DataBinder.Eval(Container.DataItem, "clType")%>' name="Rad" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="clName" HeaderText="名称"></asp:BoundField>
                        </Columns>
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <RowStyle CssClass="hkRowStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 31px; text-align: center;">
                    <input type="button" value="确定" onclick="return checkbtn();" class="mybtn" id="SaveBtn">
                    <input type="button" value="清空" onclick="clearwin();" class="mybtn" id="ClearBtn">
                    <input type="button" value="关闭" onclick="closewin();" class="mybtn" id="CloseBtn">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
