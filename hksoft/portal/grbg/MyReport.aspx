<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyReport.aspx.cs" Inherits="hkpro.portal.grbg.MyReport" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的驾驶舱</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="JavaScript" src="../../CssJs/FlashCharts.js"></script>
</head>
<body class="main">
    <form id="Form1" method="post" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td style="height: 28" background="../../images/title_bg.gif">
                            &nbsp;&nbsp;提示：您必须安装了Adobe FlashPlayer才能正常浏览以下报表，<a href="http://get.adobe.com/cn/flashplayer"
                                target="_blank" class="blue">点击下载</a>
                        </td>
                        <td align="right" background="../../images/title_bg.gif">
                        </td>
                    </tr>
                </table>
                <table width="98%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td valign="top">
                            <!--年度访问次数最多的前10名模块-->
                            <asp:Panel ID="panel1" runat="server" ScrollBars="Auto" Visible="false">
                                <br />
                                <table width="700" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="5" height="24" background="../../images/head_bg_m.gif">
                                            <img src="../../images/head_bg_l.gif" />
                                        </td>
                                        <td height="24" colspan="2" background="../../images/head_bg_m.gif">
                                            <img src="../../images/arrow.gif" />&nbsp;<asp:HyperLink ID="hl1" runat="server"
                                                ToolTip="查看详细访问日志" Font-Underline="false">
                                                <asp:Label ID="title1" runat="server" Font-Bold="true" ForeColor="#36434E"></asp:Label></asp:HyperLink>
                                            <asp:DropDownList ID="ChangeChart1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeChart1_SelectedIndexChanged">
                                                <asp:ListItem Text="2D柱型图" Value="FCF_Column2D.swf" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="3D柱型图" Value="FCF_Column3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D条型图" Value="FCF_Bar2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D线型图" Value="FCF_Line.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D饼型图" Value="FCF_Pie2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D饼型图" Value="FCF_Pie3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D面积图" Value="FCF_Area2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D环型图" Value="FCF_Doughnut2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="漏斗图" Value="FCF_Funnel.swf"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td background="../../images/head_bg_m.gif" align="right">
                                            <img src="../../images/head_bg_r.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" valign="top" colspan="4" style="border-right: #A8C8E3 1px solid;
                                            border-top: #A8C8E3 1px solid; border-left: #A8C8E3 1px solid; border-bottom: #A8C8E3 1px solid;">
                                            <asp:Literal ID="FCLiteral1" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <!--资产分类库存前10名-->
                            <asp:Panel ID="panel2" runat="server" ScrollBars="Auto" Visible="false">
                                <br />
                                <table width="700" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="5" height="24" background="../../images/head_bg_m.gif">
                                            <img src="../../images/head_bg_l.gif" />
                                        </td>
                                        <td height="24" colspan="2" background="../../images/head_bg_m.gif">
                                            <img src="../../images/arrow.gif" />&nbsp;<asp:HyperLink ID="hl2" runat="server"
                                                ToolTip="查看详细资产库存信息" Font-Underline="false">
                                                <asp:Label ID="title2" runat="server" Font-Bold="true" ForeColor="#36434E"></asp:Label></asp:HyperLink>
                                            <asp:DropDownList ID="ChangeChart2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeChart2_SelectedIndexChanged">
                                                <asp:ListItem Text="2D柱型图" Value="FCF_Column2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D柱型图" Value="FCF_Column3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D条型图" Value="FCF_Bar2D.swf" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="2D线型图" Value="FCF_Line.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D饼型图" Value="FCF_Pie2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D饼型图" Value="FCF_Pie3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D面积图" Value="FCF_Area2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D环型图" Value="FCF_Doughnut2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="漏斗图" Value="FCF_Funnel.swf"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td background="../../images/head_bg_m.gif" align="right">
                                            <img src="../../images/head_bg_r.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" valign="top" colspan="4" style="border-right: #A8C8E3 1px solid;
                                            border-top: #A8C8E3 1px solid; border-left: #A8C8E3 1px solid; border-bottom: #A8C8E3 1px solid;">
                                            <asp:Literal ID="FCLiteral2" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <!--截止目前销售前10名供应商-->
                            <asp:Panel ID="panel3" runat="server" ScrollBars="Auto" Visible="false">
                                <br />
                                <table width="700" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="5" height="24" background="../../images/head_bg_m.gif">
                                            <img src="../../images/head_bg_l.gif" />
                                        </td>
                                        <td height="24" colspan="2" background="../../images/head_bg_m.gif">
                                            <img src="../../images/arrow.gif" />&nbsp;<asp:HyperLink ID="hl3" runat="server"
                                                ToolTip="查看详细销售信息" Font-Underline="false">
                                                <asp:Label ID="title3" runat="server" Font-Bold="true" ForeColor="#36434E"></asp:Label></asp:HyperLink>
                                            <asp:DropDownList ID="ChangeChart3" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeChart3_SelectedIndexChanged">
                                                <asp:ListItem Text="2D柱型图" Value="FCF_Column2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D柱型图" Value="FCF_Column3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D条型图" Value="FCF_Bar2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D线型图" Value="FCF_Line.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D饼型图" Value="FCF_Pie2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D饼型图" Value="FCF_Pie3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D面积图" Value="FCF_Area2D.swf" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="2D环型图" Value="FCF_Doughnut2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="漏斗图" Value="FCF_Funnel.swf"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td background="../../images/head_bg_m.gif" align="right">
                                            <img src="../../images/head_bg_r.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" valign="top" colspan="4" style="border-right: #A8C8E3 1px solid;
                                            border-top: #A8C8E3 1px solid; border-left: #A8C8E3 1px solid; border-bottom: #A8C8E3 1px solid;">
                                            <asp:Literal ID="FCLiteral3" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <!--Top10会员销售-->
                            <asp:Panel ID="panel4" runat="server" ScrollBars="Auto" Visible="false">
                                <br />
                                <table width="700" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="5" height="24" background="../../images/head_bg_m.gif">
                                            <img src="../../images/head_bg_l.gif" />
                                        </td>
                                        <td height="24" colspan="2" background="../../images/head_bg_m.gif">
                                            <img src="../../images/arrow.gif" />&nbsp;<asp:HyperLink ID="hl4" runat="server"
                                                ToolTip="查看详细销售信息" Font-Underline="false">
                                                <asp:Label ID="title4" runat="server" Font-Bold="true" ForeColor="#36434E"></asp:Label></asp:HyperLink>
                                            <asp:DropDownList ID="ChangeChart4" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeChart4_SelectedIndexChanged">
                                                <asp:ListItem Text="2D柱型图" Value="FCF_Column2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D柱型图" Value="FCF_Column3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D条型图" Value="FCF_Bar2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D线型图" Value="FCF_Line.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D饼型图" Value="FCF_Pie2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D饼型图" Value="FCF_Pie3D.swf" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="2D面积图" Value="FCF_Area2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D环型图" Value="FCF_Doughnut2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="漏斗图" Value="FCF_Funnel.swf"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td background="../../images/head_bg_m.gif" align="right">
                                            <img src="../../images/head_bg_r.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" valign="top" colspan="4" style="border-right: #A8C8E3 1px solid;
                                            border-top: #A8C8E3 1px solid; border-left: #A8C8E3 1px solid; border-bottom: #A8C8E3 1px solid;">
                                            <asp:Literal ID="FCLiteral4" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <!--全部欠缴的物业费-->
                            <asp:Panel ID="panel5" runat="server" ScrollBars="Auto" Visible="false">
                                <br />
                                <table width="700" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="5" height="24" background="../../images/head_bg_m.gif">
                                            <img src="../../images/head_bg_l.gif" />
                                        </td>
                                        <td height="24" colspan="2" background="../../images/head_bg_m.gif">
                                            <img src="../../images/arrow.gif" />&nbsp;<asp:HyperLink ID="hl5" runat="server"
                                                ToolTip="查看详细物业费信息" Font-Underline="false">
                                                <asp:Label ID="title5" runat="server" Font-Bold="true" ForeColor="#36434E"></asp:Label></asp:HyperLink>
                                            <asp:DropDownList ID="ChangeChart5" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeChart5_SelectedIndexChanged">
                                                <asp:ListItem Text="2D柱型图" Value="FCF_Column2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D柱型图" Value="FCF_Column3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D条型图" Value="FCF_Bar2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D线型图" Value="FCF_Line.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D饼型图" Value="FCF_Pie2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="3D饼型图" Value="FCF_Pie3D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D面积图" Value="FCF_Area2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="2D环型图" Value="FCF_Doughnut2D.swf"></asp:ListItem>
                                                <asp:ListItem Text="漏斗图" Value="FCF_Funnel.swf" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td background="../../images/head_bg_m.gif" align="right">
                                            <img src="../../images/head_bg_r.gif" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td bgcolor="#FFFFFF" valign="top" colspan="4" style="border-right: #A8C8E3 1px solid;
                                            border-top: #A8C8E3 1px solid; border-left: #A8C8E3 1px solid; border-bottom: #A8C8E3 1px solid;">
                                            <asp:Literal ID="FCLiteral5" runat="server"></asp:Literal>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lbl1" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbl2" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbl3" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbl4" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbl5" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblpms" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbleam" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
