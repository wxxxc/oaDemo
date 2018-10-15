<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mkview.aspx.cs" Inherits="hkpro.Choose.portal.Mkview" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>选择模块（单击要选择的行即可）</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
        function chuan(mobj)
            //双击将选定行的名称赋值给母窗口并关闭
        {
            //获取浏览器版本
            //var bstr = getBrowserType();
            ////alert(bstr);
            //if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.document.getElementById("jrmk").value = mobj.childNodes[1].textContent;
            //}
            //else {
            //    window.opener.document.getElementById("jrmk").value = mobj.childNodes[0].innerText;
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
                            <td align="center" colspan="2">模块名称：<asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                    CausesValidation="False" />
                                <asp:Button CssClass="mybtn" ID="NullBtn" runat="server" Text="置为空值" OnClick="set_null"
                                    CausesValidation="False" />
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:HyperLinkField HeaderText="模块编码" DataTextField="modu_id" NavigateUrl="#">
                                            <HeaderStyle CssClass="main" />
                                        </asp:HyperLinkField>
                                        <asp:BoundField DataField="modu_mc" HeaderText="模块名称"></asp:BoundField>
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
