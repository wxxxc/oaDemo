<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrangeWork_Show.aspx.cs"
    Inherits="hkpro.workflow.work.ArrangeWork_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function OpenAppComm() {
        var num = Math.random();
        window.open("AppComm.aspx?tmp=" + num + "&id=<%=strwfid %>", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }

    function OpenSealLog() {
        var num = document.getElementById("number").value;
        window.open("Seal_UseLog.aspx?Number=" + num + "", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }
</script>
<head id="Head1" runat="server">
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>查看工作归档</title>
</head>
<body class="main" onload="Settb();Load_Do();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 20">
                流水号：<%=strserid%>
                －<%=Name%>
            </td>
            <td align="right">
                <input id="viewflowBtn" type="button" value="流程图" onclick='window.open ("Flow_Show.aspx?FlowNumber=<%=strwfno%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")'
                    style="width: 80" class="mybtn" />
                <input id="viewappBtn" type="button" value="审批意见" onclick="OpenAppComm();" style="width: 80"
                    class="mybtn" />
                <input id="viewsealBtn" type="button" value="印章记录" onclick="OpenSealLog();" style="width: 80"
                    class="mybtn" />&nbsp;
            </td>
        </tr>
        <tr>
            <td style="height: 20" colspan="2">
                工作标题：【<asp:Label ID="lblwTitle" runat="server"></asp:Label>】
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td bgcolor="#ffffff">
                            <div id="strhtm">
                            </div>
                        </td>
                    </tr>
                </table>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td class="form-item">
                            发起人：
                        </td>
                        <td>
                            <asp:Label ID="lblFcname" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" class="form-item">
                            附件列表：
                        </td>
                        <td width="80%">
                            <asp:Label ID="lblattach" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <input id="BackBtn" class="btn btn-info" onclick="history.back()" type="button" value=" 返回 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lbltx" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="ContractContent" runat="server" TextMode="MultiLine" Style="display: none"></asp:TextBox>
    <script>
        function Settb() {
            document.getElementById("strhtm").innerHTML = document.getElementById("lbltx").value;
        }

        function Load_Do() {
            setTimeout("Load_Do()", 0);
            var content = document.getElementById("strhtm").innerHTML
            document.getElementById("ContractContent").value = content;
            document.getElementById("lbltx").value = document.getElementById("ContractContent").value;
        }
    </script>
    </form>
</body>
</html>
