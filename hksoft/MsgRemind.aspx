<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgRemind.aspx.cs" Inherits="hksoft.MsgRemind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>消息提醒</title>
    <link href="CssJs/Main.css" type="text/css" rel="stylesheet" />
        
    <script language="javascript">
        function MsgShow() {
            //document.getElementById("NewMsg").innerHTML = "<a href='javascript:void(0)' onclick='javascript:MsgEject();' title='点击查看未读消息'><img src='images/remind.gif'border=0></a><object id='msgsound' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0' width='0' height='0'><param name='movie' value='images/Sounds/<%=RemSoundStr %>'><param name=quality value=high><embed id='msgsound' src='images/Sounds/<%=RemSoundStr%>' width='0' height='0' quality='autohigh' wmode='opaque' type='application/x-shockwave-flash' plugspace='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash'></embed></object>";
            document.getElementById("NewMsg").innerHTML = "<a href='javascript:void(0)' onclick='javascript:MsgEject();' title='点击查看未读消息'><img src='images/remind.gif' border=0 style='width:20px;height:20px;'></a><embed id='msgsound' src='images/Sounds/<%=RemSoundStr%>' width='0' height='0'></embed>";
        }

        function MsgEject() {
            mytop = screen.availHeight - 250;
            myleft = 0;
            var newmsgwin = window.open("portal/xxgl/msgmanage.aspx", "auto_call_show", "height=200,width=370,status=0,toolbar=no,menubar=no,location=no,scrollbars=no,top=" + mytop + ",left=" + myleft + ",resizable=no");
            newmsgwin.focus();
        }
    </script>
    <script>
        function send_request(url)
        {
            http_request=false;
            if(window.XMLHttpRequest)//Mozilla 浏览器
            {
	            http_request=new XMLHttpRequest();
	            if(http_request.overrideMimeType)//设置MiME类别
	            {
		            http_request.overrideMimeType("text/xml");
	            }
            }
            else if(window.ActiveXObject)// IE浏览器
            {
	            try
	            {
		            http_request=new ActiveXObject("Msxml2.XMLHTTP");
	            }
	            catch(e)
	            {
		            try
		            {
			            http_request=new ActivexObject("Microsoft.XMLHTTP");
		            }
		            catch(e)
		            {}
	            }
            }
            if(!http_request)// 异常，创建对象实例失败
            {
                content.innerHTML="不能创建XMLHttpRequest对象实例";
	            return false;
            }
            //指定服务器返回信息时处理程序
            http_request.onreadystatechange=processRequest;
            // 确定发送请求的方式和URL以及是否同步执行下段代码
            http_request.open("GET",url,true);
            http_request.send(null);
        }

        function processRequest()
        {
            if(http_request.readyState==4)
            {				
                if(http_request.status==200)
                {			 		
                    if(http_request.responseText=='1')
                    {
                        if('<%=ynRemindStr%>'=='是')
                        {
                           if('<%=RemindModeStr%>'=='是')
                           {
                              MsgEject();
                           }
                           MsgShow();
                        }
                        else
                        {
                          document.getElementById("NewMsg").innerHTML="";
                        }
                    }
                    else
                    {
                      document.getElementById("NewMsg").innerHTML="";
                    }
                }
                else
                {

                }
            }
        }
        window.setInterval("send_request('MsgRemindAjax.aspx?tmp='+Math.random())",<%=RemTimeStr%>);
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <span id="NewMsg"></span>
    <script>send_request('MsgRemindAjax.aspx?tmp=' + Math.random());</script>
    </form>
</body>
</html>
