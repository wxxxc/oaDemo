<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Audi_Office.aspx.cs"
    Inherits="hkpro.workflow.work.HandleWork_Audi_Office" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
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
            document.all.frameCtr1.Open("http://" + serverpath + "/Attach/flow/work/<%=adfile%>?tmp=" + num + "", true);
        }

        function SaveFile() {
            document.all.frameCtr1.SetTrackRevisions(0);
            var serverpath = window.location.host + v_online_path;
            document.all.frameCtr1.HttpInit();
            document.all.frameCtr1.HttpAddPostString("RecordID", "200101001");
            document.all.frameCtr1.HttpAddPostString("UserID", "刘备");
            document.all.frameCtr1.HttpAddPostCurrFile("FileData", "abc.doc");
            document.all.frameCtr1.HttpPost("http://" + serverpath + "/workflow/Work/OfficeEdit_Save.aspx?file=<%=adfile%>&number=<%=number%>&adname=<%=adname%>");
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

        function InserAdoc() {
            if (document.getElementById('dp_admindoc').value == "请选择") {
                alert("请先选择红头文件后再插入！");
                return (false);
            }
            else {
                if (!confirm("您确认要将此红头文件插入到当前光标位置吗？"))
                    return false;

                var openurl = document.getElementById('dp_admindoc').value;
                var serverpath = window.location.host + v_online_path;

                document.all.frameCtr1.InSertFile("http://" + serverpath + "/Attach/flow/AdminDoc/" + openurl + "", 0);
            }
        }

        function OpenMySeal() {
            var aw = 400;
            var ah = 300;
            var al = (screen.width - aw) / 2 - 100;
            var at = (screen.height - ah) / 5;
            mytop = screen.availHeight - 500;
            myleft = 200;
            window.open("Seal_Use.aspx?Number=<%=number%>", "online", "height=" + ah + ",width=" + aw + ",status=0,toolbar=no,menubar=no,location=no,top=" + at + ",left=" + al + ",resizable=yes");
        }

        function InserSeal(name) {
            var serverpath = window.location.host + v_online_path;
            document.all.frameCtr1.InSertFile("http://" + serverpath + "/Attach/flow/Seal/" + name + "", 8);
        }	
    </script>
</head>
<body class="main" onload="chknull();">
    <form id="Form1" method="post" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td class="td_base" height="25">
                <input style="width: 80px" onclick="OpenMySeal()" type="button" value="我的印章" id="Button10"
                    runat="server" class="mybtn">
                <input style="width: 80px" onclick="Trk()" type="button" value="启用留痕" id="TrkBtn"
                    runat="server" class="mybtn">
                <input style="width: 80px" onclick="unTrk()" type="button" value="取消留痕" id="unTrkBtn"
                    runat="server" class="mybtn">
                <input style="width: 80px" onclick="clrTrk()" type="button" value="清除留痕" id="clrTrkBtn"
                    runat="server" class="mybtn">
                <input style="width: 80px" type="button" value="打印文档" id="prnBtn" language="javascript"
                    onclick="return print()" size="" runat="server" class="mybtn">
                <input type="button" value="插入红头文件" onclick="InserAdoc()" style="width: 100px;" id="Button3"
                    runat="server" class="mybtn">
                <asp:DropDownList ID="dp_admindoc" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr bgcolor="#f3f8fe">
            <td align="center" style="height: 8px">
                <object id="frameCtr1" codebase="dsoframer.ocx" height="580px" width="100%" classid="clsid:00460182-9E5E-11D5-B7C8-B8269041DD57">
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
            <td height="30" align="center">
                <asp:Button ID="SaveBtn" runat="server" Text=" 提交 " OnClick="SaveBtn_Click" CssClass="mybtn" />
                <input id="Button2" type="button" value=" 关闭 " onclick="window.close()" class="mybtn" />
                <font color="red">提示：您需要</font> <a href="../../Down/oa/hk_RegOcx.rar" target="_blank"
                    class="gvlink">下载并注册ocx组件</a> <font color="red">后才能正常使用在线编辑功能</font>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
