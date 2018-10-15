<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseUserS2.aspx.cs" Inherits="hkpro.Choose.portal.ChooseUserS2" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>请选择用户</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
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
                alert('您未选择任何人员！');
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
                window.opener.setValue_s2(chkSelect());
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
                window.opener.setValue_s2("|");
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
        <table border="0" cellspacing="0" cellpadding="0" style="width: 100%">
            <tr>
                <td style="height: 30px;" align="center">部门：<asp:DropDownList ID="Dept" runat="server">
                </asp:DropDownList>
                    用户名称：<asp:TextBox ID="uName" runat="server" CssClass="mytext"></asp:TextBox>
                    <asp:Button ID="QueBtn" runat="server" CssClass="mybtn" Text="查询" OnClick="Query_Click" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound" DataKeyNames="ui_id"
                        EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="选择">
                                <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="True" />
                                <ItemTemplate>
                                    <input id="rd1" type="radio" value='<%#DataBinder.Eval(Container.DataItem, "ui_id")%>|<%#DataBinder.Eval(Container.DataItem, "ui_desc")%>'
                                        name="Rad" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ui_desc" HeaderText="名称"></asp:BoundField>
                            <asp:BoundField DataField="bm_mc" HeaderText="部门"></asp:BoundField>
                            <asp:BoundField DataField="zwmc" HeaderText="职位"></asp:BoundField>
                        </Columns>
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <RowStyle CssClass="hkRowStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td>
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font class=page_text>共%RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
            <tr>
                <td style="height: 30px;" align="center">
                    <input type="button" value="确定" onclick="return checkbtn();" class="mybtn" id="SaveBtn">
                    <input type="button" value="关闭" onclick="closewin();" class="mybtn" id="CloseBtn">
                    <input type="button" value="清空" onclick="clearwin();" class="mybtn" id="ClearBtn">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

