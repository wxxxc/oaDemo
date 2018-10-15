<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Folder.aspx.cs" Inherits="hkpro.portal.wpgl.Folder" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>我的网盘</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
</head>
<frameset border="0" framespacing="0" name="full" cols="*" marginwidth="0" marginheight="0"
    leftmargin="0" topmargin="0" rows="*">
  <frameset border="1" frameborder="yes" framespacing="0" cols="200,*">
    <frame src="folder_l.aspx" name="lframe10109" frameborder="yes" scrolling="auto" noresize>
    <frame src="folder_r.aspx" name="rframe10109" frameborder="yes" scrolling="no"></frameset>
</frameset>
<noframes>
    <body>
        <p>
            <font color="red">抱歉！本系统使用了框架技术，但您的浏览器不支持框架。</font></p>
    </body>
</noframes>
</html>
