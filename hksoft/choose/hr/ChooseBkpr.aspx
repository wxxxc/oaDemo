<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseBkpr.aspx.cs" Inherits="hkpro.Choose.oa.ChooseBkpr" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>选择被考评人</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>
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
                alert('您未选择任何人员');
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
            window.returnValue = chkSelect();
            window.close();
        }

        function clearwin() {
            window.returnValue = "||||";
            window.close();
        }

        window.onbeforeunload = function() {
            var n = window.event.screenX - window.screenLeft;
            var b = n > document.documentElement.scrollWidth - 20;
            if (b && window.event.clientY < 0 || window.event.altKey)
            { }
        }

        function closewin() {
            window.close();
        } 
    </script>

    <script>
        function onRadBtn() {
            aa = document.getElementsByName("Rad");

            for (i = 0; i < aa.length; i++) {
                if (aa[i].value == document.getElementById('requeststr').value) {
                    aa[i].checked = true;
                    //alert(i);  
                    return false;
                }
                else {
                    aa[i].checked = false;
                }
            }
        }
    </script>
</head>
<body class="main" onload="onRadBtn()">
    <form id="Form1" method="post" runat="server">
    <asp:TextBox ID="requeststr" runat="server" Style="display: none"></asp:TextBox>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td>
                    <br>
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tbody>
                            <tr>
                                <td align="center" colspan="2">
                                    部门：<asp:DropDownList ID="Dept" runat="server" Width="150">
                                    </asp:DropDownList>
                                    关键字搜索：<asp:DropDownList ID="query_tj" runat="server">
                                        <asp:ListItem Value="a.ui_id">用户编码</asp:ListItem>
                                        <asp:ListItem Value="a.ui_desc">姓名</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                    <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                        CausesValidation="False" AccessKey="f" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                        <Columns>
                                            <asp:TemplateField HeaderText="选择">
                                                <ItemStyle HorizontalAlign="Center" Width="30px" Wrap="True" />
                                                <ItemTemplate>
                                                    <input id="Radio1" type="radio" value='<%#DataBinder.Eval(Container.DataItem, "ui_id")%>|<%#DataBinder.Eval(Container.DataItem, "ui_desc")%>|<%#DataBinder.Eval(Container.DataItem, "bm_mc")%>|<%#DataBinder.Eval(Container.DataItem, "zwmc")%>' name="Rad" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ui_id" HeaderText="用户编码"></asp:BoundField>
                                            <asp:BoundField DataField="ui_desc" HeaderText="姓名"></asp:BoundField>
                                            <asp:BoundField DataField="bm_mc" HeaderText="部门"></asp:BoundField>
                                            <asp:BoundField DataField="zwmc" HeaderText="职位"></asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="hkRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" />
                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                        ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                        NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                        PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                        InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                    </webdiyer:AspNetPager>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px;" align="center" colspan="2">
                                    <input type="button" value="确定" onclick="return checkbtn();" class="mybtn" id="SaveBtn">
                                    <input type="button" value="关闭" onclick="closewin();" class="mybtn" id="CloseBtn">
                                    <input type="button" value="清空" onclick="clearwin();" class="mybtn" id="ClearBtn">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>