<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDoc_Add.aspx.cs" Inherits="hkpro.workflow.docu.AdminDoc_Add" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
    function checkForm() {
        if (document.getElementById('Name').value == '') {
            alert('请输入文件名称！');
            form1.Name.focus();
            return false;
        }

        var strUploadDoc = document.getElementById('UploadDoc').value;
        if (strUploadDoc == "") {
            alert("请选择要上传的附件文档！");
            return false;
        }

        var nlength = strUploadDoc.length;
        var extName = strUploadDoc.substr(nlength - 4, 4).toLowerCase();
        if (nlength > 0) {
            var vfn = ".doc";
            if (vfn.indexOf(extName) == -1) {
                alert("请上传扩展名为.doc（注意大小写）的附件文档！");
                return (false);
                UploadDoc.focus;
            }
        }
    }
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>新增红头文件</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">        
        <tr>
            <td valign="top" align="center">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            <font color="red">*</font>文件名称：
                        </td>
                        <td width="80%">
                            <asp:TextBox ID="Name" runat="server" Width="90%" CssClass="mytext"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>选择附件：
                        </td>
                        <td>
                            <input id="UploadDoc" runat="server" style="width: 90%" type="file" name="UploadDoc"
                                class="mytext" />
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            用户范围：
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server" Height="55px" TextMode="MultiLine" Width="90%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-success" OnClick="SaveBtn_Click" />
                <input type="button" name="RecBtn" value=" 返回 " class="btn btn-info" onclick="javascript:location.href='AdminDoc.aspx'" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
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
