<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OffSealManage_Do.aspx.cs"
    Inherits="hkpro.workflow.seal.OffSealManage_Do" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>���¹���</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" align="center">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form" align="center">
                        <tr>
                            <td style="width: 20%" align="right" class="form-item">ӡ�����ƣ�
                            </td>
                            <td style="width: 80%">
                                <asp:Label ID="lbloName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="form-item">��&nbsp;&nbsp;&nbsp;&nbsp;ע��
                            </td>
                            <td>
                                <asp:Label ID="lbloRemark" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="form-item">ӡ&nbsp;&nbsp;&nbsp;&nbsp;�£�
                            </td>
                            <td>
                                <asp:Image ID="oPicNewName" runat="server" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 30">&nbsp;����ʹ����Ա��
                <asp:TextBox ID="UserName" runat="server" CssClass="mytext"></asp:TextBox>
                    <img onclick="chooseuser_s();" alt="" src="../../Images/choose.gif" border="0">&nbsp;&nbsp;
                <asp:Button ID="SaveBtn" runat="server" OnClick="Save_Click" CssClass="btn btn-primary" Text=" ȷ�� " />
                    <input type="button" name="BackBtn" value=" ���� " class="btn btn-info" onclick="javascript: location.href = 'OffSealManage.aspx'" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
                        OnRowCommand="OnRow_Command" DataKeyNames="sID" EmptyDataText="û�в鵽�������������ݣ�" Width="100%" CssClass="hkgv">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="../../Images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="sID" HeaderText="�Զ�ID">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sNAME" HeaderText="��������">
                                <HeaderStyle Width="200" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sStatus" HeaderText="����״̬">
                                <ItemStyle HorizontalAlign="Center" Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                <HeaderStyle Width="100" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sRemark" HeaderText="��ע"></asp:BoundField>
                            <asp:TemplateField HeaderText="��ز���">
                                <HeaderStyle Width="160px" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="LBtn_stop" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "sID") %>'
                                        CommandName="Stop" CssClass="gvlink" CausesValidation="false">ͣ��</asp:LinkButton>
                                    <asp:LinkButton ID="LBtn_use" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "sID") %>'
                                        CommandName="Use" CssClass="gvlink" CausesValidation="false">����</asp:LinkButton>
                                    <asp:LinkButton ID="LBtn_reset" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "sID") %>'
                                        CommandName="PwdReset" CssClass="gvlink" CausesValidation="false">��������</asp:LinkButton>
                                    <asp:LinkButton ID="LBtn_del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "sID") %>'
                                        CommandName="Del" CssClass="gvlink" CausesValidation="false">ɾ��</asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="hkHeadStyle" />
                        <RowStyle CssClass="hkRowStyle" />
                        <AlternatingRowStyle CssClass="hkAltRowStyle" />
                        <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName"
            ErrorMessage="��ѡ��ʹ����Ա">&nbsp;
        </asp:RequiredFieldValidator>
        <script language="javascript">
            var uIdName1;
            function chooseuser_s() {
                var rdm = Math.random();
                var str = "" + document.getElementById('UserID').value + "|" + document.getElementById('UserName').value + "";

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
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }

            function setValue_s(str) {
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
