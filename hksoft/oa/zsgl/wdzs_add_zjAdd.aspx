<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wdzs_add_zjAdd.aspx.cs"
    Inherits="hkpro.oa.zsgl.wdzs_add_zjAdd" ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script language="javascript" type="text/javascript">
        function PageCheck() {
            var strUploadFile = document.getElementById('uploadFile').value;
            if (strUploadFile == "") {
                alert("请选择要上传的附件！");
                return false;
            }

            var nlength = strUploadFile.length;
            var extName = strUploadFile.substr(nlength - 4, 4).toLowerCase();

            var sAllowExt = "<%=attKey%>";
            var str = document.getElementById('uploadFile').value;
            var extName = str.substr(str.lastIndexOf('.') + 1, str.length - str.lastIndexOf('.')).toLowerCase();

            if (sAllowExt.indexOf(extName) == -1) {
                alert('对不起，您只能上传【' + sAllowExt + '】格式的文件\r如果需要上传其他格式的文件，请联系系统管理员！');
                return false;
            }
            var content = document.frames("EDIT_HTML").document.forms("Members").elements("Search").value;
            document.getElementById("ContractContentupdate").value = content;
        }
      
    </script>
    <script type="text/javascript">
        function AttDown() {
            if (document.getElementById('fjlb').value == '') {
                alert('请先选中附件再下载！');
                return false;
            }
            else {
                var num = Math.random();
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cText = littleproduct.options[cindex].text;
                var cValue = littleproduct.options[cindex].value;
                window.open("zsAttDown.aspx?tmp=" + num + "&number=" + cValue + "", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
            }
        }

        function AttDel() {
            if (document.getElementById('fjlb').value == '') {
                alert('请先选中附件再删除');
                return false;
            }
            else {
                if (!confirm("您确定要删除此附件吗？"))
                    return false;

                var num = Math.random();
                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cText = littleproduct.options[cindex].text;
                var cValue = littleproduct.options[cindex].value;
                window.open("zsAttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
            }
        }

        function OnlineEdit() {
            if (document.getElementById('fjlb').value == '') {
                alert('请先选择附件后再编辑！');
                return false;
            }
            else {

                var littleproduct = document.getElementById("fjlb");
                var cindex = littleproduct.selectedIndex;
                var cValue = littleproduct.options[cindex].value;
                var ckBool = false;
                var nlength = cValue.length;
                var extName = cValue.substr(nlength - 4, 4).toLowerCase();
                if (nlength > 0) {
                    if (extName == ".doc" || extName == ".DOC" || extName == ".xls" || extName == ".XLS" || extName == ".ppt" || extName == ".PPT") {
                        ckBool = true;
                        var num = document.getElementById("Number").value;
                        var tmp = Math.random();
                        window.open("OfficeEdit.aspx?tmp=" + tmp + "&number=" + num + "&file=" + cValue + "&filetype=" + extName + "", "newwindow", "height=650, width=900, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no");
                    }

                    if (ckBool == false) {
                        alert("您只能编辑扩展名为.doc|.xls|.ppt的文件！");
                        return (false);
                    }
                }
            }
        }
    </script>
    <title>新建章节</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <tr>
                    <td class="td_base" width="80%" height="25px">
                        新建章节
                    </td>
                    <td class="td_base" width="20%">
                        &nbsp;
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" valign="top">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="form">
                            <tr>
                                <td style="width: 15%" class="form-item">
                                    <font color="red">*</font>章节标题：
                                </td>
                                <td style="width: 85%">
                                    <asp:TextBox ID="Name" runat="server" Width="620" CssClass="mytext"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%;
                                        height: 280px;"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="form-item">
                                    附件列表：
                                </td>
                                <td>
                                    <asp:DropDownList ID="fjlb" runat="server" Width="80%">
                                    </asp:DropDownList>
                                    <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="下载附件">
                                    <asp:ImageButton ID="delBtn" runat="server" ImageUrl="../../Images/delete.gif" ToolTip="删除附件" />
                                    <img onclick="OnlineEdit();" src="../../Images/edit.gif" border="0" alt="在线编辑附件"
                                        id="editimg" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="form-item">
                                    上传附件：
                                </td>
                                <td>
                                    <input id="uploadFile" runat="server" style="width: 80%" type="file" name="uploadFile"
                                        class="mytext" />
                                    <asp:ImageButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" ImageUrl="../../Images/up.gif"
                                        ToolTip="上传附件" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    提示：正常使用在线编辑文档功能前，请 <a href="../../Down/oa/hk_RegOcx.rar" target="_blank" class="gvlink">
                                        下载并注册ocx组件</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="height: 30">
                        <asp:Button ID="BtnS" runat="server" Text=" 确定 " class="mybtn" OnClick="BtnS_Click" />
                        <input type="button" name="RecBtn" value=" 返回 " class="mybtn" onclick="javascript:location.href='wdzs_Add.aspx'" />
                    </td>
                </tr>
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Name"
        ErrorMessage="请输入章节标题">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
