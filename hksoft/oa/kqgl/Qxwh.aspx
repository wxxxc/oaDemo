<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qxwh.aspx.cs" Inherits="hkpro.oa.kqgl.Qxwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>员工考勤设定</title>
</head>
<body class="main" onload="remove_load();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td>
                            <table cellspacing="0" cellpadding="0" width="100%" border="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        所属部门：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ssbm" runat="server">
                                        </asp:DropDownList>
                                        快速检索：<asp:DropDownList ID="query_tj" runat="server">
                                            <asp:ListItem Value="a.ui_id" Selected="True">用户编码</asp:ListItem>
                                            <asp:ListItem Value="a.ui_desc">姓名</asp:ListItem>
                                            <asp:ListItem Value="a.ui_status">状态</asp:ListItem>
                                            <asp:ListItem Value="b.zwmc">职位</asp:ListItem>
                                            <asp:ListItem Value="e.qy_qc">所属公司</asp:ListItem>
                                            <asp:ListItem Value="kqid">对应考勤ID</asp:ListItem>
                                            <asp:ListItem Value="Kqspry1">部门考勤审批人员</asp:ListItem>
                                            <asp:ListItem Value="Kqspry2">考勤审批分管领导</asp:ListItem>
                                            <asp:ListItem Value="Kqspry3">考勤审批中心领导</asp:ListItem>
                                            <asp:ListItem Value="Kqglry">考勤管理人员</asp:ListItem>
                                            <asp:ListItem Value="Tskqry">特殊考勤人员</asp:ListItem>
                                            <asp:ListItem Value="Ynnjtj">参与部门年假统计</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                        <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click"
                                            CausesValidation="False"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" rowspan="2">
                                        批量设置工作日：
                                    </td>
                                    <td>
                                        以<asp:TextBox ID="UserName1" runat="server" CssClass="mytext" Width="60"></asp:TextBox><img
                                            id="img1" onclick="chooseuser();" alt="" src="../../Images/choose.gif" border="0"
                                            runat="server" />的工作日设定为标准，更新选中人员<asp:DropDownList ID="yhfw" runat="server" Visible="false">
                                                <asp:ListItem Text="当前勾选人员" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="全部人员" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        在<asp:TextBox ID="ksrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="75px"></asp:TextBox>至<asp:TextBox ID="jsrq" onclick="SelectDate(this,'yyyy-MM-dd')"
                                                runat="server" CssClass="mytext" Width="75px"></asp:TextBox>范围内的工作日信息
                                        <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="确定" OnClick="Save_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <font color="red">注：由于批量设置时会占用很多服务器资源，所以每次批量设置时间范围不能超过3个月</font>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="right">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                 DataKeyNames="ui_id"   EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                <Columns>
                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderStyle Width="30px"></HeaderStyle>
                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16;
                                                height: 16" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="编码">
                                        <ItemTemplate>
                                            <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ui_desc" HeaderText="姓名">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_sex" HeaderText="性别">
                                        <HeaderStyle Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="bm_mc" HeaderText="部门">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zwmc" HeaderText="职位">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqspry1" HeaderText="部门考勤审批人员">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqspry2" HeaderText="考勤审批分管领导">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqspry3" HeaderText="考勤审批中心领导">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqglry" HeaderText="考勤管理人员">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqid" HeaderText="对应考勤ID">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Tskqry" HeaderText="特殊考勤人员">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_rzrq" HeaderText="入职日期" DataFormatString="{0:yyyy-MM-dd}"
                                        HtmlEncode="False">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_status" HeaderText="状态">
                                        <HeaderStyle Width="35px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="操作">
                                        <HeaderStyle Width="100" />
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:popView('Qxwh_View.aspx?id=<%# Eval("ui_id") %>')"
                                                class="gvlink">基础设置</a> <a href="#" onclick="javascript:popView('Qxwh_Gzrsz.aspx?id=<%# Eval("ui_id") %>')"
                                                    class="gvlink">工作日</a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle CssClass="hkRowStyle" />
                                <HeaderStyle CssClass="hkHeadStyle" />
                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
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
    <asp:TextBox ID="UserID1" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName1"
        ErrorMessage="请选择参照人员">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ksrq"
        ErrorMessage="请选择开始日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="jsrq"
        ErrorMessage="请选择截止日期">&nbsp;
    </asp:RequiredFieldValidator>
    <script language="javascript">
        var uIdName1;
        function chooseuser() {
            var rdm = Math.random();
            var str = "" + document.getElementById('UserID1').value + "|" + document.getElementById('UserName1').value + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("../../Choose/portal/ChooseUserS.aspx?tmp=" + rdm + "&rqstr=" + str + "", 'newwindow', 'height=480,width=550,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
            }
            else {
                uIdName1 = window.showModalDialog("../../Choose/portal/ChooseUserS.aspx?tmp=" + rdm + "&rqstr=" + str + "", "newwindow", "dialogWidth:550px;DialogHeight=480px;status:no;scroll=yes;help:no");
            }

            var arr = uIdName1.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID1").value = arr[0];
                document.getElementById("UserName1").value = arr[1];
            }
        }

        function setValue_s(str) {
            var arr = str.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID1").value = arr[0];
                document.getElementById("UserName1").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
