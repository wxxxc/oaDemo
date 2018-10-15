<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qyda.aspx.cs" Inherits="hkpro.portal.bmgl.Qyda" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>单位信息</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top" colspan="2">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td align="right" style="height: 30">
                                <input type="button" id="AddBtn" name="AddBtn" value="添加子单位" class="btn btn-primary" onclick="javascript: popAdd('qyda_view.aspx');"
                                    runat="server" visible="false" />
                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click"></asp:Button>&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                    <tr>
                                        <td width="20%" class="form-item">
                                            <font color="red">*</font>单位编码：
                                        </td>
                                        <td width="30%">
                                            <asp:TextBox CssClass="mytext" ID="qybm" runat="server" Width="90%" Enabled="false"
                                                MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td width="20%" class="form-item">
                                            <font color="red">*</font>单位缩写：
                                        </td>
                                        <td width="30%">
                                            <asp:TextBox CssClass="mytext" ID="pp" runat="server" Width="90%" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>单位全称：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="qc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">
                                            <font color="red">*</font>单位简称：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="jc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">英文名称：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ywmc" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">单位类型：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="lx" runat="server" CssClass="mytext" Width="90%" />
                                        </td>
                                        <td class="form-item">所属地区：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="sshy" runat="server" CssClass="mytext" Width="90%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">单位地址：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="dz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">邮政编码：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="yzbm" runat="server" CssClass="mytext" Width="90%" MaxLength="6"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">单位电话：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="dh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">传真号码：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="cz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">单位网站：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="wz" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">电子邮箱：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="mail" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
<%--                                    <tr>
                                        <td class="form-item">法人代表：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="frdb" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">注册时间：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="zcsj" runat="server" CssClass="mytext" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                       <%-- <td class="form-item">注册资金：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="zczj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>--%>
                                        <td class="form-item">员工人数：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="ygrs" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                         <td class="form-item">附件在线预览地址：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="qy_fjylurl" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
<%--                                    <tr>
                                        <td class="form-item">国税号：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="gsh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">地税号：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="dsh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">开户银行：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="khyh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                        <td class="form-item">银行帐号：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="yhzh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td class="form-item">单位简介：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="qyjj" runat="server" CssClass="mytext" Width="96%" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                             <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False" DataKeyNames="qy_id"
                                    EmptyDataText="暂无任何下属单位记录！" Width="100%" CssClass="hkgv" AllowPaging="false" Visible="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qy_id" HeaderText="下属单位编码">
                                            <HeaderStyle Width="100px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="下属单位名称">
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('qyda_view.aspx?id=<%# Eval("qy_id") %>')"
                                                    class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("qy_qc") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="qy_dh" HeaderText="电话"></asp:BoundField>
                                        <asp:BoundField DataField="qy_cz" HeaderText="传真"></asp:BoundField>
                                        <asp:BoundField DataField="qy_dz" HeaderText="地址"></asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <RowStyle CssClass="hkRowStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pp"
            ErrorMessage="请输入单位品牌">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="qc"
            ErrorMessage="请输入单位全称">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jc"
            ErrorMessage="请输入单位简称">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="qybm"
            Display="none" ErrorMessage="单位编码必需为数字、字母或二者组合" ValidationExpression="^\w+$"
            runat="server">
        </asp:RegularExpressionValidator>
<%--        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" ControlToValidate="zczj"
            Display="none" ErrorMessage="注册资金必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}"
            runat="server">
        </asp:RegularExpressionValidator>--%>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="ygrs"
            Display="none" ErrorMessage="员工人数必须为大于0的整数" ValidationExpression="^[1-9]{1}[\d]*$"
            runat="server">
        </asp:RegularExpressionValidator>
    </form>
</body>
</html>
