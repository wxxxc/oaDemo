<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDoc_Mod.aspx.cs" Inherits="hkpro.workflow.docu.AdminDoc_Mod" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
    function checkForm() {
        if (document.getElementById('Name').value == '') {
            alert('请输入文件名称！');
            form1.Name.focus();
            return false;
        }
    }

    function AttDown() {
        var num = Math.random();
        window.open("AdminDoc_Down.aspx?tmp=" + num + "&number=<%=newname%>", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
    }
</script>
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>修改红头文件</title>
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
                            <asp:TextBox ID="Name" runat="server" Width="80%" CssClass="mytext"></asp:TextBox>
                            <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="下载文件">
                            <img onclick="OnlineEdit();" src="../../Images/edit.gif" border="0" alt="在线编辑文件">
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            用户范围：
                        </td>
                        <td>
                            <asp:TextBox ID="UserName" runat="server" Height="55px" TextMode="MultiLine" Width="85%"
                                CssClass="mytextarea"></asp:TextBox>
                            <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                <input type="button" name="RecBtn" value=" 返回 " class="btn btn-info" onclick="javascript:location.href='AdminDoc.aspx'" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="UserID" runat="server" Width="90%" Style="display: none"></asp:TextBox>
    <script>
        function OnlineEdit() {
            var cValue = "<%=newname%>";
            var ckBool = false;
            var nlength = cValue.length;
            var extName = cValue.substr(nlength - 4, 4).toLowerCase();
            if (nlength > 0) {
                if (extName == ".doc" || extName == ".DOC" || extName == ".xls" || extName == ".XLS" || extName == ".ppt" || extName == ".PPT") {
                    ckBool = true;
                    var num = "<%=newname%>";
                    var tmp = Math.random();
                    window.open("AdminDoc_OfficeEdit.aspx?tmp=" + tmp + "&number=" + num + "&file=" + cValue + "&filetype=" + extName + "", "_blank", "height=700, width=960, top=0, left=30, toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no");
                }
                if (ckBool == false) {
                    alert("对不起，仅能编辑扩展名为.doc|.xls|.ppt的文件！");
                    return (false);
                }
            }
        }     
    </script>
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
