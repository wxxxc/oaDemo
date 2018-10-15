<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Copy.aspx.cs"
    Inherits="hkpro.workflow.flow.WorkFlow_Copy" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function viewflow() {
        if (document.getElementById('dp_wfno').value == '请选择') {
            alert('请先选择流程再查看');
            return false;
        }
        else {
            var num = Math.random();
            var littleproduct = document.getElementById("dp_wfno");
            var cindex = littleproduct.selectedIndex;
            var cValue = littleproduct.options[cindex].value;
            window.open("WorkFlow_Node.aspx?tmp=" + num + "&FlowNumber=" + cValue + "", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
        }
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
    <title>复制工作流 - 工作流管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" style="width: 100%"
                    class="form">
                    <tr>
                        <td align="center">
                            选择工作流：<asp:DropDownList ID="dp_wfno" runat="server" Width="300px">
                            </asp:DropDownList>
                            ［<a href="#" onclick="viewflow()" class="gvlink">查看流程</a>］
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="30">
                <asp:Button ID="SaveBtn" runat="server" CssClass="btn btn-primary" OnClick="SaveBtn_Click"
                    Text=" 确定 " />
                <input id="CloseBtn" class="btn btn-danger" type="button" value=" 关闭 " onclick="window.close()" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
