<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wdjh_Add.aspx.cs" Inherits="hkpro.oa.jhgl.Wdjh_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的计划</title>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="height: 25px">
                    <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"
                        CausesValidation="true"></asp:Button>
                    <asp:Button CssClass="mybtn" ID="SendBtn" runat="server" Text="送审" OnClick="Send_Click"
                        CausesValidation="true" Visible="false"></asp:Button>
                    <asp:Button ID="AddBtn" Text="新增工作项" CssClass="mybtn" runat="server" Visible="false"
                        CausesValidation="false" />
                    <asp:Button CssClass="mybtn" ID="DelBtn" runat="server" Text="删除工作项" OnClick="Del_Click"
                        Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" />
                    <input type="button" name="BackBtn" value="关闭" class="mybtn" onclick="javascript: window.close()" />&nbsp;
                </td>
                <td class="td_base"></td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="form">
                        <tr>
                            <td class="form-item" style="width: 20%">
                                <font color="red">*</font>选择年份：
                            </td>
                            <td style="width: 30%">
                                <asp:TextBox ID="jhnf" runat="server" Width="90%" CssClass="mytext" onclick="SelectDate(this,'yyyy')"
                                    MaxLength="4"></asp:TextBox>
                            </td>
                            <td class="form-item" style="width: 20%">
                                <font color="red">*</font>计划类型：
                            </td>
                            <td style="width: 30%">
                                <asp:DropDownList ID="jhlx" runat="server" Width="90%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                <font color="red">*</font>总体目标：
                            </td>
                            <td colspan="3">
                                <asp:TextBox ID="ztmb" runat="server" CssClass="mytextarea" Width="96%" Rows="2"
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item"></td>
                            <td>
                                <asp:RadioButtonList ID="rblcq" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblcq_SelectedIndexChanged"
                                    AutoPostBack="true" RepeatLayout="Flow">
                                    <asp:ListItem Text="按半年" Value="按半年"></asp:ListItem>
                                    <asp:ListItem Text="按季度" Value="按季度"></asp:ListItem>
                                    <asp:ListItem Text="按月份" Value="按月份" Selected="True"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="form-item">
                                <font color="red">*</font>选择周期：
                            </td>
                            <td>
                                <asp:DropDownList ID="yf" runat="server" Width="90%">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                    <asp:ListItem Text="01月" Value="01月"></asp:ListItem>
                                    <asp:ListItem Text="02月" Value="02月"></asp:ListItem>
                                    <asp:ListItem Text="03月" Value="03月"></asp:ListItem>
                                    <asp:ListItem Text="04月" Value="04月"></asp:ListItem>
                                    <asp:ListItem Text="05月" Value="05月"></asp:ListItem>
                                    <asp:ListItem Text="06月" Value="06月"></asp:ListItem>
                                    <asp:ListItem Text="07月" Value="07月"></asp:ListItem>
                                    <asp:ListItem Text="08月" Value="08月"></asp:ListItem>
                                    <asp:ListItem Text="09月" Value="09月"></asp:ListItem>
                                    <asp:ListItem Text="10月" Value="10月"></asp:ListItem>
                                    <asp:ListItem Text="11月" Value="11月"></asp:ListItem>
                                    <asp:ListItem Text="12月" Value="12月"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <asp:Panel Visible="false" runat="server" ID="songshen">
                            <tr>
                                <td class="form-item"></td>
                                <td colspan="3">
                                    <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知审批人" Checked="true" />
                                    <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知审批人" />
                                </td>
                            </tr>
                            <tr>
                                <td class="form-item">
                                    <font color="red">*</font>选择审批人：
                                </td>
                                <td colspan="3">
                                    <asp:TextBox ID="UserName" runat="server" Rows="2" TextMode="MultiLine" Width="90%"
                                        CssClass="mytextarea"></asp:TextBox>
                                    <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                                </td>
                            </tr>
                        </asp:Panel>
                    </table>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <asp:GridView ID="GridView1" runat="server" OnRowDataBound="OnRow_Bound" AutoGenerateColumns="False"
                            DataKeyNames="id" EmptyDataText="暂时没有详细计划" Width="100%" CssClass="hkgv">
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
                                <asp:TemplateField HeaderText="工作主题">
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popView('gzx_mod.aspx?type=a&id=<%# Eval("id") %>&jhid=<%# Eval("jhid") %>')"
                                            class="gvlink">
                                            <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("gzzt") %>'></asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="jhkssj" HeaderText="计划开始时间" DataFormatString="{0:yyyy-MM-dd}"
                                    HtmlEncode="False">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="jhwcsj" HeaderText="计划完成时间" DataFormatString="{0:yyyy-MM-dd}"
                                    HtmlEncode="False">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="hkRowStyle" />
                            <HeaderStyle CssClass="hkHeadStyle" />
                            <AlternatingRowStyle CssClass="hkAltRowStyle" />
                            <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                        </asp:GridView>
                    </table>
                </td>
            </tr>
        </table>
        <!--隐藏label-->
        <asp:Label ID="IDlabel" runat="server" Visible="false" />
        <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ztmb"
            ErrorMessage="请输入总体目标">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="jhnf"
            ErrorMessage="请选择年份">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="yf"
            ErrorMessage="请选择月份">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserName"
            ErrorMessage="请选择审批人">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="jhlx"
            ErrorMessage="请选择计划类型">&nbsp;
        </asp:RequiredFieldValidator>
        <script language="javascript">
            var uIdName;
            function chooseuser_m() {
                var num = Math.random();
                var str = "" + document.getElementById('UserID').value + "";

                //browser
                var bstr = getBrowserType();
                if (bstr == '3' | bstr == '4' | bstr == '5') {
                    window.open("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", 'newwindow', 'height=520,width=650,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
                }
                else {
                    uIdName = window.showModalDialog("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", "newwindow", "dialogWidth:650px;DialogHeight=520px;status:no;scroll=no;help:no");
                }

                var arr = uIdName.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }

            function setValue(str) {
                var arr = str.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }
        </script>
    </form>
</body>
</html>
