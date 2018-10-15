<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mod_Zl.aspx.cs" Inherits="hkpro.Mod_Zl" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="CssJs/WebCalendar.js"></script>
    
    <title>修改资料</title>
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

                    //上传应用图标
                    $.ajaxFileUpload({
                        url: "portal/yhgl/UpImg.ashx",
                        secureuri: false,
                        fileElementId: 'photo',
                        dataType: 'json',
                        success: function (data) {
                            //console.log(data.message);
                            //alert("上传成功");
                            $("#fj").val(data.message);
                            //console.log($("#fj").val());
                        },
                        error: function (data) {
                            var a = GetChinese(data.responseText);
                            if (a != "上传成功") {
                                alert(data.responseText);
                                document.getElementById('uploadPreview').src = "/images/logo-headere47d5.png";
                            } 
                        }
                    });
                } else {
                    alert("请上传.jpg.jpeg.png格式不超过3M的图片。");
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
                                        用户：
                                    </td>
                                    <td>
                                        <asp:Label ID="yhbm" runat="server" /><asp:Label ID="Label1" runat="server" Enabled="false"
                                            Text="-" /><asp:Label ID="xm" runat="server" />
                                    </td>
                                </tr>
                                   <tr>
                                     <td class="form-item">
                                        照片：
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
                                              <span style="color: red;">请上传.jpg.jpeg.png格式不超过3M的图片。</span>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>移动电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="150" MaxLength="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>电子邮件：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="150" MaxLength="30"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        办公电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="150" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        短号：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="czdh" runat="server" CssClass="mytext" Width="150" MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <asp:Panel ID="p_gys" runat="server">
                                    <tr>
                                        <td class="form-item">
                                            性别：
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="xb" runat="server" Width="150">
                                                <asp:ListItem Text="男" Value="男"></asp:ListItem>
                                                <asp:ListItem Text="女" Value="女"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>出生日期：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="csrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                                Width="150" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 20%" class="form-item">
                                            所属公司：
                                        </td>
                                        <td style="width: 80%">
                                            <asp:Label ID="ssgs" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            部门：
                                        </td>
                                        <td>
                                            <asp:Label ID="bm" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            职位：
                                        </td>
                                        <td>
                                            <asp:Label ID="zw" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            入职时间：
                                        </td>
                                        <td>
                                            <asp:Label ID="rzrq" runat="server" />
                                        </td>
                                    </tr>
                                     <tr>
                                     <td class="form-item">
                                        备注：
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
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
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
        ErrorMessage="请输入移动电话">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mail"
        ErrorMessage="请输入电子邮件">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="yddh"
        Display="none" ErrorMessage="移动电话格式错误，手机号码前不要加0" ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="csrq"
        ErrorMessage="请选择出生日期">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
