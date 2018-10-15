<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesManageBook_add_online.aspx.cs"
    Inherits="hkpro.oa.dagl.FilesManageBook_add_online" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>在线编辑</title>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <base target="_self" />
    <script src="../../CssJs/Parameters.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script>
		function chknull()
		{
		    //获取浏览器版本
		    var bstr = getBrowserType();
		    //alert(bstr);
		    if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
		        alert("抱歉，您必须启用当前浏览器的IE兼容模式或安装了IE插件后，才能正常使用此功能！\r\n具体说明可参考本系统登录页面下方的【点击下载各浏览器配置说明】文档。");
		        return;
		    }
		    
			document.all.FramerControl1.caption = "在线编辑：<%=forname%>";
			var serverpath=window.location.host+v_online_path; 
			
			var num=Math.random();
			document.all.FramerControl1.Open("http://" + serverpath + "/Attach/oa/dagl/<%=forfile%>?tmp=" + num + "", true);
		}                     
      
        function SaveToWeb()
        {
			document.all.FramerControl1.SetTrackRevisions(0);
            var serverpath=window.location.host+v_online_path; 
            document.all.FramerControl1.HttpInit();
            document.all.FramerControl1.HttpAddPostString("RecordID","200601022");
            document.all.FramerControl1.HttpAddPostString("UserID","李局长");
            document.all.FramerControl1.HttpAddPostCurrFile("FileData", "bbb.doc");
            document.all.FramerControl1.HttpPost("http://"+serverpath+"/oa/dagl/FilesManageBook_add_online_save.aspx?file=<%=forfile%>&number=<%=number%>&forname=<%=forname%>");
        } 
        
        function Track(){
            document.all.FramerControl1.SetTrackRevisions(1);
			document.all.FramerControl1.SetCurrUserName("<%=realname%>");	
        }
        
        function UnTrack(){
            document.all.FramerControl1.SetTrackRevisions(0);
          
        }

        function print(){
            document.all.FramerControl1.PrintOut();
        }
        
        function printview(){
            document.all.FramerControl1.PrintPreview();
        }
         
        function printviewexit(){
            document.all.FramerControl1.PrintPreviewExit();  
        }
        
        function clearTrack(){
           document.all.FramerControl1.SetTrackRevisions(4);
        }	
    </script>
</head>
<body onload="chknull();" class="main">
    <form id="Form1" method="post" runat="server">
    <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
            <td valign="top">
                <table height="26" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td>
                            &nbsp;<input style="width: 100px" onclick="Track()" type="button" value="进入留痕" id="Button8"
                                runat="server" class="mybtn">
                            <input style="width: 100px" onclick="UnTrack()" type="button" value="取消留痕" id="Button9"
                                runat="server" class="mybtn">
                            <input style="width: 100px" onclick="clearTrack()" type="button" value="清除留痕" id="Button7"
                                runat="server" class="mybtn">
                            <input style="width: 100px" type="button" value="打印文档" id="Button6" language="javascript"
                                onclick="return print()" size="" runat="server" class="mybtn">
                        </td>
                    </tr>
                </table>
                <table cellspacing="1" cellpadding="4" width="100%" bgcolor="#d8e1e8" border="0">
                    <tr bgcolor="#f3f8fe">
                        <td align="center" style="height: 8px">
                            <object id="FramerControl1" codebase="dsoframer.ocx" height="620px" width="99%" classid="clsid:00460182-9E5E-11D5-B7C8-B8269041DD57">
                                <param name="_ExtentX" value="16960">
                                <param name="_ExtentY" value="13600">
                                <param name="BorderColor" value="-2147483632">
                                <param name="BackColor" value="-2147483643">
                                <param name="ForeColor" value="-2147483640">
                                <param name="TitlebarColor" value="-2147483635">
                                <param name="TitlebarTextColor" value="-2147483634">
                                <param name="BorderStyle" value="1">
                                <param name="Titlebar" value="0">
                                <param name="Toolbars" value="1">
                                <param name="Menubar" value="1">
                            </object>
                        </td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td align="center">
                            <asp:Button ID="Button1" runat="server" Text="提 交" OnClick="Button1_Click" CssClass="mybtn" />
                            <input id="Button2" type="button" value="关 闭" onclick="window.close()" class="mybtn" />
                            <font color="red">提示：您需要</font> <a href="../../Down/oa/hk_RegOcx.rar" target="_blank" class="gvlink">
                                下载并注册ocx组件</a> <font color="red">后才能正常使用在线编辑功能</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
