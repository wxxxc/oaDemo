<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="shdbrw_yhview.aspx.cs"
    Inherits="hkpro.oa.rwgl.shdbrw_yhview" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>审核待办任务</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/Choose.js"></script>
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
                <td style="height: 25px;" class="td_base">查看[<asp:Label ID="rwdh" runat="server" ForeColor="yellow"></asp:Label>]待办任务
                </td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td colspan="2">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                       <tr>
                                        <td class="form-item">
                                            任务来源：
                                        </td>
                                        <td colspan="3">
                                          
                                              <asp:Label ID="rwly" runat="server" style="color:red; font-weight:bold"></asp:Label>
                                        </td>
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
                                        <td class="form-item">限时待办：
                                        </td>
                                        <td>
                                            <asp:Label ID="lblynxs" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">任务附件：
                                        </td>
                                        <td>
                                            
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                            <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="gvlink"
                                                ToolTip="附件下载" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">发布人：
                                        </td>
                                        <td>
                                            <asp:Label ID="fbrmc" runat="server"></asp:Label>
                                        </td>
                                        <td class="form-item">发布时间：
                                        </td>
                                        <td>
                                            <asp:Label ID="fqsj" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" align="center">
                                            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Height="100%" Width="100%">
                                                <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="jsid" EmptyDataText="没有查到符合条件的数据！" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="20px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="20px"></HeaderStyle>
                                                            <ItemStyle Width="20px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="办理人"></asp:BoundField>
                                                        <asp:BoundField DataField="jszt" HeaderText="办理状态">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="clsj" HeaderText="送审时间" DataFormatString="{0:yyyy-MM-dd HH:mm}"
                                                            HtmlEncode="False" ReadOnly="True">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <%--<asp:BoundField DataField="fpxs" HeaderText="分配形式">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fpsm" HeaderText="分配说明"></asp:BoundField>--%>
                                                        <asp:TemplateField HeaderText="完成说明">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("bzsm") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="附件">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                  <a class="a" href="<%=qy_fjylurl.Text %><%# Eval("fjlj") %><%# Eval("fjmc") %>" style='<%# isshowfj(Eval("fjlj").ToString()+Eval("fjlj").ToString()) %>' target="_blank" id="f">预览</a>
                                  
                                                      
                                                                <a class="a" href="../../<%# Eval("fjlj") %><%# Eval("fjmc") %>" target="_blank">
                                                                    <asp:Image ID="Image221" runat="server" ImageUrl='<%# Eval("fjmc2", "../../images/{0}.gif") %>' BorderWidth="0" /></a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                      
                                                  <asp:GridView ID="GridView2" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall1" type="checkbox" onclick="chkAll1();" title="全选或全不选" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del1" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="牵头领导"></asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                                  <asp:GridView ID="GridView3" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView3.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall2" type="checkbox" onclick="chkAll2();" title="全选或全不选" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del2" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="责任领导"></asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                                  <asp:GridView ID="GridView4" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                                                    DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="98%" CssClass="hkgv">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="../../images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="40px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall3" type="checkbox" onclick="chkAll3();" title="全选或全不选" style="width: 16; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del3" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ui_desc" HeaderText="责任人"></asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="hkRowStyle" />
                                                    <HeaderStyle CssClass="hkHeadStyle" />
                                                    <AlternatingRowStyle CssClass="hkAltRowStyle" />
                                                    <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                                </asp:GridView>
                                     
                                                      </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item">审批意见：
                                        </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="spyj" runat="server" Width="78%" CssClass="mytext"></asp:TextBox>
                                            审批评价：<asp:DropDownList ID="sppj" runat="server" Width="8%">
                                                <asp:ListItem Text="优" Value="优" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="良" Value="良"></asp:ListItem>
                                                <asp:ListItem Text="中" Value="中" ></asp:ListItem>
                                                <asp:ListItem Text="差" Value="差"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                     <tr>
                                         <td class="form-item">问责原因：
                                        </td>
                                        <td colspan="2">
                                            <asp:TextBox ID="reason" runat="server" Width="380px"></asp:TextBox>
                                        </td>
                                           <td>
                                           <a href="#" onclick="javascript:popWin_s('ztdbrw_yh_wzview.aspx?rwid=<%=rwidstr.Text %>')"
                                             class="gvlink">
                                           <asp:Label ID="rwid" runat="server" hidden="true"></asp:Label>问责记录</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="form-item"></td>
                                        <td colspan="3">
                                            <asp:CheckBox ID="xxtz" runat="server" Checked="true" Text="站内消息通知办理人" />
                                            <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知办理人"  />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height: 30">
                                <asp:Button CssClass="btn btn-success" ID="YesBtn" runat="server" Text="审核通过" OnClick="Yes_Click"
                                    OnClientClick="return confirm('系统不会更新[未接收]状态的任务，确认要审核通过吗？')" />
                                <asp:Button CssClass="btn btn-primary" ID="NoBtn" runat="server" Text="审核退回" OnClick="No_Click"
                                    OnClientClick="return confirm('系统不会更新[未接收]状态的任务，确认要审核退回吗？')" />
                                <asp:Button CssClass="btn btn-warning " ID="Button1" runat="server" Text="问责" OnClick="Send_Click1" 
                                    OnClientClick="return confirm('问责之后不能撤回，确认要问责吗？')"
                                    />
                          
                                <asp:Button CssClass="btn btn-info" ID="OkBtn" runat="server" Text="任务完成" OnClick="Ok_Click"
                                    OnClientClick="return confirm('标记为完成的任务将不能再审核，确认该任务已完成了吗？')" />
                                <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="rwidstr" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>

<script>
    function chkAll1() {
        var chkall = document.all["chkall1"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView2') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll2() {
        var chkall = document.all["chkall2"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView3') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    function chkAll3() {
        var chkall = document.all["chkall3"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView4') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
</script>