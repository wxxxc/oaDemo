<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzzd_Mod.aspx.cs" Inherits="hkpro.portal.xzgl.Gzzd_Mod"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>规章制度</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
     <script src="../../res/js/jquery.js"></script>
     <script type="text/javascript">
        
        $(document).ready(function () {
           
        var a = "<%=savefj.NavigateUrl %>";
            if (a == "../.." || a == "") {
            $('#ff').css("display","none");
        }
        })
       
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" style="width: 80%; height: 25px">
                查看规章制度
            </td>
            <td class="td_base" style="width: 20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                    <tr>
                        <td colspan="2">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>分类：
                                    </td>
                                    <td colspan="3">
                                        <asp:DropDownList ID="zdfl" runat="server" Width="76%">
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="lx" runat="server" Visible="false">
                                            <asp:ListItem Text="企业规章" Value="企业" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="供应商规章" Value="供应商"></asp:ListItem>
                                            <asp:ListItem Text="会员规章" Value="会员"></asp:ListItem>
                                            <asp:ListItem Text="物业业主规章" Value="物业业主"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        <font color="red">*</font>标题：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="zdbt" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        主题词：
                                    </td>
                                    <td colspan="3">
                                        <asp:TextBox ID="ztc" runat="server" CssClass="mytext" Width="96%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item" style="width: 20%">
                                        制度等级：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="zddj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item" style="width: 20%">
                                        密级：
                                    </td>
                                    <td style="width: 30%">
                                        <asp:TextBox ID="mj" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        发文单位：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="fwdw" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="form-item">
                                        文号：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="wh" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                            height: 140px;"></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                        附件：
                                    </td>
                                    <td colspan="3">
                                        <input id="fj" runat="server" type="file" style="width: 550px;" class="mytext" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="form-item">
                                    </td>
                                    <td colspan="3">
                                        <asp:Label ID="fbr_label" runat="server" Enabled="false" Text="创建时间："></asp:Label>
                                        <asp:Label ID="cjsj" runat="server" Enabled="false"></asp:Label>
                                        
                            <a href="<%=qy_fjylurl.Text %><%=savefj.NavigateUrl %>" target="_blank" id="ff">在线预览</a>
                             <asp:Label ID="qy_fjylurl" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="savelj" Visible="false" runat="server"></asp:Label>&nbsp;

                                        <asp:HyperLink ID="savefj" Enabled="true" Target="_blank" runat="server" CssClass="blue"
                                            ToolTip="附件下载" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="height: 30">
                            <asp:Button CssClass="mybtn" ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click">
                            </asp:Button>
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="zdbt"
        ErrorMessage="请输入标题">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="zdfl"
        ErrorMessage="请选择分类">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
