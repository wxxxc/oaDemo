<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fbdbrw_yhmod.aspx.cs" Inherits="hkpro.oa.rwgl.fbdbrw_yhmod"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�޸Ĵ�������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    
     <script src="../../res/js/jquery.js"></script>
    <script>
          $(document).ready(function () {
        var a = "<%=savefj.NavigateUrl %>";
              if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
       
        })
        function openAddressList(stringfiled) {
            window.open(stringfiled, "ѡ���û�", 'width=600,height=450,top=' + (screen.height - 450) / 2 + ',left=' + (screen.width - 600) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
        <tr>
            <td style="height: 25px" class="td_base" colspan="2">
                �޸�[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]��������
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
                            <asp:TextBox ID="rwly" runat="server" CssClass="mytext" Width="93%" Style="color: red; font-weight: bold"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>������⣺
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="rwbt" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>ѡ������ˣ�
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="jsdx" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                Rows="2" Width="580" ToolTip="����û�֮������,�ŷֿ�"></asp:TextBox>
                            <img src="../../images/choose.gif"
                                    onclick="javascript:openAddressList('../../choose/oa/rwview_yh.aspx');" alt="ѡ���û�" />
                        </td>
                    </tr>
                     <tr>
                                    <td class="form-item">
                                        ѡ��ǣͷ�쵼��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="qtld" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="580" ToolTip="���֮������,�ŷֿ�"></asp:TextBox>
                                        <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview1.aspx');" alt="ѡ��" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                       ѡ�������쵼��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="zrld" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="580" ToolTip="���֮������,�ŷֿ�"></asp:TextBox>
                                        <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview2.aspx');" alt="ѡ��" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ѡ�������ˣ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="zrr" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="580" ToolTip="���֮������,�ŷֿ�"></asp:TextBox>
                                        <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview3.aspx');" alt="ѡ��" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                       ѡ��ǣͷ���ţ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="qtbm" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="580" ToolTip="���֮������,�ŷֿ�"></asp:TextBox>
                                        <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview_dw.aspx');" alt="ѡ��" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ѡ�����β��ţ�
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="zrbm" runat="server" CssClass="mytextarea" TextMode="multiLine"
                                            Rows="2" Width="580" ToolTip="���֮������,�ŷֿ�"></asp:TextBox>
                                        <img src="../../images/choose.gif"
                                                onclick="javascript:openAddressList('../../choose/oa/rwview4.aspx');" alt="ѡ��" />
                                    </td>
                                </tr>
                                <tr>
                    <tr>
                        <td class="form-item" style="width: 15%">
                            <font color="red">*</font>����ȼ���
                        </td>
                        <td style="width: 35%">
                            <asp:DropDownList ID="rwxz" runat="server" Width="90%">
                            </asp:DropDownList>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>�����̶ȣ�
                        </td>
                        <td style="width: 30%">
                            <asp:DropDownList ID="jjcd" runat="server" Width="90%">
                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                <asp:ListItem Text="��" Value="��" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                        </td>
                        <td>
                            <asp:CheckBox ID="ynxs" runat="server" AutoPostBack="true" OnCheckedChanged="ynxs_click"
                                Text="�Ƿ���ʱ����"></asp:CheckBox>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <asp:Panel ID="Panelrq" runat="server" ScrollBars="Auto">
                        <tr>
                            <td class="form-item">
                                <font color="red">*</font>��ʼ���ڣ�
                            </td>
                            <td colspan="3">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="width: 108px">
                                            <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                CssClass="mytext" Width="100" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td style="width: 70">
                                            <asp:DropDownList ID="sxs" runat="server" Width="60">
                                                <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="06��" Value="06"></asp:ListItem>
                                                <asp:ListItem Text="07��" Value="07"></asp:ListItem>
                                                <asp:ListItem Text="08��" Value="08"></asp:ListItem>
                                                <asp:ListItem Text="09��" Value="09"></asp:ListItem>
                                                <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="11��" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="12��" Value="12"></asp:ListItem>
                                                <asp:ListItem Text="13��" Value="13"></asp:ListItem>
                                                <asp:ListItem Text="14��" Value="14"></asp:ListItem>
                                                <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="16��" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="17��" Value="17"></asp:ListItem>
                                                <asp:ListItem Text="18��" Value="18"></asp:ListItem>
                                                <asp:ListItem Text="19��" Value="19"></asp:ListItem>
                                                <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="21��" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="22��" Value="22"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="sfz" runat="server" Width="60">
                                                <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="00��" Value="00"></asp:ListItem>
                                                <asp:ListItem Text="05��" Value="05"></asp:ListItem>
                                                <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="25��" Value="25"></asp:ListItem>
                                                <asp:ListItem Text="30��" Value="30"></asp:ListItem>
                                                <asp:ListItem Text="35��" Value="35"></asp:ListItem>
                                                <asp:ListItem Text="40��" Value="40"></asp:ListItem>
                                                <asp:ListItem Text="45��" Value="45"></asp:ListItem>
                                                <asp:ListItem Text="50��" Value="50"></asp:ListItem>
                                                <asp:ListItem Text="55��" Value="55"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                <font color="red">*</font>��ֹ���ڣ�
                            </td>
                            <td colspan="3">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="width: 108px">
                                            <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                CssClass="mytext" Width="100" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td style="width: 70">
                                            <asp:DropDownList ID="exs" runat="server" Width="60">
                                                <asp:ListItem Text="Сʱ" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="06��" Value="06"></asp:ListItem>
                                                <asp:ListItem Text="07��" Value="07"></asp:ListItem>
                                                <asp:ListItem Text="08��" Value="08"></asp:ListItem>
                                                <asp:ListItem Text="09��" Value="09"></asp:ListItem>
                                                <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="11��" Value="11"></asp:ListItem>
                                                <asp:ListItem Text="12��" Value="12"></asp:ListItem>
                                                <asp:ListItem Text="13��" Value="13"></asp:ListItem>
                                                <asp:ListItem Text="14��" Value="14"></asp:ListItem>
                                                <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="16��" Value="16"></asp:ListItem>
                                                <asp:ListItem Text="17��" Value="17"></asp:ListItem>
                                                <asp:ListItem Text="18��" Value="18"></asp:ListItem>
                                                <asp:ListItem Text="19��" Value="19"></asp:ListItem>
                                                <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="21��" Value="21"></asp:ListItem>
                                                <asp:ListItem Text="22��" Value="22"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="efz" runat="server" Width="60">
                                                <asp:ListItem Text="����" Value="" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="00��" Value="00"></asp:ListItem>
                                                <asp:ListItem Text="05��" Value="05"></asp:ListItem>
                                                <asp:ListItem Text="10��" Value="10"></asp:ListItem>
                                                <asp:ListItem Text="15��" Value="15"></asp:ListItem>
                                                <asp:ListItem Text="20��" Value="20"></asp:ListItem>
                                                <asp:ListItem Text="25��" Value="25"></asp:ListItem>
                                                <asp:ListItem Text="30��" Value="30"></asp:ListItem>
                                                <asp:ListItem Text="35��" Value="35"></asp:ListItem>
                                                <asp:ListItem Text="40��" Value="40"></asp:ListItem>
                                                <asp:ListItem Text="45��" Value="45"></asp:ListItem>
                                                <asp:ListItem Text="50��" Value="50"></asp:ListItem>
                                                <asp:ListItem Text="55��" Value="55"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td class="form-item">
                            �������ݣ�
                        </td>
                        <td colspan="3">
                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                height: 180px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            ��������
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="fjname" runat="server" CssClass="mytext" Width="10%"></asp:TextBox>
                            ������<input id="fj" runat="server" type="file" style="width: 60%" class="mytext" />
                          <%--  <a href="http://ow365.cn/?i=16630&furl=http://www.ynlanpu.com/Attach/oa/rw/admin/41421754/%E6%96%B0%E5%BB%BA%E6%96%87%E6%9C%AC%E6%96%87%E6%A1%A3.txt" target="_blank">����Ԥ��</a> 
                             <a href="http://ow365.cn/?i=16630&furl=http://www.ynlanpu.com/Attach/oa/rw/admin/51255805/�����嵥.doc" target="_blank">����Ԥ��</a> 
                          <a href="http://ow365.cn/?i=16630&furl=http://www.ynlanpu.com/Attach/oa/rw/admin/3617706/�ɹ��嵥.doc" target="_blank">����Ԥ��</a> 
                       --%>  
                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">����Ԥ��</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>&nbsp;
                            <asp:HyperLink ID="savefj" Enabled="true" Text="����" Target="_blank" runat="server" CssClass="gvlink"
                                ToolTip="��������" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="btn btn-success" ID="SaveAddBtn" runat="server" Text="���沢�ر�" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="btn btn-primary" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click">
                </asp:Button>
                <input type="button" name="BackBtn" value="�ر�" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="rwbt"
        ErrorMessage="�������������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jjcd"
        ErrorMessage="��ѡ������̶�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rwxz"
        ErrorMessage="��ѡ������ȼ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="jsdx"
        ErrorMessage="��ѡ���������">&nbsp;
    </asp:RequiredFieldValidator>

    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
