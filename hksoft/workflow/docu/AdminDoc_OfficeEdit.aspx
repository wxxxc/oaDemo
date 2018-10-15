<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDoc_OfficeEdit.aspx.cs"
    Inherits="hkpro.workflow.docu.AdminDoc_OfficeEdit" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <title>在线编辑文档</title>
    <base target="_self" />
    <script src="../../CssJs/Parameters.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script>
        function chknull() {
            //获取浏览器版本
            var bstr = getBrowserType();
            //alert(bstr);
            if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                alert("抱歉，您必须启用当前浏览器的IE兼容模式或安装了IE插件后，才能正常使用此功能！\r\n具体说明可参考本系统登录页面下方的【点击下载各浏览器配置说明】文档。");
                return;
            }

            document.all.frameCtr1.caption = "在线编辑：<%=adname%>";
            var serverpath = window.location.host + v_online_path;

            var num = Math.random();
            document.all.frameCtr1.Open("http://" + serverpath + "/Attach/flow/AdminDoc/<%=adfile%>?tmp=" + num + "", true);
        }

        function SaveFile() {
            document.all.frameCtr1.SetTrackRevisions(0);
            var serverpath = window.location.host + v_online_path;
            document.all.frameCtr1.HttpInit();
            document.all.frameCtr1.HttpAddPostString("RecordID", "200101001");
            document.all.frameCtr1.HttpAddPostString("UserID", "刘备");
            document.all.frameCtr1.HttpAddPostCurrFile("FileData", "abc.doc");
            document.all.frameCtr1.HttpPost("http://" + serverpath + "/workflow/Docu/AdminDoc_OfficeEdit_Save.aspx?file=<%=adfile%>&number=<%=number%>&adname=<%=adname%>");
        }

        function Trk() {
            document.all.frameCtr1.SetTrackRevisions(1);
            document.all.frameCtr1.SetCurrUserName("<%=usname%>");
        }

        function unTrk() {
            document.all.frameCtr1.SetTrackRevisions(0);
        }

        function print() {
            document.all.frameCtr1.PrintOut();
        }

        function clrTrk() {
            document.all.frameCtr1.SetTrackRevisions(4);
        }		      
    </script>
</head>
<body class="main" onload="chknull();">
    <form id="Form1" method="post" runat="server">
    <table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
        <tr>
            <td valign="top" style="text-align: center">
                <table height="26" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td class="td_base">
                            <input onclick="Trk()" type="button" value="启用留痕" id="TrkBtn" runat="server" class="mybtn">
                            <input onclick="unTrk()" type="button" value="取消留痕" id="unTrkBtn" runat="server"
                                class="mybtn">
                            <input onclick="clrTrk()" type="button" value="清除留痕" id="clrTrkBtn" runat="server"
                                class="mybtn">
                            <input type="button" value="打印文档" id="prnBtn" language="javascript" onclick="return print()"
                                runat="server" class="mybtn">
                        </td>
                    </tr>
                </table>
                <table cellspacing="1" cellpadding="4" width="100%" border="0">
                    <tr>
                        <td align="center">
                            <object id="frameCtr1" codebase="dsoframer.ocx" height="560px" width="99%" classid="clsid:00460182-9E5E-11D5-B7C8-B8269041DD57">
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
                            <asp:Button ID="SaveBtn" runat="server" Text=" 提交 " OnClick="SaveBtn_Click" CssClass="btn btn-success" />
                            <input id="CloseBtn" type="button" value=" 关闭 " onclick="window.close()" class="btn btn-danger" />
                            <font color="red">提示：您需要</font> <a href="../../Down/oa/hk_RegOcx.rar" target="_blank"
                                class="gvlink">下载并注册ocx组件</a> <font color="red">后才能正常使用在线编辑功能</font>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
