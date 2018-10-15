<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hycx_View.aspx.cs" Inherits="hkpro.oa.hygl.Hycx_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>会议查询</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                查看会议信息
            </td>
            <td class="td_base" style="width: 20%">
            </td>
        </tr>
        <tr>
            <td colspan="2" valign="top">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        会议主题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox CssClass="mytext" ID="hyzt" runat="server" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        会议类型：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="hylx" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        召开地点：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zkdd" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        召开部门：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="zkbm" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        主持人：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fzr" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        会议开始时间：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="kssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        结束时间：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="jssj" runat="server" CssClass="mytext" Width="90%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        出席范围：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cxfw" runat="server" CssClass="mytext" Width="96%" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        参加人员：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="cjry" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="2" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        简要说明：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="jysm" runat="server" CssClass="mytextarea" Width="96%" TextMode="multiLine"
                                            Rows="4" ReadOnly="true"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:HyperLink ID="savefj" runat="server"></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        实际情况：<br />
                                        (如实际出席人员等<br />
                                        与上述有出入的地方)
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="sjqk" runat="server" TextMode="multiLine" Rows="3" Width="96%" CssClass="mytextarea"
                                            ReadOnly="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        会议纪要：<br />
                                        (即会议过程的任务<br />
                                        分配、问题方法等)<br />
                                        Shift+回车换行
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="hyjy" runat="server" TextMode="multiLine" Rows="7" Width="96%" CssClass="mytextarea"
                                            ReadOnly="true" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
