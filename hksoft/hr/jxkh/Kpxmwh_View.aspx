<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Kpxmwh_View.aspx.cs" Inherits="hkpro.oa.jxkh.Kpxmwh_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>
    
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
                window.open("../../AttDown.aspx?tmp=" + num + "&number=" + cValue + "&fname=hr/jxgl", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
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
                window.showModalDialog("../../AttDel.aspx?tmp=" + num + "&number=" + cValue + " ", "window", "dialogWidth:1px;DialogHeight=1px;status:no;scroll=yes;help:no");
            }
        }
    </script>
    
    <title>考评项目维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    <asp:Label ID="lbltitle" runat="server"></asp:Label>考评项目信息
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td style="height: 10px">
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left">
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                        <tr>
                                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                                align="center">
                                                <a href="#" class="mail_top">基本信息</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                                <a href="Kpxmwh_View_Bkpr.aspx?id=<%=kpid.Text %>" class="black">被考评人信息</a>
                                            </td>
                                            <td align="right">
                                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"
                                                    AccessKey="s" Visible="false"></asp:Button>
                                                <asp:Button CssClass="btn btn-info" ID="StartBtn" runat="server" Text="启动" OnClientClick="return confirm('确认启动后将不能再修改，要继续执行吗？')" Visible="false" OnClick="Start_Click"></asp:Button>
                                                <asp:Button CssClass="btn btn-primary" ID="StopBtn" runat="server" Text="暂停" OnClientClick="return confirm('确认要暂停此考评项目吗？')" Visible="false" OnClick="Stop_Click"></asp:Button>
                                                <asp:Button CssClass="btn btn-success" ID="ResetBtn" runat="server" Text="重新修改" OnClientClick="return confirm('确认要还原成未生效状态后重新修改吗？')" Visible="false" OnClick="Reset_Click"></asp:Button>
                                                <asp:Button CssClass="btn btn-warning" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click"
                                                    Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button>
                                                <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" class="form" width="100%">
                                        <tr>
                                            <td class="form-item">
                                                考评开始日期<font color="red">*</font>：</td>
                                            <td>
                                                <asp:TextBox CssClass="mytext" ID="ksrq" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox>
                                            </td>
                                            <td class="form-item">
                                                考评截止日期<font color="red">*</font>：</td>
                                            <td>
                                                <asp:TextBox CssClass="mytext" ID="jzrq" runat="server" Width="90%" onclick="SelectDate(this,'yyyy-MM-dd')"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" style="width:20%">
                                                考评期数<font color="red">*</font>：
                                            </td>
                                            <td style="width:30%">
                                                <asp:TextBox ID="kpqs" runat="server" CssClass="mytext" Width="90%"></asp:TextBox>
                                            </td>
                                            <td class="form-item" style="width:20%">
                                                考评状态：
                                            </td>
                                            <td style="width:30%">
                                                <asp:Label ID="kpzt" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">
                                                参与评委<font color="red">*</font>：</td>
                                            <td colspan="3">
                                                <asp:TextBox ID="UserName" runat="server" Height="55px" TextMode="MultiLine" Width="92%"
                                                    CssClass="mytextarea"></asp:TextBox>
                                                <img onclick="openUser();" alt="" src="../../Images/choose.gif" border="0">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">
                                                备注：
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" TextMode="multiLine" Rows="3"
                                                    Width="96%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item" rowspan="2">
                                                项目附件：
                                            </td>
                                            <td colspan="3">
                                                <asp:DropDownList ID="fjlb" runat="server" Width="85%">
                                                </asp:DropDownList>
                                                <img onclick="AttDown();" src="../../Images/down.gif" border="0" alt="下载附件" />
                                                <asp:ImageButton ID="AttDelBtn" runat="server" ImageUrl="../../Images/del.gif"
                                                    ToolTip="删除附件" Visible="false" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <input id="uploadFile" runat="server" style="width: 85%" type="file" name="uploadFile"
                                                    class="mytext" />
                                                <asp:ImageButton ID="uploadBtn" runat="server" OnClick="uploadBtn_Click" ImageUrl="../../Images/up.gif"
                                                    ToolTip="上传附件" Visible="false" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="kpid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
    
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="kpqs"
        ErrorMessage="请输入考评期数">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="ksrq"
        ErrorMessage="请选择开始日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="jzrq"
        ErrorMessage="请选择截止日期">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserName"
        ErrorMessage="请选择参与评委">&nbsp;
    </asp:RequiredFieldValidator>
    
    <script language="javascript">
        var wName_3;
        function openUser() {
            var num = Math.random();
            var str = "" + document.getElementById('UserID').value + "";
            var str1 = "" + document.getElementById('UserID').value + "";
            wName_3 = window.showModalDialog("../../choose/hr/ChoosePw.aspx?tmp=" + num + "&rqstr=" + str + "", "window", "dialogWidth:500px;DialogHeight=500px;status:no;scroll=yes;help:no");

            if (!wName_3)
                wName_3 = window.ReturnValue;   //for ch、ff、sf、op

            var arr = wName_3.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("UserID").value = arr[0];
                document.getElementById("UserName").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>
