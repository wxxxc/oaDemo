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
    <title>���������ѯ</title>
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
                                        �������ţ�
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="fbbm" runat="server" Enabled="false" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ������Ա��
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="rysq" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ����ʱ��(��)��
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="text-center" Width="150" Height="39"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
                                            ErrorMessage="�������������(��)">&nbsp;
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>



                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ����ȼ���
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="rwxz" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ������⣺
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="rwbt" runat="server" Width="150" Height="39" CssClass="form-control" />
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ����ʱ��(��)��
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="text-center" Width="150" Height="39"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
                                            ErrorMessage="�������������(��)">&nbsp;
                                        </asp:RequiredFieldValidator>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        �����̶ȣ�
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="jjcd" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                            <asp:ListItem Text="ȫ��" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                            <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                            <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ���񵥺ţ�
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="rwdh" runat="server" Width="150" Height="39" CssClass="form-control" />
                                    </div>

                                    <div class="col-lg-2 col-sm-6 text-right">
                                        �������ݣ�
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:TextBox ID="rwnr" runat="server" Width="150" Height="39" CssClass="form-control" />
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-lg-2 col-sm-6 text-right">
                                        ����״̬��
                                    </div>
                                    <div class="col-lg-2 col-sm-6 text-left">
                                        <asp:DropDownList ID="rwzt" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;">
                                            <asp:ListItem Text="ȫ��" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="�ѷ���" Value="�ѷ���"></asp:ListItem>
                                            <asp:ListItem Text="����ͣ" Value="����ͣ"></asp:ListItem>
                                            <asp:ListItem Text="�����" Value="�����"></asp:ListItem>
                                            <asp:ListItem Text="�ѹر�" Value="�ѹر�"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-8 col-sm-12 text-center">
                                        <input runat="server" type="checkbox" id="xsrw"  class="filled-in chk-col-light-blue" />
                                        <label for="xsrw">��ʱ����</label>
                                        <%--<asp:CheckBox ID="xsrw" runat="server" Text="��ʱ����" />--%>
                                        <asp:CheckBox ID="xjrw" runat="server" Text="��ʾ�¼���Ա����������" Visible="false" />
                                        <asp:DropDownList ID="fblx" runat="server" CssClass="custom-select"
                                            Style="width: 150px; margin-top: -3px;" Visible="false">
                                            <asp:ListItem Text="ȫ��" Value="" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="�����෢��" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="�����ŷ���" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="���û�����" Value="3"></asp:ListItem>
                                        </asp:DropDownList>
                                        &nbsp;<font color="red">��ɫ������ͣ</font>&nbsp;<font color="green">��ɫ�������</font>&nbsp;<font
                                            color="#5C1A8C">��ɫ���ѹر�</font>
                                        <asp:Button CssClass="btn btn-info" ID="QueryBtn" runat="server" Text="��ѯ" CausesValidation="true"
                                            OnClick="Query_Click"></asp:Button>
                                        <asp:Button CssClass="btn btn-primary" ID="ClearBtn" runat="server" Text="���" CausesValidation="true"
                                            OnClick="Clear_Click"></asp:Button>
                                        <asp:Button ID="PrnBtn" runat="server" Text="��ӡ" CssClass="btn btn-success" Visible="false"></asp:Button>
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
                                                AutoGenerateColumns="False" DataKeyNames="rwid" EmptyDataText="û�в鵽�������������ݣ�" Width="99%" CssClass="table">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="���񵥺�">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labelrwjh" runat="server" Text='<%# Bind("rwdh") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="������Դ">
                                                        <HeaderStyle CssClass="mw90" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="rwly" runat="server" Text='<%# Bind("source") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�������">
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popView('dbrwcx_yhview.aspx?rwid=<%# Eval("rwid") %>')"
                                                                class="gvlink" title="<%# Eval("rwbt") %>">
                                                                <asp:Label ID="Labelrwbt" runat="server" Text='<%# Bind("rwbt") %>'> </asp:Label></a>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="mwp50" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="jsdxmc" HeaderText="������">
                                                        <HeaderStyle CssClass="mw120" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="�����̶�">
                                                        <HeaderStyle CssClass="mw60" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="Labeljjcd" runat="server" Text='<%# Bind("jjcd") %>' CssClass='<%# hkdb.set_table_label_color(Eval("jjcd").ToString())%>'></asp:Label>
                                                            </font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:ImageField DataImageUrlField="ynxs2" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderText="��ʱ">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle CssClass="mw30" />
                                                    </asp:ImageField>
                                                    <asp:ImageField DataImageUrlField="fjmc2" DataImageUrlFormatString="../../images/{0}.gif"
                                                        HeaderImageUrl="../../images/y.gif" HeaderText="������־">
                                                        <ItemStyle HorizontalAlign="center" CssClass="v-m" />
                                                        <HeaderStyle CssClass="mw30 v-m" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="rwzt" HeaderText="״̬">
                                                        <HeaderStyle CssClass="mw60" />
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
                                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="ת��" PageSize="8">
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
