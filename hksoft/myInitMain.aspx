<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myInitMain.aspx.cs" Inherits="hkpro.myInitMain" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ҵ���ҳ</title>
    <link href="assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="cssjs/mypc.css" />
    <script src="assets/plugins/jquery/jquery.min.js"></script>
    <script src="assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="CssJs/Choose.js"></script>

    <script type="text/javascript" src="CssJs/jquery-1.4.4.min.js"></script>
</head>
<script>
    function _del(a) {
        msg = "ȷ�������治��ʾ��ģ����?";
        if (window.confirm(msg)) {

            window.open("myinitmain_del.aspx?id=" + a + "", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
        }
    }

    function _update(a) {
        var aw = 380;
        var ah = 130;
        var al = (screen.width - aw) / 2 - 100;
        var at = (screen.height - ah) / 5 + 200;
        window.open("myinitmain_update.aspx?id=" + a + "", "_blank", "height=130, width=380,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=" + at + ",left=" + al + "")
    }

    function hideAll() {
        $("#GridView1").css("display", "none");
        $("#GridView2").css("display", "none");
        $("#GridView3").css("display", "none");
        $("#GridView4").css("display", "none");
        $("#GridView5").css("display", "none");
        $("#GridView6").css("display", "none");
        $("#GridView7").css("display", "none");
        $("#GridView8").css("display", "none");

        $("#AspNetPager1").css("display", "none");
        $("#AspNetPager2").css("display", "none");
        $("#AspNetPager3").css("display", "none");
        $("#AspNetPager4").css("display", "none");
        $("#AspNetPager5").css("display", "none");
        $("#AspNetPager6").css("display", "none");
        $("#AspNetPager7").css("display", "none");
        $("#AspNetPager8").css("display", "none");

        $("#AspNetPager1 .page_text").css("display", "block");
        $("#AspNetPager2 .page_text").css("display", "block");
        $("#AspNetPager3 .page_text").css("display", "block");
        $("#AspNetPager4 .page_text").css("display", "block");
        $("#AspNetPager5 .page_text").css("display", "block");
        $("#AspNetPager6 .page_text").css("display", "block");
        $("#AspNetPager7 .page_text").css("display", "block");
        $("#AspNetPager8 .page_text").css("display", "block");

    }

    function click_block(num) {
        $(".myInitMain_mytab li.m" + num).siblings().each(function () {
            $(this).removeClass("on");
        });
        $(".myInitMain_mytab li.m" + num).addClass("on");
        hideAll();
        $("#GridView" + num).css("display", "block");
        $("#AspNetPager" + num).css("display", "block");
    }
</script>
<body class="main card-no-border">
    <form id="form1_my" runat="server">
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
        <div class="row">
            <div class="col-lg-9 col-md-9">
                <div class="card">
                    <div class="card-body">
                        <div class="row index_title_card">

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(1);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-primary"><i class="fa fa-paper-plane-o"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num1 %></h3>
                                                <h5 class="text-muted m-b-0">δ��������</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(2);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-info"><i class="fa fa-spin fa-refresh"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num2 %></h3>
                                                <h5 class="text-muted m-b-0">����������</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(3);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-info"><i class="fa fa-pencil-square-o"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num3 %></h3>
                                                <h5 class="text-muted m-b-0">����������</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(4);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-success"><i class="ti-check"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num4 %></h3>
                                                <h5 class="text-muted m-b-0">�Ѱ������</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row index_title_card">

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(5);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-danger"><i class="fa  fa-warning"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num5 %></h3>
                                                <h5 class="text-muted m-b-0">�߶Ƚ�������</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(6);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-danger"><i class="fa  fa-times-circle"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num6 %></h3>
                                                <h5 class="text-muted m-b-0">�ѳ�ʱ����</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(7);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-warning"><i class="mdi mdi-alarm"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num7 %></h3>
                                                <h5 class="text-muted m-b-0">��ʱ����</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-6">
                                <div class="card" onclick="click_block(8);">
                                    <div class="card-body">
                                        <div class="d-flex flex-row">
                                            <div class="round round-lg align-self-center round-warning"><i class="fa fa-gavel"></i></div>
                                            <div class="m-l-10 align-self-center">
                                                <h3 class="m-b-0 font-light"><%=num8 %></h3>
                                                <h5 class="text-muted m-b-0">��˱��˻�����</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-3">
                <div class="card mb-3" style="height: 208px;">
                    <div class="card-header" style="border-bottom: 1px solid #d7dfe3;">
                        <i class="fa fa-bullhorn" style="padding-right: 10px;"></i>��Ҫ֪ͨ
                        <a href="#" onclick="javascript:popMod('portal/xzgl/Qyggcx.aspx')" class="notice_more">����</a>
                    </div>
                    <div class="card-body" style="padding-top: 5px;">
                        <ul class="mynotice">
                            <%=notice %>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <table cellspacing="0" cellpadding="0" border="0" width="100%" style="margin-bottom: 12px;">
                                    <tr>
                                        <td>
                                            <ul class="myInitMain_mytab" style="margin-left: -40px;">
                                                <li class="on m1">δ��������</li>
                                                <li class="m2">����������</li>
                                                <li class="m3">����������</li>
                                                <li class="m4">�Ѱ������</li>
                                                <li class="m5">�߶Ƚ�������</li>
                                                <li class="m6">�ѳ�ʱ����</li>
                                                <li class="m7">��ʱ����</li>
                                                <li class="m8">���˻�����</li>
                                            </ul>
                                            <script type="text/javascript">
                                                $(".myInitMain_mytab li").click(function () {
                                                    $(this).siblings().each(function () {
                                                        $(this).removeClass("on");
                                                    });
                                                    $(this).addClass("on");
                                                    if ($(this).hasClass("m1")) {
                                                        hideAll();
                                                        $("#GridView1").css("display", "block");
                                                        $("#AspNetPager1").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m2")) {
                                                        hideAll();
                                                        $("#GridView2").css("display", "block");
                                                        $("#AspNetPager2").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m3")) {
                                                        hideAll();
                                                        $("#GridView3").css("display", "block");
                                                        $("#AspNetPager3").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m4")) {
                                                        hideAll();
                                                        $("#GridView4").css("display", "block");
                                                        $("#AspNetPager4").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m5")) {
                                                        hideAll();
                                                        $("#GridView5").css("display", "block");
                                                        $("#AspNetPager5").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m6")) {
                                                        hideAll();
                                                        $("#GridView6").css("display", "block");
                                                        $("#AspNetPager6").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m7")) {
                                                        hideAll();
                                                        $("#GridView7").css("display", "block");
                                                        $("#AspNetPager7").css("display", "block");
                                                    }
                                                    if ($(this).hasClass("m8")) {
                                                        hideAll();
                                                        $("#GridView8").css("display", "block");
                                                        $("#AspNetPager8").css("display", "block");
                                                    }
                                                });
                                            </script>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <asp:UpdatePanel runat="server" ID="up1">
                                    <ContentTemplate>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: block">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jsid" HeaderText="���ձ���">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/jsdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jsid=<%# Eval("jsid") %>&jszt=<%# Eval("jszt")%>&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--                                                            <asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                                HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                                <ItemStyle HorizontalAlign="center" />
                                                                <HeaderStyle Width="30px" />
                                                            </asp:ImageField>--%>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="thcs" HeaderText="�˻ش���">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left" showinputbox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            inputboxclass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: block;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView2" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none;">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="rwid" HeaderText="�������">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/ssdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=yjs&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                                    HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                                    <ItemStyle HorizontalAlign="center" />
                                                                    <HeaderStyle Width="30px" />
                                                                </asp:ImageField>--%>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljssj" runat="server" Text='<%# Bind("jssj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="thcs" HeaderText="�˻ش���">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynfp" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="����">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server" OnPageChanged="AspNetPager2_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView3" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView3.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/ssdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=ssz&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="clr" HeaderText="�����">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="���ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelclsj" runat="server" Text='<%# Bind("clsj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="thcs" HeaderText="�˻ش���">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager3" runat="server" OnPageChanged="AspNetPager3_PageChanged"
                                            ShowCustomInfoSection="left" showinputbox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            inputboxclass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView4" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView4.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/bjdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=ybj&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;"
                                                                    ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt")%>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                                    HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                                    <ItemStyle HorizontalAlign="center" />
                                                                    <HeaderStyle Width="30px" />
                                                                </asp:ImageField>--%>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="spr" HeaderText="�����">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="���ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelclsj" runat="server" Text='<%# Bind("spsj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="spyj" HeaderText="������">
                                                        <HeaderStyle CssClass="mw90" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sppj" HeaderText="����">
                                                        <HeaderStyle CssClass="mw30" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="thcs" HeaderText="�˻ش���">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager4" runat="server" OnPageChanged="AspNetPager4_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView5" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView5.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jsid" HeaderText="���ձ���">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/jsdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jsid=<%# Eval("jsid") %>&jszt=<%# Eval("jszt")%>&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                                    HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                                    <ItemStyle HorizontalAlign="center" />
                                                                    <HeaderStyle Width="30px" />
                                                                </asp:ImageField>--%>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="thcs" HeaderText="�˻ش���">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager5" runat="server" OnPageChanged="AspNetPager5_PageChanged"
                                            ShowCustomInfoSection="left" showinputbox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            inputboxclass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView6" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none;">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text="<%# GridView6.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="rwid" HeaderText="�������">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/ssdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=yjs&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljssj" runat="server" Text='<%# Bind("jssj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��ʼ����">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelksrq" runat="server" Text='<%# Bind("ksrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��ֹ����">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljzrq" runat="server" Text='<%# Bind("jzrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>

                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager6" runat="server" OnPageChanged="AspNetPager6_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView7" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView7.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/ssdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=ssz&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljssj" runat="server" Text='<%# Bind("jssj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��ʼ����">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelksrq" runat="server" Text='<%# Bind("ksrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="��ʼ����">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljzrq" runat="server" Text='<%# Bind("jzrq", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager7" runat="server" OnPageChanged="AspNetPager7_PageChanged"
                                            ShowCustomInfoSection="left" showinputbox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            inputboxclass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
                                        </webdiyer:AspNetPager>
                                        <div class="mytable table-responsive">
                                            <asp:GridView ID="GridView8" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table" Style="display: none">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView8.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="cqzt" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw40" />
                                                    </asp:ImageField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('/oa/rwgl/bjdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=ybj&flag=index')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label Style="text-overflow: ellipsis; display: block; white-space: nowrap; overflow: hidden;" ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <%--<asp:ImageField DataImageUrlField="jjcd" DataImageUrlFormatString="../../images/{0}.gif"
                                            HeaderText="�����̶�">
                                            <ItemStyle HorizontalAlign="center" />
                                            <HeaderStyle Width="70px" />
                                        </asp:ImageField>--%>
                                                    <%--<asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                                    HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                                    <ItemStyle HorizontalAlign="center" />
                                                                    <HeaderStyle Width="30px" />
                                                                </asp:ImageField>--%>
                                                    <asp:BoundField DataField="jszt" HeaderText="����״̬">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="ynxs" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="����ȼ�">
                                                        <HeaderStyle CssClass="mw80" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="����ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="spr" HeaderText="�����">
                                                        <HeaderStyle CssClass="mw80" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="���ʱ��">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw150" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelclsj" runat="server" Text='<%# Bind("spsj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="spyj" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sppj" HeaderText="����">
                                                        <HeaderStyle CssClass="mw30" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="thcs" HeaderText="�˻ش���">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                        </div>
                                        <webdiyer:AspNetPager ID="AspNetPager8" runat="server" OnPageChanged="AspNetPager8_PageChanged"
                                            ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                            PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="6" Style="display: none;">
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
