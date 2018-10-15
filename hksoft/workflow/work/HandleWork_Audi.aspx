<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Audi.aspx.cs"
    Inherits="hkpro.workflow.work.HandleWork_Audi" ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script language="javascript" type="text/javascript">
    function dpac_onchange() {
        var text = form1.accontent.value;
        if (text != "请选择") {
            document.getElementById('txt_appcomm').value = "";
            document.getElementById('txt_appcomm').value = text;
        }
    }
</script>
<script>
    function  AttDown()  
    {
        if(document.getElementById('attlist').value=='')
        {
            alert('请选中附件再下载！');
            return false;
        }
        else
        {
            var num=Math.random();
            var littleproduct=document.getElementById("attlist");
            var cindex = littleproduct.selectedIndex;
            var cText  = littleproduct.options[cindex].text;
            var cValue = littleproduct.options[cindex].value;
            window.open ("WorkAttDown.aspx?tmp="+num+"&number="+cValue+"", "_blank", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");
        }
    }

    function  AttDel()  
    {
        if(document.getElementById('attlist').value=='')
        {
            alert('请选中附件再删除！');
            return false;
        }
        else
        {
            if (!confirm("您确定要删除此附件吗？"))
            return false;

            var num=Math.random();
            var littleproduct=document.getElementById("attlist");
            var cindex = littleproduct.selectedIndex;
            var cText  = littleproduct.options[cindex].text;
            var cValue = littleproduct.options[cindex].value;
            window.open("WorkAttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "height=1, width=1,top=150,left=150,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no");               
        }
    }			

    function  OpenSealLog()  
    {
        var num= document.getElementById("Number").value;
        window.open ("Seal_UseLog.aspx?Number="+num+"", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }

    function  OpenAppcom()  
    {
        var num=Math.random();
        window.open ("AppComm.aspx?tmp="+num+"&id=<%=Request.QueryString["id"] %>", "_blank", "height=500, width=750,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }
    
    function  OpenJq()  
    {
        var num=Math.random();
        window.open ("HandleWork_Jq.aspx?tmp="+num+"&id=<%=Request.QueryString["id"] %>", "_blank", "height=300, width=600,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }

    function OnlineEdit()
    {
        if(document.getElementById('attlist').value=='')
        {
            alert('请先选择附件后再编辑！');
            return false;
        }
        else
        {
            var littleproduct=document.getElementById("attlist");
            var cindex = littleproduct.selectedIndex;
            var cValue = littleproduct.options[cindex].value;
            var ckBool=false;
            var nlength=cValue.length;
            var extName=cValue.substr(nlength-4,4).toLowerCase();
            if (nlength>0)
            {
                if (  extName==".doc"  ||   extName==".DOC"    ||   extName==".xls"    ||   extName==".XLS"  ||   extName==".ppt"    ||   extName==".PPT"    )
                { 
                ckBool=true;
                var num= document.getElementById("Number").value;
                var tmp=Math.random();
                window.open("HandleWork_Audi_Office.aspx?tmp="+tmp+"&number="+num+"&file="+cValue+"&filetype="+extName+"","newwindow","height=650, width=900, top=0, left=0, toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no");
                }

                if (ckBool==false)
                { alert("您只能编辑扩展名为.doc|.xls|.ppt的文件！");
                return(false);
                }
            }
        }
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
<head id="Head1" runat="server">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
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
    <title>工作办理</title>
</head>
<body class="main" onload="chkBrowser();Settb();Load_Do();">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">     
        <tr>
            <td style="height: 20px">
                &nbsp;流水号：<asp:Label ID="lbllshid" runat="server"></asp:Label>
                －<asp:TextBox ID="whname" runat="server" Width="300px" CssClass="mytext"></asp:TextBox>
            </td>
            <td align="right">
                <input id="Button6" type="button" value="流程图" onclick='window.open("Flow_Show.aspx?FlowNumber=<%=Request.QueryString["FlowNumber"]%>", "_blank", "height=650, width=900,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no,top=0,left=0")'
                    class="btn btn-primary" style="width: 80" />
                <input id="Button7" type="button" value="审批意见" onclick="OpenAppcom();" class="btn btn-info"
                    style="width: 80" />
                <input id="Button8" type="button" value="印章记录" onclick="OpenSealLog();" class="btn btn-success"
                    style="width: 80" />
                <input id="Button2" type="button" value="加签" onclick="OpenJq();" class="btn btn-primary" style="width: 80"
                    runat="server" visible="false" />&nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                &nbsp;当前步骤：【<asp:Label ID="lblstrfnName" runat="server"></asp:Label>】审批模式：【<asp:Label
                    ID="lblstrAudiMode" runat="server"></asp:Label>】
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 20px">
                &nbsp;工作标题：【<asp:Label ID="lblwTitle" runat="server"></asp:Label>
            】
        </tr>
        <tr>
            <td valign="top" align="center" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td bgcolor="#ffffff">
                            <div id="strhtm">
                            </div>
                        </td>
                    </tr>
                </table>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            附件列表：
                        </td>
                        <td width="80%">
                            <asp:DropDownList ID="attlist" runat="server" Width="80%">
                            </asp:DropDownList>
                            <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="下载附件">
                            <img onclick="OnlineEdit();" src="../../Images/edit.gif" border="0" alt="在线编辑附件"
                                id="editimg" runat="server" />
                            <asp:ImageButton ID="delBtn" runat="server" ImageUrl="../../Images/delete.gif" ToolTip="删除附件" />
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
                <asp:Label ID="lblspyj" runat="server"></asp:Label>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                    <tr>
                        <td width="20%" class="form-item">
                            常用审批备注：
                        </td>
                        <td width="80%">
                            <asp:DropDownList ID="accontent" runat="server" onchange="dpac_onchange()" Width="45%">
                            </asp:DropDownList>
                            <font color="red">注：可通过【个人办公》我的常用语】编辑常用审批意见</font>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            <font color="red">*</font>审批意见：
                        </td>
                        <td>
                            <asp:TextBox ID="txt_appcomm" runat="server" Height="55px" TextMode="MultiLine" Width="80%"
                                CssClass="mytextarea"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="form-item">
                            审批附件：
                        </td>
                        <td>
                            <input id="uploadFile" runat="server" name="uploadFile" style="width: 80%" type="file"
                                class="mytext" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="30">
                <asp:Button ID="Button1" runat="server" Text="保 存" CssClass="btn btn-primary" OnClick="Button1_Click" />
                <asp:Button ID="Button4" runat="server" Text="保存并通过" CssClass="btn btn-success" OnClick="Button4_Click" />
                <asp:Button ID="Button9" runat="server" Text="保存并驳回" CssClass="btn btn-info" OnClick="Button9_Click" />
                <input type="button" name="RecBtn" value="关 闭" class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblnnnk" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="lbltx" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="lblName" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="lblFormName" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="ContractContent" runat="server" TextMode="MultiLine" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblstrhyUserIDs" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstrhyUserNames" runat="server" Visible="false"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txt_appcomm"
        ErrorMessage="请输入审批意见">&nbsp;
    </asp:RequiredFieldValidator>
    <script type="text/javascript">
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
