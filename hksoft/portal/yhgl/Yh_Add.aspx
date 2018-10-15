<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yh_Add.aspx.cs" Inherits="hkpro.portal.yhgl.Yh_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>�û�����</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../Scripts/jquery.js"></script>
    <script src="../../Scripts/ajaxfileupload.js"></script>
</head>
    
    <script type="text/javascript">
        $(function () {
            initControl();
        });
        function GetChinese(strValue) {  
            if(strValue!= null && strValue!= ""){  
                var reg = /[\u4e00-\u9fa5]/g;   
                return strValue.match(reg).join("");  
            }  
            else  
                return "";  
        } 
        function initControl() {
            $('#photo').change(function () {
                var f = document.getElementById('photo').files[0];
                var fileName = $(this).val();
                var ext = fileName.substr(fileName.lastIndexOf('.'));
                var filelength = f.size;
                if (ext == ".jpeg" || ext == ".jpg" || ext == ".png" && filelength <= 3000000) {

                    var src = window.URL.createObjectURL(f);
                    document.getElementById('uploadPreview').src = src;
                    //�ϴ�Ӧ��ͼ��
                    $.ajaxFileUpload({
                        url: "UpImg.ashx",
                        secureuri: false,
                        fileElementId: 'photo',
                        dataType: 'json',
                        success: function (data) {
                            //console.log(data.message);
                            //alert("�ϴ��ɹ�");
                            $("#fj").val(data.message);
                            //console.log($("#fj").val());
                        },
                        error: function (data) {
                            var a = GetChinese(data.responseText);
                            if (a != "�ϴ��ɹ�") {
                                alert(data.responseText);
                                document.getElementById('uploadPreview').src = "/images/logo-headere47d5.png";
                            }
                        }
                    });
                } else {
                    alert("���ϴ�.jpg.jpeg.png��ʽ������3M��ͼƬ��");
                }
               
            });
        }
       
    </script>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                �����û���Ϣ
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td colspan="4" align="center">
                                        <b>==������Ϣ==</b>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>������˾��
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="ssgs" runat="server" CssClass="mytext" Width="96%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>�û����룺
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="yhbm" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>������
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>��¼���룺
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dlmm" runat="server" CssClass="mytext" Width="90%" TextMode="password"
                                            MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>ȷ�����룺
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="mytext" ID="Rnewpwd" runat="server" TextMode="Password" Width="90%"
                                            MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                     <td class="form-item">
                                        <font color="red">*</font>������λ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ssgs" runat="server" CssClass="mytext" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>�������ţ�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>ְλ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zwmc" runat="server" CssClass="mytext" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>��ɫ��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="gwjs" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�ʺ���Ч�գ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>�ʺŵ����գ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �Ա�
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xb" runat="server" Width="90%">
                                            <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                            <asp:ListItem Text="Ů" Value="Ů"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        �������ڣ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="csrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                     <td class="form-item">
                                        ��Ƭ��
                                    </td>
                                    <td>
                                        <div style="width: 300px;">
                                            <div>
                                                <div class="file" style="width: 100px;">
                                                    <asp:TextBox ID="fj" runat="server" hidden="true" CssClass="mytext" Width="90%"></asp:TextBox>

                                                    <img id="uploadPreview" style="width: 100px;" src="/images/logo-headere47d5.png" />
                                                    <input runat="server"  class="mytext"  type="file" name="photo" id="photo">
                                                </div>
                                              <span style="color: red;">���ϴ�.jpg.jpeg.png��ʽ������3M��ͼƬ��</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="form-item">
                                        ��ע��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                            Rows="8"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        ״̬��
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zt" runat="server" Width="90%">
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynbmglz" runat="server" Text="�Ƿ��������ŵĹ�����Ա" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <b>==��ϵ��ʽ==</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �����ʼ���
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �ƶ��绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="90%" MaxLength="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �칫�绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        �̺ţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="btn btn-success" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" />
                            <asp:Button CssClass="btn btn-info" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="�� ��" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ssgs"
        ErrorMessage="��ѡ��������˾">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="yhbm"
        ErrorMessage="�������û�����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="xm"
        ErrorMessage="����������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="dlmm"
        ErrorMessage="�������¼����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rnewpwd"
        ErrorMessage="������ȷ������">&nbsp; </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="dlmm" Type="String"
        ControlToCompare="rnewpwd" ErrorMessage="��¼������ȷ�����벻����">&nbsp;</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="zwmc"
        ErrorMessage="��ѡ��ְλ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gwjs"
        ErrorMessage="��ѡ���ɫ">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="bm"
        ErrorMessage="��ѡ����������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="��ѡ���ʺ���Ч����">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="��ѡ���ʺŵ�������">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="yhbm"
        Display="none" ErrorMessage="�û��������Ϊ���֡���ĸ��������" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="dlmm"
        Display="none" ErrorMessage="��¼�������Ϊ���֡���ĸ��������" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="Rnewpwd"
        Display="none" ErrorMessage="ȷ���������Ϊ���֡���ĸ��������" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="yddh"
        Display="none" ErrorMessage="�ƶ��绰��ʽ�����ֻ�����ǰ��Ҫ��0" ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="bz"
        Display="none" ErrorMessage="��ע���ݲ��ܳ���50����" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="csrq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="�������ڸ�ʽ���󣬸�ʽ�ο�1980-01-01" Type="date" runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtSdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="�ʺ���Ч�ո�ʽ���󣬸�ʽ�ο�2008-01-01" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtEdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="�ʺŵ����ո�ʽ���󣬸�ʽ�ο�2008-12-31" Type="date"
        runat="server">
    </asp:CompareValidator>
    </form>
</body>
</html>
