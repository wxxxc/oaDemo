<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Node.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Node" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
function useseal()  
{
    window.open ("WorkFlow_Seal.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>", "_blank", "height=460, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
}
</script>
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
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作流管理 - 流程节点设计</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td height="25" class="td_base">
                视图切换：
                <input id="imgview" type="button" value="图形视图" onclick="parent.main_inteface.location='WorkFlow_Node_Show.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>'"
                    class="mybtn" />
                <input id="listview" type="button" value="列表视图" onclick="parent.main_inteface.location='WorkFlow_Node_List.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>'"
                    class="mybtn" />
            </td>
            <td class="td_base" align="right">
                <input id="SealBtn" type="button" value="电子印章" onclick="useseal();" class="btn btn-primary"
                    style="width: 70" />
                <input id="ReloadBtn" type="button" value="刷新" onclick="parent.main_inteface.location.reload();"
                    class="btn btn-info" style="width: 70" />
                <input id="PrnBtn" type="button" value="打印" onclick="parent.main_inteface.document.execCommand('Print');"
                    class="btn btn-success" title="打印工作流程图" style="width: 70" />
                <input id="CopyBtn" type="button" value="复制" onclick="copyflow();" class="btn btn-primary"
                    style="width: 70" />
                <input id="CloseBtn" type="button" value="关闭" onclick="parent.close();" class="btn btn-danger"
                    style="width: 70" />&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <iframe border="0" name="main_inteface" marginwidth="1" marginheight="1" src="WorkFlow_Node_Show.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"] %>"
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
