<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jxkhgz_View.aspx.cs" Inherits="hksoft.hr.jxkh.Jxkhgz_View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../../css/style.css" rel="stylesheet" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="../../cssjs/mypc.css" />
    <script src="../../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/EnterCode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>绩效考核规则</title>
</head>
<body>
    <form id="form1" runat="server">
        <div align="center" style="padding-top: 10px;">

          <%--  <textarea runat="server" id="editor" name="editor" rows="10" cols="10"
                kstyle="border-bottom: 0px solid; border-right: 0px solid; border-top: 0px solid; border: 0; width: 100%; height: 600px;"></textarea>--%>
            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%; height:600px;"></textarea>
        </div>
        <div style="margin-left: 95%">
            <asp:Button runat="server" ID="upbtn" OnClick="update_click" CssClass="btn btn-primary" Text="修改" />
        </div>
        <script type="text/javascript">
            var ue = UE.getEditor('editor');
        </script>
    </form>
</body>
</html>
