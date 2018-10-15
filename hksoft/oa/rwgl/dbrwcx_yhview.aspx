<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dbrwcx_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.dbrwcx_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>待办任务查询</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
     <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
        var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
       
        })
       
    </script>
    <style>
        .a {
        float:left;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2" style="height: 25" class="td_base">查看[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]待办任务
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                       <tr>
                                        <td class="form-item">
                                            任务来源：
                                        </td>
                                        <td colspan="3">
                                          
                                              <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label>   </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">任务标题：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblrwbt" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">接收人：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lbljsdx" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td class="form-item">牵头领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="qtld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">责任领导：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrld" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">责任人：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="zrr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item" style="width: 20%">任务等级：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:Label ID="lblrwxz" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item" style="width: 20%">紧急程度：
                                        </td>
                                        <td style="width: 30%">
                                            <asp:Label ID="lbljjcd" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">限时待办：
                                        </td>
                                        <td>
                                            <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                        </td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <asp:Panel ID="Panelrq" runat="server" Visible="false">
                                        <tr>
                                            <td class="form-item">开始日期：
                                            </td>
                                            <td>
                                                <asp:Label ID="lblksrq" runat="server"></asp:Label>
                                            </td>
                                            <td class="form-item">截止日期：
                                            </td>
                                            <td>
                                                <asp:Label ID="lbljzrq" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td class="form-item">任务内容：
                                        </td>
                                        <td colspan="3">
                                            <asp:Label ID="lblnr" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">发布时间：
                                        </td>
                                        <td>
                                            <asp:Label ID="fqsj" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">任务附件：
                                        </td>
                                        <td>
                                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" id="ff" target="_blank">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                            <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="附件下载" />
                                            <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel2" runat="server" Width="100%" HorizontalAlign="center">
            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                DataKeyNames="jsid" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                <Columns>
                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="20px" />
                    </asp:TemplateField>
                    <asp:ImageField DataImageUrlField="cszt" DataImageUrlFormatString="../../images/{0}.gif"
                        HeaderText="超时">
                        <ItemStyle HorizontalAlign="center" />
                        <HeaderStyle Width="20px" />
                    </asp:ImageField>
                    <asp:TemplateField HeaderText="附件">
                        <HeaderStyle Width="20px" />
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                                   <a class="a" href="<%=qy_fjylurl.Text %><%# Eval("fjlj") %><%# Eval("fjmc") %>" style='<%# isshowfj(Eval("fjlj").ToString()+Eval("fjlj").ToString()) %>' target="_blank" id="f">预览</a>
                                  
                            <a class="a" href="../../<%# Eval("fjlj") %><%# Eval("fjmc") %>" target="_blank">
                                <asp:Image ID="Image221" runat="server" ImageUrl='<%# Eval("fjmc2", "../../images/{0}.gif") %>' BorderWidth="0" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ui_desc" HeaderText="办理人"></asp:BoundField>
                    <asp:BoundField DataField="jszt" HeaderText="状态">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="clsj" HeaderText="送审时间" DataFormatString="{0:yy-MM-dd}"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="center" />
                    </asp:BoundField>
                   <%-- <asp:BoundField DataField="fpxs" HeaderText="分配形式">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fpsm" HeaderText="分配说明"></asp:BoundField>--%>
                    <asp:TemplateField HeaderText="完成说明">
                        <ItemTemplate>
                            <asp:Label ID="Labelwcsm" runat="server" Text='<%# Bind("bzsm") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核人">
                        <ItemTemplate>
                            <asp:Label ID="Labelshr" runat="server" Text='<%# Bind("spr") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="spsj" HeaderText="审核时间" DataFormatString="{0:yy-MM-dd}"
                        HtmlEncode="False">
                        <ItemStyle HorizontalAlign="center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="审核意见" SortExpression="spyj">
                        <ItemTemplate>
                            <asp:Label ID="Labelspyj" runat="server" Text='<%# Bind("spyj") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="评价" SortExpression="sppj">
                        <ItemTemplate>
                            <asp:Label ID="Labelpj" runat="server" Text='<%# Bind("sppj") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="退回">
                        <ItemTemplate>
                            <asp:Label ID="Labelthcs" runat="server" Text='<%# Bind("thcs") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle Width="30px" />
                        <ItemStyle HorizontalAlign="center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="hkRowStyle" />
                <HeaderStyle CssClass="hkHeadStyle" />
                <AlternatingRowStyle CssClass="hkAltRowStyle" />
                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
            </asp:GridView>
        </asp:Panel>
        <table cellspacing="0" cellpadding="0" border="0" width="100%" id="hkshow1">
            <tr>
                <td colspan="2" align="center" style="height: 30">
                    <input type="button" name="print" class="btn btn-primary" value="打 印" onclick="javascript: PrintPage1()">
                    <input type="button" name="BackBtn" value="关 闭" class="btn btn-danger" onclick="javascript: window.close()" />
                </td>
            </tr>
        </table>
        <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
