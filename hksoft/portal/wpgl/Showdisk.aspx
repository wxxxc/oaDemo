<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showdisk.aspx.cs" Inherits="hkpro.portal.wpgl.Showdisk" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的网盘</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td align="center">
                    <table cellspacing="0" cellpadding="0" width="98%" border="0">
                        <tr>
                            <td style="height: 40px">选择文件夹：<asp:DropDownList ID="DirList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DirList_SelectedIndexChanged"
                                Width="200px">
                            </asp:DropDownList>
                            </td>
                            <td align="right">
                                <input type="button" class="mybtn" name="BackBtn" value="管理文件夹" onclick="javascript: location.href = 'folder.aspx'" />
                                <asp:Button ID="UpBtn" runat="server" CssClass="mybtn" Enabled="false" Text="上 传"
                                    OnClick="Upload_Click" ToolTip="选中某个文件后才能上传" />
                                <input type="button" class="mybtn" name="BackBtn" value="搜 索" onclick="javascript: location.href = 'SearchFile.aspx'" />
                                <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                                    OnClientClick="return confirm('确认要删除文件吗？')"></asp:Button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                    DataKeyNames="UrlID" EmptyDataText="该文件夹下还没有上传文件！" Width="100%" CssClass="hkgv">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px"></HeaderStyle>
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文件名称">
                                            <ItemTemplate>
                                                <a href="ViewDisk.aspx?DirID=<%# Eval("DirID") %>" class="gvlink">
                                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("FileName") %>'></asp:Label></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文件类型">
                                            <ItemTemplate>
                                                <asp:Label ID="Labellx" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文件大小">
                                            <HeaderStyle Wrap="false" />
                                            <ItemStyle HorizontalAlign="Right" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labeldx" runat="server" Text='<%# Bind("contain2") %>'></asp:Label>KB
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="文件夹">
                                            <ItemStyle Wrap="false" />
                                            <ItemTemplate>
                                                <asp:Label ID="Labelwjj" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="createdate" HeaderText="上传时间">
                                            <HeaderStyle Width="140px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="编辑">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="#" onclick="javascript:popMod('EditFile.aspx?UrlID=<%# Eval("UrlID") %>')"
                                                    class="gvlink">
                                                    <asp:Image ID="Image121" runat="server" ImageUrl='../../images/edit_s.gif' ToolTip="修改此文件名" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="下载">
                                            <HeaderStyle Width="40px" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <a href="../../Attach/portal/wd/<%# Eval("newname") %>" target="_blank" class="gvlink">
                                                    <asp:Image ID="Image111" runat="server" ImageUrl='../../images/down_s.gif' ToolTip=".txt|.pdf文档及图片请您右击另存为" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle CssClass="hkRowStyle" />
                                    <HeaderStyle CssClass="hkHeadStyle" />
                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 22px">
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                                    ShowCustomInfoSection="left" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                    NumericButtonCount="10" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                                    PrevPageText="上页" CustomInfoSectionWidth="250px" CssClass="page_text" ShowBoxThreshold="11"
                                    InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go">
                                </webdiyer:AspNetPager>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 22px">移至文件夹：<asp:DropDownList ID="DirList2" runat="server" Width="200px">
                            </asp:DropDownList>
                                <asp:Button CssClass="mybtn" ID="Button1" runat="server" Text="确定移动" OnClick="Move_Click"
                                    OnClientClick="return confirm('确认要移动这些文件吗？')"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
