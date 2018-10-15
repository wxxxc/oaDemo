<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rwfabudanweiAdd.aspx.cs" Inherits="hksoft.oa.rwgl.rwfabudanweiAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
   
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
</head>
    
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
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>序号：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox CssClass="mytext" ID="num" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        <font color="red">*</font>单位名称：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="name" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                     <td class="form-item" style="width: 20%">
                                        单位负责人：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="charge" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        单位地址：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="address" runat="server" CssClass="mytextarea" Width="90%" TextMode="multiLine"
                                            Rows="3"></asp:TextBox>
                                    </td>
                                </tr>
                               
                                <tr>
                                    <td colspan="4" align="center">
                                        <b>==联系方式==</b>
                                    </td>
                                </tr>
                                <tr>
                                     <td class="form-item">
                                        联系电话：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tel" runat="server" CssClass="mytext" Width="90%" MaxLength="12"></asp:TextBox>
                                    </td>
                                   <%-- <td class="form-item">
                                        电子邮件：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="email" runat="server" CssClass="mytext" Width="90%" MaxLength="30"></asp:TextBox>
                                    </td>--%>
                                   
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="num"
        ErrorMessage="请输入序号">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="name"
        ErrorMessage="请输入单位名称">&nbsp;
    </asp:RequiredFieldValidator>
  
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="tel"
        Display="none" ErrorMessage="移动电话格式错误！手机号码前不要加0" ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
        runat="server">
    </asp:RegularExpressionValidator>
   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="num"
        Display="none" ErrorMessage="序号必须为数字" ValidationExpression="^[0-9]*$"
        runat="server">
    </asp:RegularExpressionValidator>
    </form>
</body>
</html>
