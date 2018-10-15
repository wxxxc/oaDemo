<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mod_Zl.aspx.cs" Inherits="hkpro.app.portal.Mod_Zl" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/global.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>
    <style>
         .bc_btn .ui-submit {
            height: 49px !important;
            border-radius: 4em !important;
            background: #1E88E5 !important;
            border: 0px !important;
            width: 90%;
            left: 15px;
        }

        .ui-btn-hidden {
            border-radius: 4em !important;
        }
         .btn {
    padding: 7px 12px;
    font-size: 16px;
    cursor: pointer;
}
    </style>
</head>
<body>
    <form id="form1" runat="server" data-ajax="false">
        <div data-role="page" id="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='Set.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>修改资料</h1>
                    </div>
                </div>
            </div>
            <br />
            <div data-role="content" data-theme="d" class="mycontent_detail">
                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="用户名:" AssociatedControlID="txtyhbm" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="txtyhbm" CssClass="form-control" runat="server" placeholder="请输入用户名"  Width="90%" readonly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>


                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="姓名:" AssociatedControlID="txtxm" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="txtxm" CssClass="form-control" runat="server" placeholder="请输入姓名" required="required" Width="90%" readonly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="单位:" AssociatedControlID="txtssgs" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="txtssgs" CssClass="form-control" runat="server" placeholder="请输入单位"  Width="90%" readonly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>


                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="部门:" AssociatedControlID="txtbm" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="txtbm" CssClass="form-control" runat="server" placeholder="请输入部门"  Width="90%" readonly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="职位:" AssociatedControlID="txtzw" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="txtzw" CssClass="form-control" runat="server" placeholder="请输入职位"  Width="90%" readonly="true"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="入职时间:" AssociatedControlID="txtrzrq" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="txtrzrq" CssClass="form-control" runat="server" placeholder="请输入入职时间" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="性别:" AssociatedControlID="xb" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:RadioButtonList ID="xb" runat="server" AutoPostBack="True" RepeatColumns="2" TabIndex="2" CellPadding="0">
                            <asp:ListItem Value="男" />
                            <asp:ListItem Value="女" />
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="separated_line"></div>

                <%--性别：<asp:DropDownList ID="DropDownList1" runat="server" data-inline="true" data-mini="true">
                <asp:ListItem Text="男" Value="男"></asp:ListItem>
                <asp:ListItem Text="女" Value="女"></asp:ListItem>
            </asp:DropDownList><br />--%>
                <%--<div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="出生日期:" AssociatedControlID="csrq" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="csrq" CssClass="form-control" runat="server" onclick="SelectDate(this,'yyyy-MM-dd')" placeholder="请输入出生日期" required="required" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>--%>


                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="移动电话:" AssociatedControlID="yddh" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="yddh" CssClass="form-control" runat="server" placeholder="请输入移动电话" required="required" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="电子邮件:" AssociatedControlID="mail" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="mail" CssClass="form-control" runat="server" placeholder="请输入电子邮件" required="required" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="办公电话:" AssociatedControlID="bgdh" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="bgdh" CssClass="form-control" runat="server" placeholder="请输入办公电话" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>

                <div class="row con_div">
                    <div class="col-3 text-right">
                        <asp:Label runat="server" Text="短号:" AssociatedControlID="czdh" CssClass="title"></asp:Label>
                    </div>
                    <div class="col-9 text-left">
                        <asp:TextBox ID="czdh" CssClass="form-control" runat="server" placeholder="请输入短号" Width="90%"></asp:TextBox>
                    </div>
                </div>
                <div class="separated_line"></div>
                    <div align="center" style="margin-bottom:5%;margin-top:10px" class="btn_color">
                        <asp:Button ID="SaveBtn" runat="server" Text="保存" data-theme="e" data-mini="true"
                            OnClick="Save_Click" CssClass=" btn btn-info" Width="90%"/>
                    </div>
                </div>
            </div>

            <%-- <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="yddh"
            ErrorMessage="请输入移动电话">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mail"
            ErrorMessage="请输入电子邮件">&nbsp;
        </asp:RequiredFieldValidator>--%>
    </form>
</body>
</html>
