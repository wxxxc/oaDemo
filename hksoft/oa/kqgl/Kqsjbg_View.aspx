<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kqsjbg_View.aspx.cs" Inherits="hkpro.oa.kqgl.Kqsjbg_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>考勤数据变更</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                变更考勤数据明细
            </td>
            <td class="td_base" style="width: 20%">
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
                                    <td class="form-item">
                                        考勤机ID：
                                    </td>
                                    <td>
                                        <asp:Label ID="rybh" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="height: 25;">
                                        姓名：
                                    </td>
                                    <td>
                                        <asp:Label ID="xm" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        考勤日期：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:Label ID="kqrq" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 30%">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        ===上午班===
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        上班1：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sb1" runat="server" CssClass="mytext" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        下班2：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xb2" runat="server" CssClass="mytext" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>迟到次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cdcs1" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>早退次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ztcs1" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>无签到次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wqdcs1" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>无签退次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wqtcs1" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>旷工次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kgcs1" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        ===下午班===
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        上班3：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sb3" runat="server" CssClass="mytext" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        下班4：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xb4" runat="server" CssClass="mytext" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>迟到次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cdcs2" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>早退次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ztcs2" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>无签到次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wqdcs2" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>无签退次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wqtcs2" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>旷工次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kgcs2" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" align="center">
                                        ===晚上班===
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        上班5：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="sb5" runat="server" CssClass="mytext" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="height: 25; width: 20%">
                                        下班6：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="xb6" runat="server" CssClass="mytext" Width="90%" MaxLength="5"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>迟到次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="cdcs3" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>早退次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ztcs3" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>无签到次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wqdcs3" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        <font color="red">*</font>无签退次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wqtcs3" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>旷工次数：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kgcs3" runat="server" CssClass="mytext" Width="90%">0</asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr style="height: 25px">
                                    <td class="form-item">
                                        <font color="red">*</font>变更原因：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="bgyy" runat="server" Width="96%" TextMode="MultiLine" Rows="2" CssClass="mytextarea" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="确认变更" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" ControlToValidate="sb1"
        Display="none" ErrorMessage="上班1格式错误，参考格式如08:15" ValidationExpression="^.{5}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="xb2"
        Display="none" ErrorMessage="下班2格式错误，参考格式如11:55" ValidationExpression="^.{5}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="sb3"
        Display="none" ErrorMessage="上班3格式错误，参考格式如14:35" ValidationExpression="^.{5}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="xb4"
        Display="none" ErrorMessage="下班4格式错误，参考格式如17:25" ValidationExpression="^.{5}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="sb5"
        Display="none" ErrorMessage="上班5格式错误，参考格式如20:17" ValidationExpression="^.{5}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" ControlToValidate="xb6"
        Display="none" ErrorMessage="下班6格式错误，参考格式如22:32" ValidationExpression="^.{5}$"
        runat="server">
    </asp:RegularExpressionValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cdcs1"
        ErrorMessage="请输入迟到次数(上午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ztcs1"
        ErrorMessage="请输入早退次数(上午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="wqdcs1"
        ErrorMessage="请输入未签到次数(上午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="wqtcs1"
        ErrorMessage="请输入未签退次数(上午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="kgcs1"
        ErrorMessage="请输入旷工次数(上午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="迟到次数(上午班)必须是0至3之间的数字！"
        ControlToValidate="cdcs1" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="早退次数(上午班)必须是0至3之间的数字！"
        ControlToValidate="ztcs1" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator3" runat="server" ErrorMessage="未签到次数(上午班)必须是0至3之间的数字！"
        ControlToValidate="wqdcs1" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator4" runat="server" ErrorMessage="未签退次数(上午班)必须是0至3之间的数字！"
        ControlToValidate="wqtcs1" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator5" runat="server" ErrorMessage="旷工次数(上午班)必须是0或1！"
        ControlToValidate="kgcs1" MinimumValue="0" MaximumValue="1" Type="integer"> 
    </asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cdcs2"
        ErrorMessage="请输入迟到次数(下午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ztcs2"
        ErrorMessage="请输入早退次数(下午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="wqdcs2"
        ErrorMessage="请输入未签到次数(下午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="wqtcs2"
        ErrorMessage="请输入未签退次数(下午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="kgcs2"
        ErrorMessage="请输入旷工次数(下午班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator6" runat="server" ErrorMessage="迟到次数(下午班)必须是0至3之间的数字！"
        ControlToValidate="cdcs2" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator7" runat="server" ErrorMessage="早退次数(下午班)必须是0至3之间的数字！"
        ControlToValidate="ztcs2" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator8" runat="server" ErrorMessage="未签到次数(下午班)必须是0至3之间的数字！"
        ControlToValidate="wqdcs2" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator9" runat="server" ErrorMessage="未签退次数(下午班)必须是0至3之间的数字！"
        ControlToValidate="wqtcs2" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator10" runat="server" ErrorMessage="旷工次数(下午班)必须是0或1！"
        ControlToValidate="kgcs2" MinimumValue="0" MaximumValue="1" Type="integer"> 
    </asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="cdcs3"
        ErrorMessage="请输入迟到次数(晚上班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="ztcs3"
        ErrorMessage="请输入早退次数(晚上班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="wqdcs3"
        ErrorMessage="请输入未签到次数(晚上班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="wqtcs3"
        ErrorMessage="请输入未签退次数(晚上班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="kgcs3"
        ErrorMessage="请输入旷工次数(晚上班)，如无请输入0">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator11" runat="server" ErrorMessage="迟到次数(晚上班)必须是0至3之间的数字！"
        ControlToValidate="cdcs3" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator12" runat="server" ErrorMessage="早退次数(晚上班)必须是0至3之间的数字！"
        ControlToValidate="ztcs3" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator13" runat="server" ErrorMessage="未签到次数(晚上班)必须是0至3之间的数字！"
        ControlToValidate="wqdcs3" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator14" runat="server" ErrorMessage="未签退次数(晚上班)必须是0至3之间的数字！"
        ControlToValidate="wqtcs3" MinimumValue="0" MaximumValue="3" Type="integer"> 
    </asp:RangeValidator>
    <asp:RangeValidator ID="RangeValidator15" runat="server" ErrorMessage="旷工次数(晚上班)必须是0或1！"
        ControlToValidate="kgcs3" MinimumValue="0" MaximumValue="1" Type="integer"> 
    </asp:RangeValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="bgyy"
        ErrorMessage="请输入变更原因">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
