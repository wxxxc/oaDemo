<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QueryWork_Show.aspx.cs"
    Inherits="hkpro.workflow.work.QueryWork_Show" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
function  OpenAppcom()  
{
    var num=Math.random();
    window.open ("AppComm.aspx?tmp="+num+"&id=<%=Request.QueryString["id"] %>", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
}

function  OpenSealLog()  
{
    var num= document.getElementById("Number").value;
    window.open ("Seal_UseLog.aspx?Number="+num+"", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
}

</script>
<head id="Head1" runat="server">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>查看工作</title>
</head>
<body class="main" onload="Settb();Load_Do();">
    <div id="hkshow1"></div>
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td style="height: 20px">
                &nbsp;流水号：<%=lshid %>－<%=Name%>－当前步骤：<%=strfnName %>－状态：<asp:Label ID="lblwStatus"
                    runat="server"></asp:Label>
            </td>
            <td align="right">
                <div id="hkshow2">
                    <input id="Button6" type="button" value="流程图" style="width: 80" onclick='window.open ("Flow_Show.aspx?FlowNumber=<%=FlowNumber%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")'
                        class="mybtn" />
                    <input id="Button7" type="button" value="审批意见" onclick="OpenAppcom();" class="mybtn"
                        style="width: 80" />
                    <input id="Button8" type="button" value="印章记录" onclick="OpenSealLog();" class="mybtn"
                        style="width: 80" />&nbsp;
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                &nbsp;工作标题：【<asp:Label ID="lblwTitle" runat="server"></asp:Label>】
            </td>
        </tr>
        <tr id="hktable">
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td>
                            <div id="strhtm">
                            </div>
                        </td>
                    </tr>
                </table>
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" align="right">
                            附件列表：
                        </td>
                        <td align="center" width="80%">
                            <asp:Label ID="lblattach" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblspyj" runat="server"></asp:Label>
            </td>
        </tr>
        <tr id="hkshow3">
            <td colspan="2" align="center" height="30">
                <input type="button" name="print" class="mybtn" value=" 打印 " onclick="javascript:PrintPage5()">
                <input id="BackBtn" class="mybtn" onclick="history.back()" type="button" value=" 返回 " />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lbltx" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="ContractContent" runat="server" Height="67px" TextMode="MultiLine"
        Width="424px" Style="display: none"></asp:TextBox>
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
