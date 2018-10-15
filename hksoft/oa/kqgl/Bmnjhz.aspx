<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bmnjhz.aspx.cs" Inherits="hkpro.oa.kqgl.Bmnjhz" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>部门年休假汇总</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table id="hkshow2" cellspacing="0" cellpadding="2" width="800" border="0">
                    <tr>
                        <td align="right">
                            选择年份：
                        </td>
                        <td>
                            <asp:TextBox ID="nf" onclick="SelectDate(this,'yyyy')" runat="server" CssClass="mytext"
                                Width="150"></asp:TextBox>
                        </td>
                        <td align="right">
                            选择季度：
                        </td>
                        <td>
                            <asp:DropDownList ID="jd" runat="server" CssClass="mytext" Width="150">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                <asp:ListItem Text="一季度" Value="1"></asp:ListItem>
                                <asp:ListItem Text="二季度" Value="2"></asp:ListItem>
                                <asp:ListItem Text="三季度" Value="3"></asp:ListItem>
                                <asp:ListItem Text="四季度" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            选择部门：
                        </td>
                        <td>
                            <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="150">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            &nbsp;
                        </td>
                        <td colspan="5">
                            <asp:Button CssClass="mybtn" ID="QueryBtn" runat="server" Text="查询" 
                                OnClick="Ref_Click"></asp:Button>
                            <asp:Button CssClass="mybtn" ID="ClearBtn" runat="server" Text="清空" 
                                CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                Height="375px" Width="100%" ShowRefreshButton="false" ShowPageNavigationControls="true"
                                ShowZoomControl="false" ShowFindControls="false" ShowPrintButton="false" ShowBackButton="false" PageCountMode="Actual">
                                <LocalReport ReportPath="oa\kqgl\Bmnjhz_r.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Bmnjhz_ds_DataTable1" />
                                    </DataSources>
                                </LocalReport>
                            </rsweb:ReportViewer>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="nf"
        ErrorMessage="请选择年份">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="jd"
        ErrorMessage="请选择季度">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
