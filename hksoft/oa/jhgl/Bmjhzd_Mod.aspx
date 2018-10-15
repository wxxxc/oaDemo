<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bmjhzd_Mod.aspx.cs" Inherits="hkpro.oa.jhgl.Bmjhzd_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�鿴���żƻ�</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="height: 25px">
                    <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click"
                        CausesValidation="true" Visible="false"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="DelJhBtn" runat="server" Text="ɾ���ƻ�" OnClick="DelJh_Click"
                        OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Visible="false"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="SendBtn" runat="server" Text="����" OnClick="Send_Click"
                        CausesValidation="true" Visible="false"></asp:Button>
                    <asp:Button ID="AddBtn" Text="����������" CssClass="mybtn" runat="server" Visible="false"
                        CausesValidation="false" />
                    <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="ɾ��������" OnClick="Del_Click"
                        Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" />
                    <asp:Button CssClass="mybtn" ID="UpBtn" runat="server" Text="�ύ����" OnClick="Up_Click"
                        Visible="false" />
                    <input type="button" name="BackBtn" value="�ر�" class="mybtn" onclick="javascript: window.close()" />&nbsp;
                </td>
                <td class="td_base"></td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                        <tr>
                            <td colspan="4" align="center" style="height: 25">
                                <asp:Label ID="ny" runat="server" Font-Size="12pt"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item" style="width: 20%">
                                <font color="red">*</font>����Ŀ�꣺
                            </td>
                            <td colspan="3" style="width: 80%">
                                <asp:TextBox ID="ztmb" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                    ReadOnly="true" Rows="2"></asp:TextBox>
                            </td>
                        </tr>
                        <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                            <tr>
                                <td class="form-item">���������
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="96%" ReadOnly="true"
                                        TextMode="multiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-item">
                                    <font color="red">*</font>�������ۣ�
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="zwpj" runat="server" CssClass="mytextarea" Width="96%" ReadOnly="true"
                                        TextMode="multiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="songshen" runat="server" Visible="false">
                            <tr>
                                <td class="form-item">&nbsp;
                                </td>
                                <td colspan="3">
                                    <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ������" Checked="true" />
                                    <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ������" />
                                </td>
                            </tr>
                            <tr>
                                <td class="form-item">
                                    <font color="red">*</font>ѡ�������ˣ�
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="UserName" runat="server" Rows="2" TextMode="MultiLine" Width="90%"
                                        CssClass="mytextarea"></asp:TextBox>
                                    <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                                </td>
                            </tr>
                        </asp:Panel>
                        <asp:Panel ID="zgpjpanel" runat="server" Visible="false">
                            <tr>
                                <td class="form-item" style="width: 20%">�������ۣ�
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="zgpjnr" runat="server" CssClass="mytextarea" Width="85%" ReadOnly="true"
                                        TextMode="multiLine" Rows="2"></asp:TextBox>
                                    <asp:TextBox ID="df" runat="server" CssClass="mytext" Width="30" ReadOnly="true"></asp:TextBox>��
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                            DataKeyNames="id" EmptyDataText="��ʱû����ϸ�ƻ�" Width="100%" CssClass="hkgv">
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
                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                    <HeaderTemplate>
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="id" HeaderText="����">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                    <FooterStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="��������">
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popView('bmjh_gzx_mod.aspx?type=m&i=<%=istr %>&id=<%# Eval("id") %>&jhid=<%# Eval("jhid") %>')"
                                            class="gvlink">
                                            <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("gzzt") %>'></asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="jhkssj" HeaderText="�ƻ���ʼʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                    HtmlEncode="False">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="jhwcsj" HeaderText="�ƻ����ʱ��" DataFormatString="{0:yyyy-MM-dd}"
                                    HtmlEncode="False">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="hkRowStyle" />
                            <HeaderStyle CssClass="hkHeadStyle" />
                            <AlternatingRowStyle CssClass="hkAltRowStyle" />
                            <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                        </asp:GridView>
                    </table>
                </td>
            </tr>
        </table>
        <!--����label-->
        <asp:Label ID="zt" runat="server" Visible="false" />
        <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ztmb"
            ErrorMessage="����������Ŀ��">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="zwpj"
            ErrorMessage="������������������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserName"
            ErrorMessage="��ѡ��������">&nbsp;
        </asp:RequiredFieldValidator>
        <script language="javascript">
            var uIdName;
            function chooseuser_m() {
                var num = Math.random();
                var str = "" + document.getElementById('UserID').value + "";

                //browser
                var bstr = getBrowserType();
                if (bstr == '3' | bstr == '4' | bstr == '5') {
                    window.open("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", 'newwindow', 'height=520,width=650,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
                }
                else {
                    uIdName = window.showModalDialog("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", "newwindow", "dialogWidth:650px;DialogHeight=520px;status:no;scroll=no;help:no");
                }

                var arr = uIdName.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }

            function setValue(str) {
                var arr = str.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }
        </script>
    </form>
</body>
</html>
