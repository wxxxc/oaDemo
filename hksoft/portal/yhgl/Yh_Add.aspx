<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Yh_Add.aspx.cs" Inherits="hkpro.portal.yhgl.Yh_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <title>用户管理</title>
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
                    //上传应用图标
                    $.ajaxFileUpload({
                        url: "UpImg.ashx",
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
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                新增用户信息
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
                                        <b>==基本信息==</b>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>所属公司：
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="ssgs" runat="server" CssClass="mytext" Width="96%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>用户编码：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="yhbm" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>姓名：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>登录密码：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="dlmm" runat="server" CssClass="mytext" Width="90%" TextMode="password"
                                            MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>确认密码：
                                    </td>
                                    <td>
                                        <asp:TextBox CssClass="mytext" ID="Rnewpwd" runat="server" TextMode="Password" Width="90%"
                                            MaxLength="20"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                     <td class="form-item">
                                        <font color="red">*</font>所属单位：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ssgs" runat="server" CssClass="mytext" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>所属部门：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>职位：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zwmc" runat="server" CssClass="mytext" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>角色：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="gwjs" runat="server" Width="90%">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>帐号生效日：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>帐号到期日：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                            CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        性别：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="xb" runat="server" Width="90%">
                                            <asp:ListItem Text="男" Value="男"></asp:ListItem>
                                            <asp:ListItem Text="女" Value="女"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        出生日期：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="csrq" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server" CssClass="mytext"
                                            Width="90%" MaxLength="10"></asp:TextBox>
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

                                                    <img id="uploadPreview" style="width: 100px;" src="/images/logo-headere47d5.png" />
                                                    <input runat="server"  class="mytext"  type="file" name="photo" id="photo">
                                                </div>
                                              <span style="color: red;">请上传.jpg.jpeg.png格式不超过3M的图片。</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="form-item">
                                        备注：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                            Rows="8"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        状态：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="zt" runat="server" Width="90%">
                                            <asp:ListItem Text="正常" Value="正常"></asp:ListItem>
                                            <asp:ListItem Text="禁用" Value="禁用"></asp:ListItem>
                                            <asp:ListItem Text="建档" Value="建档"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td>
                                        <asp:CheckBox ID="ynbmglz" runat="server" Text="是否所属部门的管理人员" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        <b>==联系方式==</b>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        电子邮件：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        移动电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="yddh" runat="server" CssClass="mytext" Width="90%" MaxLength="12"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        办公电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="bgdh" runat="server" CssClass="mytext" Width="90%" MaxLength="20"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        短号：
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
                            <asp:Button CssClass="btn btn-success" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" />
                            <asp:Button CssClass="btn btn-info" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ssgs"
        ErrorMessage="请选择所属公司">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="yhbm"
        ErrorMessage="请输入用户编码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="xm"
        ErrorMessage="请输入姓名">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="dlmm"
        ErrorMessage="请输入登录密码">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Rnewpwd"
        ErrorMessage="请输入确认密码">&nbsp; </asp:RequiredFieldValidator>
    <asp:CompareValidator ID="Compare1" runat="server" ControlToValidate="dlmm" Type="String"
        ControlToCompare="rnewpwd" ErrorMessage="登录密码与确认密码不符！">&nbsp;</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="zwmc"
        ErrorMessage="请选择职位">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gwjs"
        ErrorMessage="请选择角色">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="bm"
        ErrorMessage="请选择所属部门">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSdate"
        ErrorMessage="请选择帐号生效日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtEdate"
        ErrorMessage="请选择帐号到期日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="yhbm"
        Display="none" ErrorMessage="用户编码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="dlmm"
        Display="none" ErrorMessage="登录密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="Rnewpwd"
        Display="none" ErrorMessage="确认密码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="yddh"
        Display="none" ErrorMessage="移动电话格式错误！手机号码前不要加0" ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator9" ControlToValidate="bz"
        Display="none" ErrorMessage="备注内容不能超过50个字" ValidationExpression="^(\s|\S){0,50}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="csrq" Display="none"
        Operator="DataTypeCheck" ErrorMessage="出生日期格式错误，格式参考1980-01-01" Type="date" runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator2" ControlToValidate="txtSdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="帐号生效日格式错误，格式参考2008-01-01" Type="date"
        runat="server">
    </asp:CompareValidator>
    <asp:CompareValidator ID="CompareValidator3" ControlToValidate="txtEdate" Display="none"
        Operator="DataTypeCheck" ErrorMessage="帐号到期日格式错误，格式参考2008-12-31" Type="date"
        runat="server">
    </asp:CompareValidator>
    </form>
</body>
</html>
