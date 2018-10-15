<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dbsx.aspx.cs" Inherits="hkpro.Dbsy" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>待办事项</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script src="CssJs/MyJs_crm.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript">
        function change_view(obj_name) {
            var aa = document.getElementById(obj_name);
            if (aa.style.display == "") {
                aa.style.display = "none";
            }
            else {
                aa.style.display = "";
            }
        }
    </script>
</head>
<body class="main">
    <form id="Form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center">
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="index_title">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="cmdNewFlow" runat="server" CssClass="mybtn" Text="刷 新" OnClick="Refresh_Click"></asp:Button>&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <table width="98%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="height: 12px"></td>
                                    </tr>
                                    <asp:Panel ID="w01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('w01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_w01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的待办工作(共<asp:Label ID="w01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_w01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="w01" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_w01" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_w01" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:BoundField DataField="wSerialNo" HeaderText="流水号">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="50px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="工作标题">
                                                                            <ItemTemplate>
                                                                                <%# DataBinder.Eval(Container.DataItem, "wTitle")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="工作文号">
                                                                            <ItemTemplate>
                                                                                <%# DataBinder.Eval(Container.DataItem, "wName")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="发起人"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="表单类型">
                                                                            <ItemTemplate>
                                                                                <%# DataBinder.Eval(Container.DataItem, "fName")%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="当前步骤">
                                                                            <ItemTemplate>
                                                                                <%# DataBinder.Eval(Container.DataItem, "NextNodeName")%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="流程操作">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemTemplate>
                                                                                <a href='workflow/Work/HandleWork_Audi.aspx?id=<%# DataBinder.Eval(Container.DataItem, "wID") %>&UpNodeId=<%# DataBinder.Eval(Container.DataItem, "NextNodeID") %>&FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FK_wfno") %>&FormId=<%# DataBinder.Eval(Container.DataItem, "FK_fid") %>'
                                                                                    class="gvlink" target="_blank">办理</a> <a href='workflow/Work/HandleWork_EnTrust.aspx?id=<%# DataBinder.Eval(Container.DataItem, "wID") %>'
                                                                                        class="gvlink" target="_blank">委托</a> <a href='#' onclick='window.open ("workflow/Work/QueryWork_Exp.aspx?id=<%# DataBinder.Eval(Container.DataItem, "wID") %>", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")'
                                                                                            class="gvlink">导出</a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o06p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o06')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o06" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的会议申请(共<asp:Label ID="o06_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o06" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o06" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o06" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o06" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_o06.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="编码">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="oa/hygl/hysp.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labehyid17" runat="server" Text='<%# Bind("id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="hyzt" HeaderText="会议主题"></asp:BoundField>
                                                                        <asp:BoundField DataField="kssj" HeaderText="开始时间">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="hys_mc" HeaderText="召开地点"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="发起人">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fqr") %>'></asp:Label>-<asp:Label
                                                                                    ID="Labelfqr" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o07p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o07')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o07" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的车辆申请(共<asp:Label ID="o07_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o07" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o07" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o07" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o07" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_o07.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="路线">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="oa/clgl/cldd.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("fcdd") %>'></asp:Label>-<asp:Label
                                                                                        ID="Label38" runat="server" Text='<%# Bind("dddd") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请部门">
                                                                            <HeaderStyle Width="150px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sqbm") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label37" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请人">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("sqr") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label39" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="czrs" HeaderText="乘坐人数">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o08p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o08')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o08" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的资源申请(共<asp:Label ID="o08_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o08" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o08" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o08" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o08" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_o08.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请资源">
                                                                            <HeaderStyle Width="250px" />
                                                                            <ItemTemplate>
                                                                                <a href="oa/zygl/zydd.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="labelzyid23" runat="server" Text='<%# Bind("sqzy") %>'></asp:Label>-<asp:Label
                                                                                        ID="Label31" runat="server" Text='<%# Bind("zymc") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="使用部门">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("sybm") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label3" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sysj" HeaderText="使用时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ghsj" HeaderText="归还时间" DataFormatString="{0:yy-MM-dd HH:mm}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o09p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o09')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o09" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的个人计划(共<asp:Label ID="o09_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o09" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o09" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o09" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o09" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="jhid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_o09.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="计划年份">
                                                                            <HeaderStyle Width="60px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                            <ItemTemplate>
                                                                                <a href="oa/jhgl/grjh.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="labeljhid26" runat="server" Text='<%# Bind("jhnf") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="jhyf" HeaderText="月份">
                                                                            <HeaderStyle Width="40px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ztmb" HeaderText="总体目标"></asp:BoundField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="计划人">
                                                                            <HeaderStyle Width="90" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sprNames" HeaderText="参与审批人"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o10p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o10')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o10" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的部门计划(共<asp:Label ID="o10_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o10" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o10" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o10" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o10" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="jhid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_o10.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="计划年份">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                            <ItemTemplate>
                                                                                <a href="oa/jhgl/bmjh.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="labeljhid27" runat="server" Text='<%# Bind("jhnf") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="jhyf" HeaderText="月份">
                                                                            <HeaderStyle Width="40px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ztmb" HeaderText="总体目标"></asp:BoundField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="计划人">
                                                                            <HeaderStyle Width="90" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sprNames" HeaderText="参与审批人"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o12p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o12')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o12" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            距购买日30/180/300天的客户(共<asp:Label ID="o12_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o12" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o12" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o12" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o12" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="khid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_o12.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="购买人">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('oa/khgl/khhf01_view.aspx?id=<%# Eval("khid") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblo12" runat="server" Text='<%# Bind("gmr") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="gmrdw" HeaderText="单位"></asp:BoundField>
                                                                        <asp:BoundField DataField="gmrzw" HeaderText="职务">
                                                                            <HeaderStyle Width="70px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="gmrq" HeaderText="购买日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="spmc" HeaderText="商品名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="gmsl" HeaderText="购买数量">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="tx" HeaderText="提醒周期">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o21p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o21')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o21" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的年度费用计划(共<asp:Label ID="o21_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o21" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o21" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o21" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o21" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh" runat="server" Text="<%# GridView_o21.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Title" HeaderText="计划主题"></asp:BoundField>
                                                                        <asp:BoundField DataField="JhBmName" HeaderText="计划部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="Jhnf" HeaderText="计划年份" DataFormatString="{0:yyyy}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" Width="60px" />
                                                                        </asp:BoundField>         
                                                                        <asp:BoundField DataField="State" HeaderText="状态">
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="FqRealname" HeaderText="发起人">
                                                                             <ItemStyle Wrap="False"  Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="步骤与流程图">
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' onclick='window.open ("oa/ysgl/Yslc_Show_Lc.aspx?FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&NodeName=<%# DataBinder.Eval(Container.DataItem, "UpNodeName") %>", "_blank", "height=660, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">
                                                                                    <%# DataBinder.Eval(Container.DataItem, "UpNodeName") %></a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="流程操作">
                                                                            <HeaderStyle Wrap="False" Width="60px" />
                                                                            <ItemTemplate>
                                                                                <a href='oa/ysgl/Ndjhsp_Bl.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id") %>&UpNodeId=<%# DataBinder.Eval(Container.DataItem, "UpNodeId") %>&FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&FormId=<%# DataBinder.Eval(Container.DataItem, "FormId") %>' class="gvlink" target="_blank">办理</a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o22p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o22')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o22" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的计划费用报销(共<asp:Label ID="o22_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o22" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o22" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o22" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o22" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh" runat="server" Text="<%# GridView_o22.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Title" HeaderText="报销主题"></asp:BoundField>
                                                                        <asp:BoundField DataField="BxBmName" HeaderText="报销部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="Bxrq" HeaderText="报销日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" Width="80px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="State" HeaderText="状态">
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="FqRealname" HeaderText="发起人">
                                                                            <ItemStyle Wrap="False" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="步骤与流程图">
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' onclick='window.open("oa/ysgl/Yslc_Show_Lc.aspx?FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&NodeName=<%# DataBinder.Eval(Container.DataItem, "UpNodeName") %>", "_blank", "height=660, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">
                                                                                    <%# DataBinder.Eval(Container.DataItem, "UpNodeName") %></a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="流程操作">
                                                                            <HeaderStyle Wrap="False" Width="60px" />
                                                                            <ItemTemplate>
                                                                                <a href='oa/ysgl/Jhbxsp_Bl.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id") %>&UpNodeId=<%# DataBinder.Eval(Container.DataItem, "UpNodeId") %>&FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&FormId=<%# DataBinder.Eval(Container.DataItem, "FormId") %>' class="gvlink" target="_blank">办理</a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o23p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o23')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o23" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的直接费用报销(共<asp:Label ID="o23_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o23" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o23" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o23" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o23" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh" runat="server" Text="<%# GridView_o23.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Title" HeaderText="报销主题"></asp:BoundField>
                                                                        <asp:BoundField DataField="BxBmName" HeaderText="报销部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="Bxrq" HeaderText="报销日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" Width="60px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="State" HeaderText="状态">
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="FqRealname" HeaderText="发起人">
                                                                            <ItemStyle Wrap="False" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="步骤与流程图">
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' onclick='window.open ("oa/ysgl/Yslc_Show_Lc.aspx?FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&NodeName=<%# DataBinder.Eval(Container.DataItem, "UpNodeName") %>", "_blank", "height=660, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">
                                                                                    <%# DataBinder.Eval(Container.DataItem, "UpNodeName") %></a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="流程操作">
                                                                            <HeaderStyle Wrap="False" Width="60px" />
                                                                            <ItemTemplate>
                                                                                <a href='oa/ysgl/Zjbxsp_Bl.aspx?id=<%# DataBinder.Eval(Container.DataItem, "id") %>&UpNodeId=<%# DataBinder.Eval(Container.DataItem, "UpNodeId") %>&FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&FormId=<%# DataBinder.Eval(Container.DataItem, "FormId") %>' class="gvlink" target="_blank">办理</a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="o24p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('o24')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_o24" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的计划费用调整(共<asp:Label ID="o24_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_o24" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="o24" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_o24" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_o24" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh" runat="server" Text="<%# GridView_o24.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Title" HeaderText="调整主题"></asp:BoundField>
                                                                        <asp:BoundField DataField="TzBmName" HeaderText="调整部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="Tzrq" HeaderText="调整日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" Width="80px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="State" HeaderText="状态">
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="FqRealname" HeaderText="发起人">
                                                                            <ItemStyle Wrap="False" Width="90px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="步骤与流程图">
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' onclick='window.open ("oa/ysgl/Yslc_Show_Lc.aspx?FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&NodeName=<%# DataBinder.Eval(Container.DataItem, "UpNodeName") %>", "_blank", "height=660, width=800,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no,top=0,left=0")' class="gvlink">
                                                                                    <%# DataBinder.Eval(Container.DataItem, "UpNodeName") %></a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="流程操作">
                                                                            <HeaderStyle Wrap="False" Width="60px" />
                                                                            <ItemTemplate>
                                                                                <a href='oa/ysgl/Jhtzsp_Bl.aspx?Id=<%# DataBinder.Eval(Container.DataItem, "id") %>&UpNodeId=<%# DataBinder.Eval(Container.DataItem, "UpNodeId") %>&FlowNumber=<%# DataBinder.Eval(Container.DataItem, "FlowNumber") %>&FormId=<%# DataBinder.Eval(Container.DataItem, "FormId") %>' class="gvlink" target="_blank">办理</a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>

                                    <asp:Panel ID="f01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期的租赁合同
                                                        <asp:Image ID="img_f01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f01" style="background-color: #ffffff;">
                                                        <td>
                                                            <asp:Panel ID="Panel_f01" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="htid" EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="合同编号">
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('<%=sDbsy_p %>/zlgl/Zlhtcx_Show.aspx?id=<%# Eval("htid") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblf01" runat="server" Text='<%# Bind("htno") %>'></asp:Label>
                                                                                </a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="租户">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblzhbm" runat="server" Text='<%# Bind("zhbm") %>'></asp:Label>-<asp:Label
                                                                                    ID="lblzhmc" runat="server" Text='<%# Bind("zhmc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="lxr" HeaderText="联系人"></asp:BoundField>
                                                                        <asp:BoundField DataField="qzrq" HeaderText="起租日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="75" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="tzrq" HeaderText="停租日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="75" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zq" HeaderText="租期">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zmj" HeaderText="收费面积">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="htje" HeaderText="租金">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="f02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期的租金缴费预警
                                                        <asp:Image ID="img_f02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f02" style="background-color: #ffffff;">
                                                        <td>
                                                            <asp:Panel ID="Panel_f02" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f02" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="合同编号">
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('<%=sDbsy_p %>/zlgl/zjsq_ck.aspx?id=<%# Eval("htid") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblhtno2" runat="server" Text='<%# Bind("htno") %>'></asp:Label>
                                                                                </a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="租户">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblzhbm2" runat="server" Text='<%# Bind("zhbm") %>'></asp:Label>-<asp:Label
                                                                                    ID="lblzhmc2" runat="server" Text='<%# Bind("zhmc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="lxr" HeaderText="联系人"></asp:BoundField>
                                                                        <asp:BoundField DataField="qzrq" HeaderText="起租日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="75" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="tzrq" HeaderText="停租日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="75" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zq" HeaderText="租期">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="jzrq" HeaderText="缴费截止日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="f03p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f03')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f03" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            截止目前的物业欠费预警
                                                        <asp:Image ID="img_f03" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f03" style="background-color: #ffffff;">
                                                        <td>
                                                            <asp:Panel ID="Panel_f03" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f03" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f03.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="房产信息">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbllpname" runat="server" Text='<%# Bind("lpname") %>'></asp:Label>#<asp:Label
                                                                                    ID="lbllgname" runat="server" Text='<%# Bind("lgname") %>'></asp:Label>#<asp:Label
                                                                                        ID="lbldyname" runat="server" Text='<%# Bind("dyname") %>'></asp:Label>#<asp:Label
                                                                                            ID="lblcellname" runat="server" Text='<%# Bind("cellname") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="yzxm" HeaderText="业主">
                                                                            <HeaderStyle Width="80" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="fxmc" HeaderText="费项名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="fyje" HeaderText="欠费金额">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="fydqr" HeaderText="缴费限期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="f04p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f04')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f04" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期的物业费预警
                                                        <asp:Image ID="img_f04" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f04" style="background-color: #ffffff;">
                                                        <td>
                                                            <asp:Panel ID="Panel_f04" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f04" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f04.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="房产信息">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbllpname" runat="server" Text='<%# Bind("lpname") %>'></asp:Label>#<asp:Label
                                                                                    ID="lbllgname" runat="server" Text='<%# Bind("lgname") %>'></asp:Label>#<asp:Label
                                                                                        ID="lbldyname" runat="server" Text='<%# Bind("dyname") %>'></asp:Label>#<asp:Label
                                                                                            ID="lblcellname" runat="server" Text='<%# Bind("cellname") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="yzxm" HeaderText="业主">
                                                                            <HeaderStyle Width="80" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="fxmc" HeaderText="费项名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="fyje" HeaderText="缴费金额">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="fydqr" HeaderText="缴费限期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>

                                    <asp:Panel ID="f05p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f05')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f05" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            待办理的投诉记录(共<asp:Label ID="f05_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_f05" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f05" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_f05" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f05" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f05.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="房产">
                                                                            <ItemStyle Wrap="false" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('<%=sDbsy_p %>/yzgl/zhts_mod.aspx?id=<%# Eval("id") %>&cellid=<%# Eval("cellcode") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblf05" runat="server" Text='<%# Bind("xqname") %>'></asp:Label>#<asp:Label
                                                                                        ID="Label2" runat="server" Text='<%# Bind("lgname") %>'></asp:Label>#<asp:Label ID="Label3"
                                                                                            runat="server" Text='<%# Bind("dyname") %>'></asp:Label>#<asp:Label ID="Label4" runat="server"
                                                                                                Text='<%# Bind("cellname") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="tsr" HeaderText="投诉人">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="tsdate" HeaderText="投诉日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="lxdh" HeaderText="联系电话">
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="yjj" HeaderText="状态">
                                                                            <HeaderStyle Width="60px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="tsnr" HeaderText="投诉内容">
                                                                            <ItemStyle />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="受理人">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ksslsj" HeaderText="受理时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="f06p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f06')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f06" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            待办理的服务记录(共<asp:Label ID="f06_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_f06" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f06" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_f06" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f06" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f06.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="房产">
                                                                            <ItemStyle Wrap="false" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('<%=sDbsy_p %>/fwgl/<%# Eval("pagename") %>.aspx?id=<%# Eval("id") %>&cellid=<%# Eval("sscellid") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblf06" runat="server" Text='<%# Bind("xqname") %>'></asp:Label>
                                                                                    #<asp:Label ID="Label2" runat="server" Text='<%# Bind("lgname") %>'></asp:Label>#<asp:Label
                                                                                        ID="Label3" runat="server" Text='<%# Bind("dyname") %>'></asp:Label>#<asp:Label ID="Label4"
                                                                                            runat="server" Text='<%# Bind("cellname") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sqr" HeaderText="申请人">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sqsj" HeaderText="诉求时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="lxmc" HeaderText="服务类型">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sqnr" HeaderText="诉求事项">
                                                                            <ItemStyle />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="fwfy" HeaderText="服务费用">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                                                            <HeaderStyle Width="60px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="lb" HeaderText="类别">
                                                                            <HeaderStyle Width="60px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="f07p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f07')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f07" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            待办理的装修记录(共<asp:Label ID="f07_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_f07" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f07" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_f07" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f07" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f07.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="房产">
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('<%=sDbsy_p %>/yzgl/zhzx_mod.aspx?id=<%# Eval("id") %>&cellid=<%# Eval("cellcode") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblf07" runat="server" Text='<%# Bind("xqname") %>'></asp:Label>#<asp:Label
                                                                                        ID="Label2" runat="server" Text='<%# Bind("lgname") %>'></asp:Label>#<asp:Label ID="Label3"
                                                                                            runat="server" Text='<%# Bind("dyname") %>'></asp:Label>#<asp:Label ID="Label4" runat="server"
                                                                                                Text='<%# Bind("cellname") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sqr" HeaderText="申请人">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sqdate" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zxyj" HeaderText="装修保证金">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="wyj" HeaderText="违约金">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zxnr" HeaderText="装修内容">
                                                                            <ItemStyle />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="审批人">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="spdate" HeaderText="审批时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="f08p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('f08')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_f08" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            待办理的请修记录(共<asp:Label ID="f08_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_f08" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="f08" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_f08" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_f08" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_f08.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="房产">
                                                                            <ItemStyle Wrap="false" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('<%=sDbsy_p %>/yzgl/qxgl_mod.aspx?id=<%# Eval("id") %>&cellid=<%# Eval("cellcode") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lblf08" runat="server" Text='<%# Bind("xqname") %>'></asp:Label>#<asp:Label
                                                                                        ID="Label2" runat="server" Text='<%# Bind("lgname") %>'></asp:Label>#<asp:Label ID="Label3"
                                                                                            runat="server" Text='<%# Bind("dyname") %>'></asp:Label>#<asp:Label ID="Label4" runat="server"
                                                                                                Text='<%# Bind("cellname") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sqr" HeaderText="申请人">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sqdate" HeaderText="申请日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="xlfy" HeaderText="修理费用">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                                                            <HeaderStyle Width="60px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="qxnr" HeaderText="请修内容">
                                                                            <ItemStyle />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="审批人">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="spdate" HeaderText="审批时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="spyj" HeaderText="审批意见">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ysyj" HeaderText="验收意见">
                                                                            <ItemStyle />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="e01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('e01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_e01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            低于安全库存数量的物品预警(共<asp:Label ID="e01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_e01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="e01" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_e01" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_e01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_e01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="存放地点">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("ckmc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="wpbm" HeaderText="物品编码"></asp:BoundField>
                                                                        <asp:BoundField DataField="wpmc" HeaderText="名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="wptxm" HeaderText="条形码"></asp:BoundField>
                                                                        <asp:BoundField DataField="fl_mc" HeaderText="分类"></asp:BoundField>
                                                                        <asp:BoundField DataField="wpgg" HeaderText="规格"></asp:BoundField>
                                                                        <asp:BoundField DataField="wpxh" HeaderText="型号"></asp:BoundField>
                                                                        <asp:BoundField DataField="wpdj" HeaderText="单价">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="kcsl" HeaderText="库存数量">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="kcje" HeaderText="库存金额">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zdkcsl" HeaderText="最低库存数量">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="right" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="e02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('e02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_e02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            最近需要维修/保养的资产(共<asp:Label ID="e02_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_e02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="e02" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_e02" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_e02" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_e02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="条形码">
                                                                            <ItemStyle Wrap="false" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('<%=sDbsy_e %>/zcbb/Zcll_View.aspx?id=<%# Eval("wpid") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lble02" runat="server" Text='<%# Bind("wptxm") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="资产编码">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="fl_mc" HeaderText="分类"></asp:BoundField>
                                                                        <asp:BoundField DataField="wpmc" HeaderText="资产名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="bm_mc" HeaderText="使用部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="ckmc" HeaderText="存放地点">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle Wrap="false" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="grrq" HeaderText="购入日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="wxzq" HeaderText="维修周期"></asp:BoundField>
                                                                        <asp:BoundField DataField="bcwxsj" HeaderText="下次维修日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="e03p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('e03')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_e03" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将报废到期的资产(共<asp:Label ID="e03_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_e03" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="e03" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_e03" runat="server" ScrollBars="Auto" Height="150">
                                                                <asp:GridView ID="GridView_e03" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" AllowPaging="false" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_e03.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="条形码">
                                                                            <ItemStyle Wrap="false" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popView('<%=sDbsy_e %>/zcbb/Zcll_View.aspx?id=<%# Eval("wpid") %>')"
                                                                                    class="gvlink">
                                                                                    <asp:Label ID="lble03" runat="server" Text='<%# Bind("wptxm") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="资产编码">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="fl_mc" HeaderText="分类"></asp:BoundField>
                                                                        <asp:BoundField DataField="wpmc" HeaderText="资产名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="bm_mc" HeaderText="使用部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="ckmc" HeaderText="存放地点">
                                                                            <HeaderStyle Wrap="false" />
                                                                            <ItemStyle Wrap="false" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="grrq" HeaderText="购入日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="synx" HeaderText="使用年限">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="xyycys" HeaderText="续用月数">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="bfrq" HeaderText="报废到期日" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="k01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('k01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_k01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            本园所即将年满3周岁的幼儿(共<asp:Label ID="k01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_k01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="k01" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_k01" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_k01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_k01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="学号">
                                                                            <HeaderStyle Width="70" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblk01" runat="server" Text='<%# Bind("kh") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="xm" HeaderText="姓名"></asp:BoundField>
                                                                        <asp:BoundField DataField="xb" HeaderText="性别">
                                                                            <HeaderStyle Width="50" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="glsr" HeaderText="出生日期(公历)" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="nj_mc" HeaderText="年级">
                                                                            <HeaderStyle Width="60" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="bjmc" HeaderText="班级">
                                                                            <HeaderStyle Width="60" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sflx" HeaderText="收费类型">
                                                                            <HeaderStyle Width="70" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="rysj" HeaderText="入园时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="k02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('k02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_k02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            本园所临近特殊提醒日期的幼儿(共<asp:Label ID="k02_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_k02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="k02" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_k02" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_k02" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_k02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="学号">
                                                                            <HeaderStyle Width="70" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblk02" runat="server" Text='<%# Bind("kh") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="xm" HeaderText="姓名"></asp:BoundField>
                                                                        <asp:BoundField DataField="xb" HeaderText="性别">
                                                                            <HeaderStyle Width="50" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="glsr" HeaderText="出生日期(公历)" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="nj_mc" HeaderText="年级">
                                                                            <HeaderStyle Width="60" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="bjmc" HeaderText="班级">
                                                                            <HeaderStyle Width="60" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sflx" HeaderText="收费类型">
                                                                            <HeaderStyle Width="70" />
                                                                            <ItemStyle HorizontalAlign="center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="rysj" HeaderText="入园时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="tstxrq" HeaderText="特殊提醒日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>

                                    <asp:Panel ID="k03p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('k03')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_k03" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            本年各园所收支明细统计（收入：<asp:Label ID="k03_sr" runat="server" Text="0" />元&nbsp;支出：<asp:Label ID="k03_zc" runat="server" Text="0" />元&nbsp;结余：<asp:Label ID="k03_jy" runat="server" Text="0" />元）
                                                        <asp:Image ID="img_k03" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="k03" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_k03" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_k03" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_k03.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="记帐日期">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("jzrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="所属园所">
                                                                            <ItemStyle Wrap="false" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ssbm_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="szlx" HeaderText="类型">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="xmmc" HeaderText="收支项目"></asp:BoundField>
                                                                        <asp:BoundField DataField="szje" HeaderText="收支金额" DataFormatString="{0:F2}">
                                                                            <ItemStyle HorizontalAlign="Right" />
                                                                            <FooterStyle HorizontalAlign="Right" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="zt" HeaderText="状态">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="sm" HeaderText="说明"></asp:BoundField>
                                                                        <asp:BoundField DataField="cjr_mc" HeaderText="创建人">
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="cjsj" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="80" Wrap="false" />
                                                                            <ItemStyle HorizontalAlign="Center" Wrap="false" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>

                                    <asp:Panel ID="r01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('r01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_r01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审阅的报表分析结果(共<asp:Label ID="r01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_r01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="r01" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_r01" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_r01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_r01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="报表编码">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="report/bbgl/spfxjg.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labebbid13" runat="server" Text='<%# Bind("bbid") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="报表名称">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lbls6" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="分析人">
                                                                            <HeaderStyle Width="80px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="fxsj" HeaderText="分析时间">
                                                                            <HeaderStyle Width="140px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="fxjg" HeaderText="分析结果"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="r02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('r02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_r02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            今日尚未进行分析的报表(共<asp:Label ID="r02_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_r02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="r02" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_r02" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_r02" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="modu_id" AllowPaging="false" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_r02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="报表编码">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="<%# Eval("modu_wjlj") %>" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labelbb28" runat="server" Text='<%# Bind("modu_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="modu_mc" HeaderText="报表名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="fxsj" HeaderText="最近分析时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="150px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的商品招商(共<asp:Label ID="m01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m01" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m01" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="档案编号">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wszs/spzssp.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labespzs3" runat="server" Text='<%# Bind("id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="公司名称">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("gsmc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请人">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelsqr" runat="server" Text='<%# Bind("sqr") %>'></asp:Label>-<asp:Label
                                                                                    ID="Labelsqmc" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sqsj" HeaderText="申请时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <FooterStyle CssClass="hkBottomStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的业务招商(共<asp:Label ID="m02_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m02" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m02" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m02" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="档案编号">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wszs/ywzssp.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labeywzs18" runat="server" Text='<%# Bind("id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="公司名称">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("gsmc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请人">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelsqr" runat="server" Text='<%# Bind("sqr") %>'></asp:Label>-<asp:Label
                                                                                    ID="Labelsqmc" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sqsj" HeaderText="申请时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m03p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m03')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m03" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的设备招商(共<asp:Label ID="m03_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m03" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m03" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m03" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m03" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m03.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="档案编号">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wszs/sbzssp.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labesbzs19" runat="server" Text='<%# Bind("id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="厂商名称">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("csmc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请人">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Labelsqr" runat="server" Text='<%# Bind("sqr") %>'></asp:Label>-<asp:Label
                                                                                    ID="Labelsqmc" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="sqsj" HeaderText="申请时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m04p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m04')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m04" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            等待审批的新品申请(共<asp:Label ID="m04_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m04" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m04" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m04" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m04" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="xp_txm" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m04.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="新品条形码">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/whxp/xpsp.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labexpid12" runat="server" Text='<%# Bind("xp_txm") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="xp_qc" HeaderText="新品名称"></asp:BoundField>
                                                                        <asp:TemplateField HeaderText="所属分类">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="所属供应商">
                                                                            <HeaderStyle Width="200px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblgysid" runat="server" Text='<%# Bind("ui_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="lblgysmc" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="申请人">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("xp_sqr") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label4" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="xp_sqsj" HeaderText="申请时间" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m05p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('t1')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_t1" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期的供应商帐号(共<asp:Label ID="m05_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m05" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="t1" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_t1" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m05" runat="server" AllowSorting="True" OnRowDataBound="OnRow_Bound"
                                                                    AutoGenerateColumns="False" DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m05.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="帐户编码">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/zhgl/zhxg.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labeluiid20" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ui_desc" HeaderText="名称">
                                                                            <HeaderStyle Width="80px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="所属供应商">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label2" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ui_yddh" HeaderText="移动电话">
                                                                            <HeaderStyle Width="80px" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ui_mail" HeaderText="电子邮件"></asp:BoundField>
                                                                        <asp:BoundField DataField="ui_edate" HeaderText="有效截止日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m06p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m06')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m06" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            未被供应商查收的订单(共<asp:Label ID="m06_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m06" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m06" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m06" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m06" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="dd_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m06.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="订单编号">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/cggl/ddcx.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labelddid4" runat="server" Text='<%# Bind("dd_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="订货门店">
                                                                            <HeaderStyle Width="140px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("md_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="供应商">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("dd_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label3" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="dd_dhrq" HeaderText="订货日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m07p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m07')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m07" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            未被供应商确认的自营对帐单(共<asp:Label ID="m07_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m07" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m07" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m07" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m07" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="jx01_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m07.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对帐单号">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wsdz/jxdzd.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labeljxid5" runat="server" Text='<%# Bind("jx01_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="供应商">
                                                                            <HeaderStyle Width="240px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("jx01_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label3" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="jx01_date" HeaderText="对帐日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="jx01_bz" HeaderText="备注"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m08p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m08')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m08" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            未被供应商确认的联营对帐单(共<asp:Label ID="m08_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m08" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m08" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m08" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m08" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="ly01_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m08.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对帐单号">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wsdz/lydz.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labellyid7" runat="server" Text='<%# Bind("ly01_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="供应商">
                                                                            <HeaderStyle Width="240px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ly01_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label3" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ly01_date" HeaderText="对帐日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ly01_bz" HeaderText="备注"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m09p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m09')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m09" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            被供应商挂起的自营对帐单(共<asp:Label ID="m09_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m09" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m09" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m09" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m09" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="jx01_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m09.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对帐单号">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wsdz/jxdzd.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labeljxid8" runat="server" Text='<%# Bind("jx01_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="供应商">
                                                                            <HeaderStyle Width="240px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("jx01_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label3" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="jx01_date" HeaderText="对帐日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="jxdz_qrsm" HeaderText="挂起原因"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m10p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m10')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m10" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            被供应商挂起的联营对帐单(共<asp:Label ID="m10_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m10" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m10" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m10" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m10" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="ly01_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m10.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对帐单号">
                                                                            <HeaderStyle Width="120px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="scm/wsdz/lydz.aspx" class="gvlink" target="_blank">
                                                                                    <asp:Label ID="Labelyid10" runat="server" Text='<%# Bind("ly01_id") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="供应商">
                                                                            <HeaderStyle Width="240px" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ly01_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label3" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ly01_date" HeaderText="对帐日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="90px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="lydz_qrsm" HeaderText="挂起原因"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="m11p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('m11')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_m11" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期的厂商合同(共<asp:Label ID="m11_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_m11" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="m11" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_m11" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_m11" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    DataKeyNames="ht_id" AllowPaging="false" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_m11.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ht_id" HeaderText="合同编码">
                                                                            <HeaderStyle Width="80px" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="供应商">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ht_gys") %>'></asp:Label>-<asp:Label
                                                                                    ID="Label2" runat="server" Text='<%# Bind("cs_mc") %>'></asp:Label>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ht_jyfs" HeaderText="经营方式">
                                                                            <HeaderStyle Width="70px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ht_zt" HeaderText="状态">
                                                                            <HeaderStyle Width="40px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ht_sdate" HeaderText="开始日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="ht_edate" HeaderText="结束日期" DataFormatString="{0:yyyy-MM-dd}"
                                                                            HtmlEncode="False">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <AlternatingRowStyle BackColor="#EBFBF0" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>

                                    <asp:Panel ID="h01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            正式合同到期(共<asp:Label ID="h01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h01" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h01" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="合同编号">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/rsgl/Htgl_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h01" runat="server" Text='<%# Bind("HtBianHao") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="HtMc" HeaderText="合同名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="XingMing" HeaderText="员工姓名"></asp:BoundField>
                                                                        <asp:BoundField DataField="BuMen" HeaderText="员工部门"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            试用合同到期(共<asp:Label ID="h02_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h02" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h02" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h02" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="合同编号">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/rsgl/Htgl_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h02" runat="server" Text='<%# Bind("HtBianHao") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="HtMc" HeaderText="合同名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="XingMing" HeaderText="员工姓名"></asp:BoundField>
                                                                        <asp:BoundField DataField="BuMen" HeaderText="员工部门"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h03p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h03')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h03" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            保险到期(共<asp:Label ID="h03_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h03" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h03" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h03" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h03" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h03.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="员工姓名">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/xzgl/Ygbxgl_R_show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h03" runat="server" Text='<%# Bind("XingMing") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="BuMen" HeaderText="所在部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="Leixing" HeaderText="保险类型"></asp:BoundField>
                                                                        <asp:BoundField DataField="ZhouQi" HeaderText="保险周期"></asp:BoundField>
                                                                        <asp:BoundField DataField="BaoXianJE" HeaderText="保险金额"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h04p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h04')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h04" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            员工生日(共<asp:Label ID="h04_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h04" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h04" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h04" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h04" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h04.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="工号">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/rsgl/Ygsrlb_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h04" runat="server" Text='<%# Bind("GongHao") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="XingMing" HeaderText="姓名"></asp:BoundField>
                                                                        <asp:BoundField DataField="YinPinBM" HeaderText="部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="YinPinZW" HeaderText="岗位"></asp:BoundField>
                                                                        <asp:BoundField DataField="Zhiwu" HeaderText="职务"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h05p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h05')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h05" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            证照到期(共<asp:Label ID="h05_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h05" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h05" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h05" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h05" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h05.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="员工姓名">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/tjfx/Zzcx_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h05" runat="server" Text='<%# Bind("XingMing") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Bianhao" HeaderText="证照编号"></asp:BoundField>
                                                                        <asp:BoundField DataField="Mingcheng" HeaderText="证照名称"></asp:BoundField>
                                                                        <asp:BoundField DataField="SxRiQi" HeaderText="生效日期" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="DqRiQi" HeaderText="到期日期" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h06p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h06')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h06" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            职称申报(共<asp:Label ID="h06_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h06" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h06" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h06" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h06" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h06.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="员工姓名">
                                                                            <HeaderStyle Width="100px" />
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/rsgl/Zcpd_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h06" runat="server" Text='<%# Bind("XingMing") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="BuMen" HeaderText="员工部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="ZhiCheng" HeaderText="取得职称"></asp:BoundField>
                                                                        <asp:BoundField DataField="FangShi" HeaderText="取得方式"></asp:BoundField>
                                                                        <asp:BoundField DataField="ShiJian" HeaderText="取得时间" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h07p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h07')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h07" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            招聘计划开始(共<asp:Label ID="h07_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h07" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h07" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h07" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h07" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h07.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="招聘主题">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/zpgl/Ckzpjh_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h07" runat="server" Text='<%# Bind("Title") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="ZpBmName" HeaderText="招聘部门"></asp:BoundField>
                                                                        <asp:BoundField DataField="Jhkssj" HeaderText="计划开始日期" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Jhwcsj" HeaderText="计划完成日期" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="h08p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('h08')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_h08" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            培训计划开始(共<asp:Label ID="h08_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_h08" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="h08" style="background-color: #ffffff; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_h08" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_h08" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_h08.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="计划名称">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <ItemTemplate>
                                                                                <a href="#" onclick="javascript:popMod('hr/pxgl/Pxjh_R_Show.aspx?id=<%# Eval("id") %>')" class="gvlink">
                                                                                    <asp:Label ID="lbl_link_h08" runat="server" Text='<%# Bind("Mingcheng") %>'></asp:Label></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Kaishi" HeaderText="开始时间" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Jieshu" HeaderText="结束时间" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="PeixunDD" HeaderText="培训地点"></asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="c01p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('c01')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_c01" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            客户待办事宜(共<asp:Label ID="c01_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_c01" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="c01" style="background-color: #ecece8; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_c01" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_c01" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh_c01" runat="server" Text="<%# GridView_c01.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="主题">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a class="gvlink" href='javascript:void(0)' onclick='ShowDbsy1(<%# DataBinder.Eval(Container.DataItem, "ID")%>)'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "Zhuti")%></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对应客户">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='openkhxx("<%# DataBinder.Eval(Container.DataItem, "KhId")%>")'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "KhName")%></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Lxr" HeaderText="联系人">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Shijian" HeaderText="时间">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="状态">
                                                                            <ItemStyle Wrap="False" />
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <%# ((Eval("Zhuangtai").ToString().Replace("1", "未结束").Replace("2", "已结束").Replace("3", "取消")))%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="LeixingName" HeaderText="类型">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="c02p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('c02')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_c02" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期及过期合同订单(共<asp:Label ID="c02_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_c02" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="c02" style="background-color: #ecece8; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_c02" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_c02" runat="server" OnRowDataBound="OnRow_Bound_c02" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh_c02" runat="server" Text="<%# GridView_c02.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="主题">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a class="gvlink" href='javascript:void(0)' onclick='ShowHtxx1(<%# DataBinder.Eval(Container.DataItem, "ID")%>)'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "Zhuti")%>
                                                                                </a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对应客户">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='openkhxx("<%# DataBinder.Eval(Container.DataItem, "KhId")%>")'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "KhName")%>
                                                                                </a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="FenleiName" HeaderText="分类">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:TemplateField HeaderText="开始日期">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <%# ((Eval("KaishiRi").ToString().Replace("1900-1-1", "").Replace("0:00:00", "")))%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="结束日期">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <%# ((Eval("JieshuRi").ToString().Replace("1900-1-1", "").Replace("0:00:00", "")))%>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="总金额">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="Lid_c02" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "id")%>'
                                                                                    Visible="false"></asp:Label>
                                                                                <asp:Label ID="Label1" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Jine")%>'></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="已回款">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblyhk_c02" runat="server"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="状态">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <img src="../../images/crm/ht_<%# DataBinder.Eval(Container.DataItem, "Zhuangtai")%>.gif"
                                                                                    title="<%# ((Eval("Zhuangtai").ToString().Replace("1", "执行中").Replace("2", "结束").Replace("3", "意外终止")))%>" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle Wrap="False" Width="30px" HorizontalAlign="Center" />
                                                                        </asp:TemplateField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="c03p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('c03')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_c03" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期及过期未交付计划(共<asp:Label ID="c03_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_c03" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="c03" style="background-color: #ecece8; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_c03" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_c03" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh_c03" runat="server" Text="<%# GridView_c03.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="计划交付时间">
                                                                            <ItemStyle Wrap="False" />
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='ShowJFJH1(<%# DataBinder.Eval(Container.DataItem, "ID")%>)'>
                                                                                    <%# ((Eval("ShijianJh").ToString().Replace("0:00:00", "").Replace("1900-1-1", "")))%></a>
                                                                                <img src="../../images/crm/jf_<%# DataBinder.Eval(Container.DataItem, "JfJL")%>.gif"
                                                                                    title="<%# ((Eval("JfJL").ToString().Replace("1", "未交付").Replace("2", "已交付").Replace("3", "不提醒").Replace("4", "意外终止")))%>" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对应客户">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='openkhxx("<%# DataBinder.Eval(Container.DataItem, "KhId")%>")'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "KhName")%></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="产品">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='opencpxx(<%# DataBinder.Eval(Container.DataItem, "CpId")%>)'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "CpName")%></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Danjia" HeaderText="单价">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Shuliang" HeaderText="数量">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Zhekou" HeaderText="折扣">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Zongjia" HeaderText="总价">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="c04p" runat="server" Visible="false">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color: #999999">
                                                    <tr onclick="change_view('c04')">
                                                        <td style="height: 20px; background-image: url(images/dbsy_n.gif)">&nbsp;<asp:Image ID="Image_c04" runat="server" ImageUrl="images/arrow_s.gif" />
                                                            即将到期及过期未回款计划(共<asp:Label ID="c04_count" runat="server" Text="0" />条)
                                                        <asp:Image ID="img_c04" runat="server" ImageUrl="../../images/help.gif" />
                                                        </td>
                                                    </tr>
                                                    <tr id="c04" style="background-color: #ecece8; display: none">
                                                        <td>
                                                            <asp:Panel ID="Panel_c04" runat="server" ScrollBars="Auto" Height="100">
                                                                <asp:GridView ID="GridView_c04" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                                    EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="images/refresh.gif">
                                                                            <ItemTemplate>
                                                                                <asp:Label ID="lblxh_c04" runat="server" Text="<%# GridView_c04.Rows.Count+ 1 %>"></asp:Label>
                                                                            </ItemTemplate>
                                                                            <ItemStyle HorizontalAlign="Center" />
                                                                            <HeaderStyle Width="30px" />
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="计划回款日期">
                                                                            <ItemStyle Wrap="False" />
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='ShowHKJH1(<%# DataBinder.Eval(Container.DataItem, "ID")%>)'>
                                                                                    <%# ((Eval("HuikuanRq").ToString().Replace("0:00:00", "").Replace("1900-1-1", "")))%></a>
                                                                                <img src="../../images/crm/jf_<%# DataBinder.Eval(Container.DataItem, "Huikuan")%>.gif"
                                                                                    title="<%# ((Eval("Huikuan").ToString().Replace("1", "未回款").Replace("2", "已回款").Replace("3", "不提醒回款计划").Replace("4", "意外终止回款计划")))%>" />
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="对应客户">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemTemplate>
                                                                                <a href='javascript:void(0)' class="gvlink" onclick='openkhxx("<%# DataBinder.Eval(Container.DataItem, "KhId")%>")'>
                                                                                    <%# DataBinder.Eval(Container.DataItem, "KhName")%></a>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>
                                                                        <asp:BoundField DataField="Qici" HeaderText="期次">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                        <asp:BoundField DataField="Jine" HeaderText="金额">
                                                                            <HeaderStyle Wrap="False" />
                                                                            <ItemStyle Wrap="False" HorizontalAlign="Center" />
                                                                        </asp:BoundField>
                                                                    </Columns>
                                                                    <RowStyle CssClass="hkRowStyle" />
                                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                                </asp:GridView>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 10px"></td>
                                        </tr>
                                    </asp:Panel>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblpms" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbleam" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
