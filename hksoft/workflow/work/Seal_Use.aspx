<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Seal_Use.aspx.cs" Inherits="hkpro.workflow.work.Seal_Use" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <base target="_self" />
    <script>
        function chknull() {
            if (document.getElementById('dpSeal').value == "请选择") {
                alert("请先选择印章！");
                return (false);
            }
            else {
                if (!confirm("您确定要将此印章插入到文档的光标位置吗？"))
                    return false;
            }
        }

        function dpSealchange() {
            if (document.getElementById('dpSeal').value == "请选择") {
                document.getElementById('img1').src = "../../images/flow/sample.jpg";
            }
            else {
                document.getElementById('img1').src = "../../Attach/flow/Seal/" + document.getElementById('dpSeal').value + "";
            }
        }
	
    
    </script>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>选择印章</title>
</head>
<body class="main" onclick="dpSealchange();">
    <form id="form1" runat="server">
    <table align="center" border="0" cellpadding="0" cellspacing="1" style="width: 100%">
        <tr>
            <td style="height: 30px" colspan="2">
            </td>
        </tr>
        <tr>
            <td width="50%" valign="top" align="center">
                <table border="0" cellpadding="2" cellspacing="0" style="width: 98%;">
                    <tr>
                        <td style="height: 30px">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            请选择印章：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="dpSeal" runat="server" Width="180px" onchange="dpSealchange()">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            请输入密码：
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="sealpwd" runat="server" Width="180px" TextMode="Password" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 25px">
                            <asp:Button ID="Button1" runat="server" Text=" 确定 " OnClick="Button1_Click" CssClass="mybtn" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 50%">
                <img src="../../images/flow/sample.jpg" style="width: 195px; height: 195px" id="img1"
                    name="img1" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
