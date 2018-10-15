<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArrangeWork_Mod.aspx.cs"
    Inherits="hkpro.workflow.work.ArrangeWork_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function chknull() {
        if (document.getElementById('Name').value == '') {
            alert('请输入文件夹名称！');
            form1.Name.focus();
            return false;
        }

        if (document.getElementById('txt_ordid').value == '') {
            alert('请输入排序号！');
            form1.ContractMoney.focus();
            return false;
        }

        if (document.getElementById('txt_ordid').value != '') {
            var objRe = /^\d+(\.\d+)?$/;
            if (!objRe.test(document.getElementById('txt_ordid').value)) {
                alert("排序号必须为数字！");
                form1.txt_ordid.focus();
                return false;
            }
        }
    }  
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>工作归档</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            文件夹名称：
                        </td>
                        <td height="17" colspan="3" width="80%">
                            <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            排序号：
                        </td>
                        <td>
                            <asp:TextBox ID="txt_ordid" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input id="BackBtn" class="btn btn-info" onclick="history.back()" type="button" value=" 返回 " />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
