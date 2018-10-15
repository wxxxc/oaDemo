<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqspsm_View.aspx.cs" Inherits="hkpro.oa.kqgl.Kqspsm_View"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>考勤审批说明</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                <asp:Label ID="lbltitle" runat="server"></asp:Label>考勤审批说明
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                    <tr>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>名称：
                        </td>
                        <td style="width: 80%" colspan="3">
                            <asp:TextBox ID="smmc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item" style="width: 20%">
                            类型：
                        </td>
                        <td style="width: 30%">
                            <asp:RadioButtonList ID="smlx" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                <asp:ListItem Text="请假单" Value="请假单" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="考勤说明单" Value="考勤说明单"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="form-item" style="width: 20%">
                            <font color="red">*</font>适用人员：
                        </td>
                        <td style="width: 30%">
                            <asp:DropDownList ID="syry" runat="server" Width="90%">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="申请人员" Value="申请人员"></asp:ListItem>
                                <asp:ListItem Text="部门考勤审批人员" Value="部门考勤审批人员"></asp:ListItem>
                                <asp:ListItem Text="考勤审批分管领导" Value="考勤审批分管领导"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                height: 280px;"></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center" style="height: 30">
                <asp:Button CssClass="mybtn" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click"
                    Visible="false" />
                <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click">
                </asp:Button>
                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click"
                    Visible="false" OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="smmc"
        ErrorMessage="请输入名称">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="syry"
        ErrorMessage="请选择适用人员">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
