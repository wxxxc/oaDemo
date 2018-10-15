<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbrwcx.aspx.cs" Inherits="hkpro.oa.rwgl.dbrwcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>待办任务查询</title>
    <style>
        .pagebtn {
    width: 40px !important;
    height: 23px;
}
    </style>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row" style="line-height:50px;">
                            <div class="col-12">

                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        发布部门：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="fbbm" runat="server" Enabled="false" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        发布人员：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="rysq" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        发布时间(自)：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="text-center" Width="150" Height="39"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
                                            ErrorMessage="请输入操作日期(自)">&nbsp;
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        任务等级：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="rwxz" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        任务标题：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="rwbt" runat="server" Width="150" Height="39" CssClass="form-control" />
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        发布时间(至)：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="text-center" Width="150" Height="39"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
                                            ErrorMessage="请输入操作日期(至)">&nbsp;
                                        </asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        紧急程度：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="jjcd" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                            <asp:ListItem Text="全部" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="高" Value="高"></asp:ListItem>
                                            <asp:ListItem Text="中" Value="中"></asp:ListItem>
                                            <asp:ListItem Text="低" Value="低"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        任务单号：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="rwdh" runat="server" Width="150" Height="39" CssClass="form-control" />
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        任务内容：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="rwnr" runat="server" Width="150" Height="39" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        任务状态：
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="rwzt" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                            <asp:ListItem Text="全部" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="已发布" Value="已发布"></asp:ListItem>
                                            <asp:ListItem Text="已暂停" Value="已暂停"></asp:ListItem>
                                            <asp:ListItem Text="已完成" Value="已完成"></asp:ListItem>
                                            <asp:ListItem Text="已关闭" Value="已关闭"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-8 col-sm-12 text-center">
                                        <input runat="server" type="checkbox" id="xsrw"  class="filled-in chk-col-light-blue" />
                                        <label for="xsrw">限时任务</label>
                                        <%--<asp:CheckBox ID="xsrw" runat="server" Text="限时任务" />--%>
                                        <asp:CheckBox ID="xjrw" runat="server" Text="显示下级人员发布的任务" Visible="false" />
                                        <asp:DropDownList ID="fblx" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;" Visible="false">
                                            <asp:ListItem Text="全部" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="按分类发布" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="按部门发布" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="按用户发布" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;<font color="red">红色：已暂停</font>&nbsp;<font color="green">绿色：已完成</font>&nbsp;<font
                                            color="#5C1A8C">紫色：已关闭</font>
                                        <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="查询" CausesValidation="true"
                                            OnClick="Query_Click"></asp:Button>
                                        <asp:Button CssClass="btn btn-primary" ID="ClearBtn" runat="server" Text="清空" CausesValidation="true"
                                            OnClick="Clear_Click"></asp:Button>
                                        <asp:Button ID="PrnBtn" runat="server" Text="打印" CssClass="btn btn-success" Visible="false"></asp:Button>
                                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
                                            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row" style="margin-top: 10px;">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="up1">
                                    <ContentTemplate>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound"
                                                AutoGenerateColumns="False" DataKeyNames="rwid" EmptyDataText="没有查到符合条件的数据！" Width="99%" CssClass="table">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="任务单号">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="任务来源">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="rwly" runat="server" Text='<%# Bind("source") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="任务标题">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('dbrwcx_yhview.aspx?rwid=<%# Eval("rwid") %>')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="接收人">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="紧急程度">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                            </font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="ynxs2" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="限时">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:ImageField DataImageUrlField="fjmc2" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderImageUrl="../../images/y.gif" HeaderText="附件标志">
                                                        <ItemStyle HorizontalAlign="center" CssClass="v-m" />
                                                        <HeaderStyle CssClass="mw30 v-m" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="rwzt" HeaderText="状态">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="mc" HeaderText="任务等级">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="发布人">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="发布时间">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                            PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="转到" PageSize="8">
                                        </webdiyer:AspNetPager>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
