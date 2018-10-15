<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Xzjg.aspx.cs" Inherits="hksoft.choose.oa.Xzjg" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>选择机构</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>

    <base target="_self" />
    <script language="javascript">
        function checkbtn() {
            if (rform.document.getElementById('jigou').value == '') {
                alert('您未选中任何项！');
                return false;
            }
            else {
                sendFromChild();
            }
        }

        function sendFromChild() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue("" + rform.document.getElementById('GzdwId').value + "|" + rform.document.getElementById('jigou').value + "|" + rform.document.getElementById('dQxStr').value + "");
            }
            else {
                window.returnValue = "" + rform.document.getElementById('GzdwId').value + "|" + rform.document.getElementById('jigou').value + "|" + rform.document.getElementById('dQxStr').value + "";
            }

            window.close();
        }

        function clearwin() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue("|");
            }
            else {
                window.returnValue = "|";
            }

            window.close();
        }

        window.onbeforeunload = function () {
            var n = window.event.screenX - window.screenLeft;
            var b = n > document.documentElement.scrollWidth - 20;
            if (b && window.event.clientY < 0 || window.event.altKey) {
            }
        }

        function closewin() {
            window.close();
        }
    </script>
    <script>
        function onRadBtn() {
            aa = document.getElementsByName("Rad");
            for (i = 0; i < aa.length; i++) {
                if (aa[i].value == document.getElementById('requeststr').value) {
                    aa[i].checked = true;
                    //alert(i);  
                    return false;
                }
                else {
                    aa[i].checked = false;
                }
            }
        }
    </script>
</head>
<body class="main" onload="onRadBtn()">
    <form id="Form1" method="post" runat="server">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="top">
                    <table border="0" cellspacing="0" cellpadding="0" style="width:100%;height: 450px" align="center">
                        <tr>
                            <td valign="top">
                                <iframe name="lhead" marginwidth="0" marginheight="0" src="Jggl.aspx?id=<%=Request.QueryString["id"]%>" frameborder="0"
                                    width="100%" height="450" scrolling="auto"></iframe>
                            </td>
                            <td valign="top">
                                <iframe name="rform" marginwidth="0" marginheight="0" src="Xzjgmc.aspx?id=<%=Request.QueryString["id"]%>" frameborder="0" width="100%" height="450" scrolling="auto"></iframe>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 30px;" align="center">
                                <input type="button" value="确定" onclick="return checkbtn();" class="mybtn" id="Button1">
                                <input type="button" value="关闭" onclick="closewin();" class="mybtn" id="Button3">
                                <input type="button" value="清空" onclick="clearwin();" class="mybtn" id="Button2">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:TextBox ID="requeststr" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
