<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wddbrwy.aspx.cs" Inherits="hkpro.oa.rwgl.wddbrwy" %>

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
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <title>�ҵĴ�������</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col-12">
                                <ul class="nav nav-tabs rwgl_nav" role="tablist" style="float: left;">
                                    <li class="nav-item"><a class="nav-link" href="wddbrw.aspx?i=2">δ��������</a> </li>
                                    <li class="nav-item"><a class="nav-link active" href="wddbrwy.aspx">����������</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="wddbrws.aspx">����������</a> </li>
                                    <li class="nav-item"><a class="nav-link" href="wddbrwj.aspx">�Ѱ������</a> </li>
                                </ul>
                                <div style="float: left; line-height: 40px;">
                                    &nbsp;<asp:Label ID="lblfbr" runat="server" Text="������:" Visible="false"></asp:Label>
                                    <asp:TextBox ID="rysq" runat="server" CssClass="" Width="60" Visible="false" />
                                    <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                        CssClass="text-center" Width="105" Height="30"></asp:TextBox> ��
                                    <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')"
                                        runat="server" CssClass="text-center" Width="105" Height="30"></asp:TextBox>
                                    <asp:DropDownList ID="query_tj" runat="server" Width="120" Height="30">
                                        <asp:ListItem Text="���񵥺�" Value="rwdh"></asp:ListItem>
                                        <asp:ListItem Text="�������" Value="rwbt" Selected="true"></asp:ListItem>
                                        <asp:ListItem Text="��������" Value="rwnr"></asp:ListItem>
                                        <asp:ListItem Text="�����̶�" Value="jjcd"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="rwbt" runat="server" Width="100" Height="30" />
                                    <asp:Button CssClass="btn btn-info" ID="RecBtn" runat="server" Text="��ѯ" OnClick="Query_Click"></asp:Button>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 10px;">
                            <div class="col-12">
                                <div class="mytable table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                        DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                        <Columns>
                                            <asp:TemplateField HeaderText="���">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
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
                                            <%--<asp:TemplateField HeaderText="���񵥺�">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="������Դ">
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelrwly" runat="server" Text='<%# Bind("source") %>'></asp:Label></font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="�������">
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popView('ssdbrw_yhview.aspx?rwid=<%# Eval("rwid") %>&jszt=<%# Eval("jszt")%>&jsid=<%# Eval("jsid") %>&type=yjs')"
                                                        class="gvlink" title="<%# Eval("rwbt") %>">
                                                        <asp:Label ID="Labelrwbt" runat="server"
                                                            Text='<%# Eval("rwbt").ToString().Length>11?Eval("rwbt").ToString().Substring(0,11)+"��":Eval("rwbt").ToString() %>'> </asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="mwp50" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="�����̶�">
                                                <HeaderStyle CssClass="mw60" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                    </font>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:ImageField DataImageUrlField="fjmc01" DataImageUrlFormatString="../../images/{0}.gif"
                                                HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                <ItemStyle HorizontalAlign="center" CssClass="v-m" />
                                                <HeaderStyle CssClass="mw30 v-m" />
                                            </asp:ImageField>
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
                                                <HeaderStyle CssClass="mw90" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="����ʱ��">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw90" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("fbsj", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="jsr" HeaderText="������">
                                                <HeaderStyle CssClass="mw90" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="����ʱ��">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle CssClass="mw130" />
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
                                            <asp:TemplateField HeaderText="����">
                                                <HeaderStyle CssClass="mw100" />
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popView('dbrwcx_yhview.aspx?rwid=<%# Eval("fprwid") %>')"
                                                        class="gvlink">
                                                        <asp:Label ID="Labelgh" runat="server" Text='<%# Bind("lblfprwid") %>'> </asp:Label></a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="hkRowStyle" />
                                        <HeaderStyle CssClass="hkHeadStyle" />
                                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                    </asp:GridView>
                                </div>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                    NumericButtonCount="5" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                    PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="5"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="10">
                                </webdiyer:AspNetPager>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
            ErrorMessage="�������������(��)">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
            ErrorMessage="�������������(��)">&nbsp;
        </asp:RequiredFieldValidator>
    </form>
</body>
</html>
