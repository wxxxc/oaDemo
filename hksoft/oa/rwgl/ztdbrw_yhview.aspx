<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ztdbrw_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.ztdbrw_yhview" ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��ѯ�������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
     <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
           
        var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
        })
       
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 25px;" class="td_base">�鿴[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]��������
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                     <tr>
                                        <td class="form-item">
                                            ������Դ��
                                        </td>
                                        <td colspan="3">
                                              <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">������⣺
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�����ˣ�
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lbljsdx" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">ǣͷ�쵼��
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="qtld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�����쵼��
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">�����ˣ�
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" style="width: 15%">����ȼ���
                                        </td>
                                        <td style="width: 35%">
                                            <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item" style="width: 20%">�����̶ȣ�
                                        </td>
                                        <td style="width: 30%">
                                            <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">��ʱ���죺
                                        </td>
                                        <td>
                                            <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <asp:Panel ID="Panelrq" runat="server" Visible="false">
                                        <tr>
                                            <td class="form-item">��ʼ���ڣ�
                                            </td>
                                            <td>
                                                <asp:Label ID="lblksrq" runat="server"></asp:Label>
                                            </td>
                                            <td class="form-item">��ֹ���ڣ�
                                            </td>
                                            <td>
                                                <asp:Label ID="lbljzrq" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td class="form-item">�������ݣ�
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblnr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">���񸽼���
                                        </td>
                                        <td>
                                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                            <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="��������" />
                                        </td>
                                        <td class="form-item">����ʱ�䣺
                                        </td>
                                        <td>
                                            <asp:Label ID="fqsj" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td class="form-item">����ԭ��
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="reason" runat="server" Width="380px"></asp:TextBox>
                                        </td>
                                        <td>
                                           <a href="#" onclick="javascript:popWin_s('ztdbrw_yh_wzview.aspx?rwid=<%=rwid.Text %>')"
                                            s>
                                           <asp:Label ID="rwid" runat="server" hidden="true"> </asp:Label>�����¼</a>
                                           
                                        </td>
                                    </tr>
                                        <tr>
                                         <td class="form-item">�߰�ԭ��
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="cbreason" runat="server" Width="380px"></asp:TextBox>
                                        </td>
                                           <td>
                                           <a href="#" onclick="javascript:popWin_s('ztdbrw_yh_cbview.aspx?cbrwid=<%=cbrwid.Text %>')"
                                            >
                                           <asp:Label ID="cbrwid" runat="server" hidden="true"></asp:Label>�߰��¼</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item"></td>
                                        <td colspan="3">
                                            <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="վ����Ϣ֪ͨ������Ա" />
                                            <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ������Ա" />&nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Height="100%" Width="100%">
                                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="jsid" EmptyDataText="û�в鵽�������������ݣ�" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="������"></asp:BoundField>
                                                        <asp:ImageField DataImageUrlField="jszt" DataImageUrlFormatString="../../images/{0}.gif"
                                                            HeaderText="����״̬">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="100px" />
                                                        </asp:ImageField>
                                                        <asp:TemplateField HeaderText="����ʱ��">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Labelfbsj" runat="server" Text='<%# Bind("jssj", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                                <asp:GridView ID="GridView2" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall1" type="checkbox" onclick="chkAll1();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del1" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="ǣͷ�쵼"></asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                                  <asp:GridView ID="GridView3" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView3.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall2" type="checkbox" onclick="chkAll2();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del2" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="�����쵼"></asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                                  <asp:GridView ID="GridView4" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="ui_id" EmptyDataText="û�в鵽�������������ݣ�" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall3" type="checkbox" onclick="chkAll3();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del3" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="������"></asp:BoundField>
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
                            <td colspan="2" align="center" style="height: 30">

                                <asp:Button CssClass="btn btn-primary" ID="SendBtn" runat="server" Text="����߰�" OnClick="Send_Click" />
                                <asp:Button CssClass="btn btn-warning " ID="Button1" runat="server" Text="����" OnClick="Send_Click1"
                                     OnClientClick="return confirm('����֮���ܳ��أ�ȷ��Ҫ������')"
                                     />
                                <input type="button" name="BackBtn" value="�ر�" class="btn btn-danger" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="rwidstr" runat="server" hidden="true"></asp:Label>
    </form>
</body>
</html>
<script>
    function chkAll1() {
        var chkall = document.all["chkall1"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView2') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll2() {
        var chkall = document.all["chkall2"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView3') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll3() {
        var chkall = document.all["chkall3"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView4') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
</script>