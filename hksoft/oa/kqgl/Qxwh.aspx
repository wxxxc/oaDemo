<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qxwh.aspx.cs" Inherits="hkpro.oa.kqgl.Qxwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>Ա�������趨</title>
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
                                        �������ţ�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ssbm" runat="server">
                                        </asp:DropDownList>
                                        ���ټ�����<asp:DropDownList ID="query_tj" runat="server">
                                            <asp:ListItem Value="a.ui_id" Selected="True">�û�����</asp:ListItem>
                                            <asp:ListItem Value="a.ui_desc">����</asp:ListItem>
                                            <asp:ListItem Value="a.ui_status">״̬</asp:ListItem>
                                            <asp:ListItem Value="b.zwmc">ְλ</asp:ListItem>
                                            <asp:ListItem Value="e.qy_qc">������˾</asp:ListItem>
                                            <asp:ListItem Value="kqid">��Ӧ����ID</asp:ListItem>
                                            <asp:ListItem Value="Kqspry1">���ſ���������Ա</asp:ListItem>
                                            <asp:ListItem Value="Kqspry2">���������ֹ��쵼</asp:ListItem>
                                            <asp:ListItem Value="Kqspry3">�������������쵼</asp:ListItem>
                                            <asp:ListItem Value="Kqglry">���ڹ�����Ա</asp:ListItem>
                                            <asp:ListItem Value="Tskqry">���⿼����Ա</asp:ListItem>
                                            <asp:ListItem Value="Ynnjtj">���벿�����ͳ��</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="100"></asp:TextBox>
                                        <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click"
                                            CausesValidation="False"  />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" rowspan="2">
                                        �������ù����գ�
                                    </td>
                                    <td>
                                        ��<asp:TextBox ID="UserName1" runat="server" CssClass="mytext" Width="60"></asp:TextBox><img
                                            id="img1" onclick="chooseuser();" alt="" src="../../Images/choose.gif" border="0"
                                            runat="server" />�Ĺ������趨Ϊ��׼������ѡ����Ա<asp:DropDownList ID="yhfw" runat="server" Visible="false">
                                                <asp:ListItem Text="��ǰ��ѡ��Ա" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="ȫ����Ա" Value="2"></asp:ListItem>
                                            </asp:DropDownList>
                                        ��<asp:TextBox ID="ksrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="75px"></asp:TextBox>��<asp:TextBox ID="jsrq" onclick="SelectDate(this,'yyyy-MM-dd')"
                                                runat="server" CssClass="mytext" Width="75px"></asp:TextBox>��Χ�ڵĹ�������Ϣ
                                        <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="ȷ��" OnClick="Save_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <font color="red">ע��������������ʱ��ռ�úܶ��������Դ������ÿ����������ʱ�䷶Χ���ܳ���3����</font>
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
                                 DataKeyNames="ui_id"   EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                                <Columns>
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="../../images/refresh.gif">
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
                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16;
                                                height: 16" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="����">
                                        <ItemTemplate>
                                            <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ui_desc" HeaderText="����">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_sex" HeaderText="�Ա�">
                                        <HeaderStyle Width="30px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="bm_mc" HeaderText="����">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zwmc" HeaderText="ְλ">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqspry1" HeaderText="���ſ���������Ա">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqspry2" HeaderText="���������ֹ��쵼">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqspry3" HeaderText="�������������쵼">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqglry" HeaderText="���ڹ�����Ա">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="kqid" HeaderText="��Ӧ����ID">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Tskqry" HeaderText="���⿼����Ա">
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_rzrq" HeaderText="��ְ����" DataFormatString="{0:yyyy-MM-dd}"
                                        HtmlEncode="False">
                                        <ItemStyle Wrap="false" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_status" HeaderText="״̬">
                                        <HeaderStyle Width="35px" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="����">
                                        <HeaderStyle Width="100" />
                                        <ItemStyle Wrap="false" HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <a href="#" onclick="javascript:popView('Qxwh_View.aspx?id=<%# Eval("ui_id") %>')"
                                                class="gvlink">��������</a> <a href="#" onclick="javascript:popView('Qxwh_Gzrsz.aspx?id=<%# Eval("ui_id") %>')"
                                                    class="gvlink">������</a>
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
                                ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                NumericButtonCount="10" FirstPageText="��ҳ" LastPageText="ĩҳ" NextPageText="��ҳ"
                                PrevPageText="��ҳ" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
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
        ErrorMessage="��ѡ�������Ա">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ksrq"
        ErrorMessage="��ѡ��ʼ����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="jsrq"
        ErrorMessage="��ѡ���ֹ����">&nbsp;
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
