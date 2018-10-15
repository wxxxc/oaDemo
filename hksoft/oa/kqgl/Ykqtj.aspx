<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ykqtj.aspx.cs" Inherits="hkpro.oa.kqgl.Ykqtj" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <title>月考勤统计</title>
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
                            统计月份：
                        </td>
                        <td>
                            <asp:TextBox ID="kqrq" onclick="SelectDate(this,'yyyy-MM')" runat="server" CssClass="mytext"
                                Width="150"></asp:TextBox>
                        </td>
                        <td align="right">
                            选择部门：
                        </td>
                        <td>
                            <asp:DropDownList ID="bm" runat="server" CssClass="mytext" Width="150" AutoPostBack="true"
                                OnSelectedIndexChanged="bm_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td align="right">
                            选择人员：
                        </td>
                        <td>
                            <asp:DropDownList ID="ry" runat="server" CssClass="mytext" Width="150">
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
                                <LocalReport ReportPath="oa\kqgl\Ykqtj_r.rdlc">
                                    <DataSources>
                                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="Ykqtj_ds_DataTable1" />
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kqrq"
        ErrorMessage="请选择统计月份">&nbsp;
    </asp:RequiredFieldValidator>
    </form>
</body>
</html>
