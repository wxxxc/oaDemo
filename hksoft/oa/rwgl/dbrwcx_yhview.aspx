<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbrwcx_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.dbrwcx_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���������ѯ</title>
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
    <style>
        .a {
        float:left;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2" style="height: 25" class="td_base">�鿴[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]��������
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                       <tr>
                                        <td class="form-item">
                                            ������Դ��
                                        </td>
                                        <td colspan="3">
                                          
                                              <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label>   </td>
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
                                        <td class="form-item" style="width: 20%">����ȼ���
                                        </td>
                                        <td style="width: 30%">
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
                                        <td class="form-item">����ʱ�䣺
                                        </td>
                                        <td>
                                            <asp:Label ID="fqsj" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">���񸽼���
                                        </td>
                                        <td>
                                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" id="ff" target="_blank">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                            <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="��������" />
                                            <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel2" runat="server" Width="100%" HorizontalAlign="center">
            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                DataKeyNames="jsid" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                <Columns>
                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="cszt" DataImageUrlFormatString="../../images/{0}.gif"
                        HeaderText="��ʱ">
                        <ItemStyle HorizontalAlign="center" />
                        <HeaderStyle Width="20px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="����">
                        <HeaderStyle Width="20px" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                                   <a class="a" href="<%=qy_fjylurl.Text %><%# Eval("fjlj") %><%# Eval("fjmc") %>" style='<%# isshowfj(Eval("fjlj").ToString()+Eval("fjlj").ToString()) %>' target="_blank" id="f">Ԥ��</a>
                                  
                            <a class="a" href="../../<%# Eval("fjlj") %><%# Eval("fjmc") %>" target="_blank">
                                <asp:Image ID="Image221" runat="server" ImageUrl='<%# Eval("fjmc2", "../../images/{0}.gif") %>' BorderWidth="0" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ui_desc" HeaderText="������"></asp:BoundField>
                    <asp:BoundField DataField="jszt" HeaderText="״̬">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="clsj" HeaderText="����ʱ��" DataFormatString="{0:yy-MM-dd}"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="center" />
                    </asp:BoundField>
                   <%-- <asp:BoundField DataField="fpxs" HeaderText="������ʽ">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fpsm" HeaderText="����˵��"></asp:BoundField>--%>
                    <asp:TemplateField HeaderText="���˵��">
                        <ItemTemplate>
                            <asp:Label ID="Labelwcsm" runat="server" Text='<%# Bind("bzsm") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="�����">
                        <ItemTemplate>
                            <asp:Label ID="Labelshr" runat="server" Text='<%# Bind("spr") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="spsj" HeaderText="���ʱ��" DataFormatString="{0:yy-MM-dd}"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="������" SortExpression="spyj">
                        <ItemTemplate>
                            <asp:Label ID="Labelspyj" runat="server" Text='<%# Bind("spyj") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="����" SortExpression="sppj">
                        <ItemTemplate>
                            <asp:Label ID="Labelpj" runat="server" Text='<%# Bind("sppj") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="�˻�">
                        <ItemTemplate>
                            <asp:Label ID="Labelthcs" runat="server" Text='<%# Bind("thcs") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="hkRowStyle" />
                <HeaderStyle CssClass="hkHeadStyle" />
                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
            </asp:GridView>
        </asp:Panel>
        <table cellspacing="0" cellpadding="0" border="0" width="100%" id="hkshow1">
            <tr>
                <td colspan="2" align="center" style="height: 30">
                    <input type="button" name="print" class="btn btn-primary" value="�� ӡ" onclick="javascript: PrintPage1()">
                    <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript: window.close()" />
                </td>
            </tr>
        </table>
        <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
