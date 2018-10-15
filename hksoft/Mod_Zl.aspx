<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mod_Zl.aspx.cs" Inherits="hkpro.Mod_Zl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="CssJs/WebCalendar.js"></script>
    
    <title>�޸�����</title>
    <script src="../../Scripts/jquery.js"></script>
    <script src="../../Scripts/ajaxfileupload.js"></script>
       <script type="text/javascript">
        $(function () {
            initControl();
        });
        function GetChinese(strValue) {
            if (strValue != null && strValue != "") {
                var reg = /[\u4e00-\u9fa5]/g;
                return strValue.match(reg).join("");
            }
            else
                return "";
        }
        function initControl() {
           
            var cText = $('#fjNumber').text();
            if(cText!=""){
                document.getElementById('uploadPreview').src =cText;
            }
            $('#photo').change(function () {
                var f = document.getElementById('photo').files[0];
                var fileName = $(this).val();
                var ext = fileName.substr(fileName.lastIndexOf('.'));
                var filelength = f.size;
                if ((ext == ".jpeg" || ext == ".jpg" || ext == ".png") && filelength <= 3000000) {

                    var src = window.URL.createObjectURL(f);
                    document.getElementById('uploadPreview').src = src;

                    //�ϴ�Ӧ��ͼ��
                    $.ajaxFileUpload({
                        url: "portal/yhgl/UpImg.ashx",
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
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        �û���
                                    </td>
                                    <td>
                                        <asp:Label ID="yhbm" runat="server" /><asp:Label ID="Label1" runat="server" Enabled="false"
                                            Text="-" /><asp:Label ID="xm" runat="server" />
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

                                                       <asp:Label ID="fjNumber" runat="server" hidden="true"></asp:Label>
                                                    <img id="uploadPreview" style="width: 100px;" src="/images/logo-headere47d5.png" />
                                                    <input runat="server"  class="mytext"  type="file" name="photo" id="photo">
                                                </div>
                                              <span style="color: red;">���ϴ�.jpg.jpeg.png��ʽ������3M��ͼƬ��</span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�ƶ��绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="150" MaxLength="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>�����ʼ���
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="150" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �칫�绰��
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="150" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        �̺ţ�
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="150" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <asp:Panel ID="p_gys" runat="server">
                                    <tr>
                                        <td class="form-item">
                                            �Ա�
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="xb" runat="server" Width="150">
                                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                                <asp:ListItem Text="Ů" Value="Ů"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>�������ڣ�
                                        </td>
                                        <td>
                                            <asp:TextBox ID="csrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                Width="150" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%" class="form-item">
                                            ������˾��
                                        </td>
                                        <td style="width: 80%">
                                            <asp:Label ID="ssgs" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            ���ţ�
                                        </td>
                                        <td>
                                            <asp:Label ID="bm" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            ְλ��
                                        </td>
                                        <td>
                                            <asp:Label ID="zw" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            ��ְʱ�䣺
                                        </td>
                                        <td>
                                            <asp:Label ID="rzrq" runat="server" />
                                        </td>
                                    </tr>
                                     <tr>
                                     <td class="form-item">
                                        ��ע��
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                            Rows="3"></asp:TextBox>
                                    </td>
                                </tr>
                                </asp:Panel>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30" align="center">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="�� ��" OnClick="Save_Click">
                            </asp:Button>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="yddh"
        ErrorMessage="�������ƶ��绰">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mail"
        ErrorMessage="����������ʼ�">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="yddh"
        Display="none" ErrorMessage="�ƶ��绰��ʽ�����ֻ�����ǰ��Ҫ��0" ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="csrq"
        ErrorMessage="��ѡ���������">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
