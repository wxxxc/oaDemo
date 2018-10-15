<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Flow_Show.aspx.cs" Inherits="hkpro.workflow.work.Flow_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="JavaScript">
    function copyflow() {
        parent.main_inteface.document.execCommand('selectall');
        parent.main_inteface.document.execCommand('copy');
        alert("流程图已复制到剪贴板！");
    }
</script>
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>查看流程</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td height="25" class="td_base">
                视图切换：
                <input id="imgview" type="button" value="图形视图" onclick="parent.main_inteface.location='Flow_Show_Visual.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>'"
                    class="mybtn" />
                <input id="listview" type="button" value="列表视图" onclick="parent.main_inteface.location='Flow_Show_List.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>'"
                    class="mybtn" />
            </td>
            <td class="td_base" align="right">
                <input id="ReloadBtn" type="button" value="刷新" onclick="parent.main_inteface.location.reload();"
                    class="mybtn" style="width: 70" />
                <input id="PrnBtn" type="button" value="打印" onclick="parent.main_inteface.document.execCommand('Print');"
                    title="打印工作流程图" class="mybtn" style="width: 70" />
                <input id="CopyBtn" type="button" value="复制" onclick="copyflow();" class="mybtn"
                    style="width: 70" />
                <input id="CloseBtn" type="button" value="关闭" onclick="parent.close();" class="mybtn"
                    style="width: 70" />&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iframe border="0" name="main_inteface" marginwidth="1" marginheight="1" src="Flow_Show_Visual.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>"
                    frameborder="0" width="100%" height="585" bordercolor="#EDEDED"></iframe>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="25">
                <font color="red">提示：需要进行一些浏览器配置才能正常显示流程图形化界面！</font><a href="../../Down/portal/BrowserSet.doc"
                    target="_blank" class="blue">查看帮助</a>
                <input id="CloseWinBtn" class="mybtn" onclick="javascript:window.close()" type="button"
                    value="关闭窗口" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="lblfid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfname" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblfno" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblno" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
