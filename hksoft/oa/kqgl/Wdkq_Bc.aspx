<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdkq_Bc.aspx.cs" Inherits="hkpro.oa.kqgl.Wdkq_Bc" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看我的班次</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                我的班次时间
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td>
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td height="25" width="20%" class="form-item">
                                        排班类型：
                                    </td>
                                    <td height="25" width="30%">
                                        <asp:Label ID="lblPbType" runat="server"></asp:Label>
                                    </td>
                                    <td height="25" width="20%" class="form-item">
                                        状态：
                                    </td>
                                    <td height="25" width="30%">
                                        <asp:Label ID="lblQyType" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="25" width="20%" class="form-item">
                                        上午上班：
                                    </td>
                                    <td height="25">
                                        <asp:Label ID="lblDjType_1" runat="server"></asp:Label>
                                    </td>
                                    <td height="25" width="20%" class="form-item">
                                        上午上班登记时间：
                                    </td>
                                    <td height="25">
                                        <asp:Label ID="lblDjTime_1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        上午下班：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjType_2" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        上午下班登记时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjTime_2" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        下午上班：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjType_3" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        下午上班登记时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjTime_3" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 25px" class="form-item">
                                        下午下班：
                                    </td>
                                    <td style="height: 25px">
                                        <asp:Label ID="lblDjType_4" runat="server"></asp:Label>
                                    </td>
                                    <td style="height: 25px" class="form-item">
                                        下午下班登记时间：
                                    </td>
                                    <td style="height: 25px">
                                        <asp:Label ID="lblDjTime_4" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        晚上上班：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjType_5" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        晚上上班登记时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjTime_5" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        晚上下班：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjType_6" runat="server"></asp:Label>
                                    </td>
                                    <td class="form-item">
                                        晚上下班登记时间：
                                    </td>
                                    <td>
                                        <asp:Label ID="lblDjTime_6" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25">
                            &nbsp;<font color="red">注:如果您的班次设置有误，请联系考勤管理员进行修改</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
