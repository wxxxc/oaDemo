<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWork_Add.aspx.cs" Inherits="hkpro.workflow.work.AddWork_Add"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
        function PageCheck()
        {
            var strUploadFile=document.getElementById('uploadFile').value;
            if (strUploadFile=="")
            {
                alert("请选择要上传的附件！"); 
                return false;
            } 
            
            var nlength=strUploadFile.length;
            var extName=strUploadFile.substr(nlength-4,4).toLowerCase();

            var sAllowExt = "<%=attKey%>";
            var str = document.getElementById('uploadFile').value;
            var extName=str.substr(str.lastIndexOf('.')+1,str.length - str.lastIndexOf('.')).toLowerCase();

            if(sAllowExt.indexOf(extName)==-1)
            {
	            alert('对不起，您只能上传【'+sAllowExt+'】格式的文件\r如果需要上传其他格式的文件，请联系系统管理员！');
	            return false;
            }
            var  content=document.frames("EDIT_HTML").document.forms("Members").elements("Search").value;  
            document.getElementById("ContractContentupdate").value=content;  
        }
        
        function OpenSetSeal(str1,str2)
        {
            var aw = 400;
            var ah = 300;
            var al = (screen.width - aw)/2-100;
            var at = (screen.height - ah)/5;
            mytop=screen.availHeight-500;
            myleft=200;
            var aaaa=document.getElementById('Number').value;
            window.open("MySeal_Use.aspx?Number="+aaaa+"&picname="+str1+"&yznum="+str2+"&FlowNumber=<%=Request.QueryString["FlowNumber"] %>","online","height="+ah+",width="+aw+",status=0,toolbar=no,menubar=no,location=no,top="+at+",left="+al+",resizable=yes");
        }

        function setpic(str1,str2)
        {
          document.getElementById(''+str1+'').src = "../../Attach/flow/Seal/"+str2+"";
        }
</script>
<script>
    function AttDown() {
        if (document.getElementById('attlist').value == '') {
            alert('请先选中附件再下载！');
            return false;
        }
        else {
            var num = Math.random();
            var littleproduct = document.getElementById("attlist");
            var cindex = littleproduct.selectedIndex;
            var cText = littleproduct.options[cindex].text;
            var cValue = littleproduct.options[cindex].value;
            window.open("WorkAttDown.aspx?tmp=" + num + "&number=" + cValue + "", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
        }
    }

    function AttDel() {
        if (document.getElementById('attlist').value == '') {
            alert('请先选中附件再删除');
            return false;
        }
        else {
            if (!confirm("您确定要删除此附件吗？"))
                return false;

            var num = Math.random();
            var littleproduct = document.getElementById("attlist");
            var cindex = littleproduct.selectedIndex;
            var cText = littleproduct.options[cindex].text;
            var cValue = littleproduct.options[cindex].value;
            window.open("WorkAttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
        }
    }

    function OpenAppComm() {
        var num = Math.random();
        var aaaa = document.getElementById('Number').value;
        window.open("AppComm.aspx?tmp=" + num + "&Number=" + aaaa + "", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }

    function OpenSealLog() {
        var num = document.getElementById("Number").value;
        window.open("Seal_UseLog.aspx?Number=" + num + "", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }

    function OnlineEdit() {
        if (document.getElementById('attlist').value == '') {
            alert('请先选择附件后再编辑！');
            return false;
        }
        else {

            var littleproduct = document.getElementById("attlist");
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
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script language="javascript">
        function chkBrowser() {
            //获取浏览器版本
            var bstr = getBrowserType();
            //alert(bstr);
            if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                alert("抱歉，您必须启用当前浏览器的IE兼容模式或安装了IE插件后，才能正常使用此功能！\r\n具体说明可参考本系统登录页面下方的【点击下载各浏览器配置说明】文档。");
            }
        }
    </script>
    <title>新建工作</title>
    <base target="_self" />
</head>
<body class="main" onload="chkBrowser();Settb();Load_Do();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">     
        <tr>
            <td>
                &nbsp;&nbsp;流水号：<%=serid %>
                －<asp:TextBox ID="fileid" runat="server" Width="280px" CssClass="mytext"></asp:TextBox>
                － 当前步骤：<%=nowfnName %>
            </td>
            <td align="right">
                <input id="viewflowBtn" type="button" value="流程图" onclick='window.open("Flow_Show.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"]%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")'
                    class="mybtn" style="width: 70" />
                <input id="viewappBtn" type="button" value="审批意见" onclick="OpenAppComm();" class="mybtn"
                    style="width: 70" />
                <input id="viewsealBtn" type="button" value="印章记录" onclick="OpenSealLog();" class="mybtn"
                    style="width: 70" />&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;&nbsp;<font color="red">*</font>工作标题：<asp:TextBox ID="wTitle" runat="server"
                    Width="450px" CssClass="mytext"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td bgcolor="#ffffff" colspan="2">
                            <div id="strhtm">
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            附件列表：
                        </td>
                        <td width="80%">
                            <asp:DropDownList ID="attlist" runat="server" Width="80%">
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
                        <td class="form-item">
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
            <td style="height: 30" colspan="2" align="center">
                <asp:Button ID="NetxBtn" runat="server" Text="下一步" CssClass="mybtn" OnClick="NetxBtn_Click" />
                <input type="button" name="RecBtn" value="关闭" class="mybtn" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lbloNextNodeNum" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="lblwricolu" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="ContractContent" runat="server" TextMode="MultiLine" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblZwmc" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="wTitle"
        ErrorMessage="请输入工作标题">&nbsp;
    </asp:RequiredFieldValidator>

    <script>
        function Settb() {
            document.getElementById("strhtm").innerHTML = document.getElementById("lblwricolu").value;
        }

        function Load_Do() {
            setTimeout("Load_Do()", 0);
            var content = document.getElementById("strhtm").innerHTML;
            document.getElementById("ContractContent").value = content;
            document.getElementById("lblwricolu").value = document.getElementById("ContractContent").value;
        }
    </script>
    </form>
</body>
</html>
