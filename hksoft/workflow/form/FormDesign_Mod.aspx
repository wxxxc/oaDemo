<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign_Mod.aspx.cs"
    Inherits="hkpro.workflow.form.FormDesign_Mod" ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
    function SetForm(str) {
        var ue = UE.getEditor("editor");//实例化编辑器
        var littleproduct = document.getElementById("FormColumn");
        var cindex = littleproduct.selectedIndex;
        var cValue = littleproduct.options[cindex].value;

        UE.getEditor('editor').focus();
        //常规控件
        if (str == "1") {
            UE.getEditor('editor').focus();
            ue.execCommand('insertHtml', '<input id="Text1"  name="' + cValue + '"  type="text"  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        if (str == "2") {
            //UE.getEditor('editor').focus();
            ue.execCommand('insertHtml', '<textarea id="TextArea1" name="' + cValue + '"   cols="20" rows="2"  style="SCROLLBAR-FACE-COLOR:   #AAAAAA;   SCROLLBAR-HIGHLIGHT-COLOR:   #D8D8D8;  SCROLLBAR-SHADOW-COLOR:   #D8D8D8;   SCROLLBAR-3DLIGHT-COLOR:   #D8D8D8;   SCROLLBAR-ARROW-COLOR:   #D8D8D8;   SCROLLBAR-TRACK-COLOR:   #D8D8D8;   SCROLLBAR-DARKSHADOW-COLOR:   #D8D8D8; border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000 " ></textarea>');
        }

        if (str == "3") {
            //UE.getEditor('editor').focus();
            ue.execCommand('insertHtml', '<input id="Checkbox1"  name="' + cValue + '"   type="checkbox"  />');
        }

        if (str == "12") {
            ue.execCommand('insertHtml', '<input id="Text1"  name="' + cValue + '"  type="text"  style="IME-MODE: disabled;border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"  onkeypress="var k=event.keyCode; return (k>=48&&k<=57)||k==46" onpaste="return !/\D/.test(clipboardData.getData(\'text\'))"  ondragenter="return false"/>');
        }

        if (str == "13") {
            var num = Math.random();
            ue.execCommand('insertHtml', '<input id="' + num + '" name="' + cValue + '"  type="text" onclick="SelectDate(this,\'yyyy-MM-dd\')"  value=""  style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        //宏控件
        if (str == "4") {
            ue.execCommand('insertHtml', '<input readonly id="Text2" name="' + cValue + '"  type="text" value="宏控件-用户姓名" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        if (str == "5") {
            ue.execCommand('insertHtml', '<input readonly id="Text2" name="' + cValue + '"  type="text" value="宏控件-用户部门" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        if (str == "6") {
            ue.execCommand('insertHtml', '<input readonly id="Text2"  name="' + cValue + '"   type="text" value="宏控件-用户角色" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        if (str == "7") {
            ue.execCommand('insertHtml', '<input readonly id="Text2"  name="' + cValue + '"  type="text" value="宏控件-用户职位" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        if (str == "8") {
            ue.execCommand('insertHtml', '<input readonly id="Text2"  name="' + cValue + '"  type="text" value="宏控件-当前日期" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>');
        }

        if (str == "18") {
            var num = Math.random();
            window.open("FormDesign_Add_ct.aspx?tmp=" + num + "&Number=" + cValue + "", "_blank", "height=400px, width=400px,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
        }
    }

    function AddColumn() {
        var num = Math.random();
        var str = "" + document.getElementById('Number').value + "";

        //browser
        var bstr = getBrowserType();
        if (bstr == '3' | bstr == '4' | bstr == '5') {
            window.open("FormDesign_Add_cladd.aspx?tmp=" + num + "&Number=" + str + "", 'window', 'height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
        }
        else {
            window.showModalDialog("FormDesign_Add_cladd.aspx?tmp=" + num + "&Number=" + str + "", "window", "dialogWidth:450px;DialogHeight=200px;status:no;scroll=yes;help:no");
        }
    }

    function ModColumn() {
        var num = Math.random();
        var littleproduct = document.getElementById("FormColumn");
        var cindex = littleproduct.selectedIndex;
        var cText = littleproduct.options[cindex].text;
        var cValue = littleproduct.options[cindex].value;
        if (cText == "常规表单字段") {
            alert('【常规表单字段】不能修改');
            return false;
        }
        else {
            var str = "" + cValue + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("FormDesign_Add_clmod.aspx?tmp=" + num + "&Number=" + str + "", 'window', 'height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
            }
            else {
                window.showModalDialog("FormDesign_Add_clmod.aspx?tmp=" + num + "&Number=" + str + "", "window", "dialogWidth:450px;DialogHeight=200px;status:no;scroll=yes;help:no");
            }
        }
    }

    function DelColumn() {
        var num = Math.random();
        var littleproduct = document.getElementById("FormColumn");
        var cindex = littleproduct.selectedIndex;
        var cText = littleproduct.options[cindex].text;
        var cValue = littleproduct.options[cindex].value;
        if (cText == "常规表单字段") {
            alert('【常规表单字段】不能删除');
            return false;
        }
        else {
            if (!confirm("您确定要删除“" + cText + "”字段吗？"))
                return false;
            var str = "" + cValue + "";

            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.open("FormDesign_Add_cldel.aspx?tmp=" + num + "&Number=" + str + "", 'window', 'height=200,width=450,top=150,left=300,toolbar=no,menubar=no,scrollbars=yes, resizable=yes,location=no, status=no');
            }
            else {
                window.showModalDialog("FormDesign_Add_cldel.aspx?tmp=" + num + "&Number=" + str + "", "window", "dialogWidth:450px;DialogHeight=200px;status:no;scroll=yes;help:no");
            }
        }
    }

    function OpenDplist() {
        var littleproduct = document.getElementById("FormColumn");
        var cindex = littleproduct.selectedIndex;
        var cValue = littleproduct.options[cindex].value;

        var num = Math.random();
        var str = document.getElementById("Number").value;
        window.open("FormDesign_Add_dp.aspx?tmp=" + num + "&Number=" + str + "&cValue=" + cValue + "", "_blank", "height=400px, width=400px,toolbar=no, menubar=no, scrollbars=yes,resizable=yes,location=no, status=no")
    }

    function hkTemplate(str) {
        var ue = UE.getEditor("editor");
        ue.execCommand('insertHtml', '' + str + '');
    }

    function OpenSeal() {
        var num = Math.random();
        var ue = UE.getEditor("editor");
        var littleproduct = document.getElementById("FormColumn");
        var cindex = littleproduct.selectedIndex;
        var cText = littleproduct.options[cindex].text;
        var cValue = littleproduct.options[cindex].value;

        if (cText == "常规表单字段") {
            alert('请先选择字段再插入印章域');
            form1.FormColumn.focus();
            return false;
        }
        ue.execCommand('insertHtml', '<img id="' + num + '" style="cursor: hand"  name="' + num + '" onclick="OpenSetSeal(' + num + ',' + cValue + ')" src="../../Images/flow/seal.gif" />');
    }
</script>
<head id="Head1" runat="server">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>表单设计</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" width="80%" height="25px">自定义设计表单 - 修改表单
                </td>
                <td class="td_base" width="20%"></td>
            </tr>
            <tr>
                <td colspan="2" valign="top" align="center">
                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%" class="form">
                        <tr>
                            <td width="20%" class="form-item">
                                <font color="red">*</font>表单类别：
                            </td>
                            <td width="80%">
                                <asp:DropDownList ID="FormType" runat="server" Width="90%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">
                                <font color="red">*</font>表单名称：
                            </td>
                            <td>
                                <asp:TextBox ID="FormName" runat="server" Width="90%" MaxLength="10" ToolTip="最多输入10个字符"
                                    CssClass="mytext"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="form-item">用户范围：<br />
                                <asp:Label ID="Label1" runat="server" Text="(默认为空即代表全部用户)" ForeColor="Red"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" Height="55px" TextMode="MultiLine" Width="90%"
                                    CssClass="mytextarea"></asp:TextBox>
                                <img onclick="chooseuser_m();" alt="" src="../../Images/choose.gif" border="0">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 10" colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="10%" height="25px" align="right">字段名：
                            </td>
                            <td width="90%">
                                <asp:DropDownList ID="FormColumn" runat="server" Width="150px">
                                </asp:DropDownList>
                                <img alt="" onclick="javascript:popHelp('../../Help/flow/FormColumn.htm');" src="../../Images/help.gif"
                                    border="0">
                                <asp:LinkButton ID="LBtn_Add" runat="server" CssClass="gvlink">[增加字段]</asp:LinkButton>
                                <asp:LinkButton ID="LBtn_Mod" runat="server" CssClass="gvlink">[修改字段]</asp:LinkButton>
                                <asp:LinkButton ID="LBtn_Del" runat="server" CssClass="gvlink">[删除字段]</asp:LinkButton>
                                <font color="red">&nbsp;(注:建议用支持IE内核的浏览器维护表单的字段信息)</font>
                            </td>
                        </tr>
                        <tr>
                            <td height="25px" align="right">标准控件：
                            </td>
                            <td>
                                <input id="Button2" onclick="SetForm(1)" style="width: 100px" type="button" value="插入常规输入框"
                                    class="mybtn" />
                                <input id="Button14" onclick="SetForm(12)" style="width: 100px" type="button" value="插入数字输入框"
                                    class="mybtn" />
                                <input id="Button4" onclick="SetForm(2)" style="width: 100px" type="button" value="插入文本输入框"
                                    class="mybtn" />
                                <input id="Button15" onclick="SetForm(13)" style="width: 100px" type="button" value="插入日期选择"
                                    class="mybtn" />
                                <input id="Button5" onclick="SetForm(3)" style="width: 100px" type="button" value="插入复选框"
                                    class="mybtn" />
                                <input id="Button12" onclick="OpenDplist()" style="width: 100px" type="button" value="插入下拉列表"
                                    class="mybtn" />
                                <input id="Button16" onclick="OpenSeal()" style="width: 100px" type="button" value="插入印章域"
                                    class="mybtn" />
                            </td>
                        </tr>
                        <tr>
                            <td height="25px" align="right">宏控件：
                            </td>
                            <td>
                                <input id="Button10" onclick="SetForm(18)" style="width: 100px" type="button" value="自定义宏控件"
                                    class="mybtn" />
                                <input id="Button6" onclick="SetForm(4)" style="width: 100px" type="button" value="插入用户姓名"
                                    class="mybtn" />
                                <input id="Button7" onclick="SetForm(5)" style="width: 100px" type="button" value="插入用户部门"
                                    class="mybtn" />
                                <input id="Button8" onclick="SetForm(6)" style="width: 100px" type="button" value="插入用户角色"
                                    class="mybtn" />
                                <input id="Button9" onclick="SetForm(7)" style="width: 100px" type="button" value="插入用户职位"
                                    class="mybtn" />
                                <input id="Button11" onclick="SetForm(8)" style="width: 100px" type="button" value="插入当前日期"
                                    class="mybtn" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 100%; height: 160px;"></textarea>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2" height="30">
                    <asp:Button ID="SaveBtn" runat="server" Text=" 确定 " CssClass="btn btn-primary" OnClick="SaveBtn_Click" />
                    <input id="CloseBtn" class="btn btn-danger" type="button" value=" 关闭 " onclick="javascript: window.close()" />
                </td>
            </tr>
        </table>
        <asp:TextBox ID="Number" runat="server" Style="display: none"></asp:TextBox>
        <asp:TextBox ID="UserID" runat="server" Style="display: none"></asp:TextBox>
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FormType"
            ErrorMessage="请选择表单类别">&nbsp;
        </asp:RequiredFieldValidator>
        <script language="javascript">
            var uIdName;
            function chooseuser_m() {
                var num = Math.random();
                var str = "" + document.getElementById('UserID').value + "";

                //browser
                var bstr = getBrowserType();
                if (bstr == '3' | bstr == '4' | bstr == '5') {
                    window.open("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", 'newwindow', 'height=520,width=650,top=150,left=300,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
                }
                else {
                    uIdName = window.showModalDialog("../../Choose/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", "newwindow", "dialogWidth:650px;DialogHeight=520px;status:no;scroll=no;help:no");
                }

                var arr = uIdName.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }

            function setValue(str) {
                var arr = str.split("|");
                for (var i = 0; i < arr.length; i++) {
                    document.getElementById("UserID").value = arr[0];
                    document.getElementById("UserName").value = arr[1];
                }
            }
        </script>
        <script type="text/javascript">
            var ue = UE.getEditor('editor');
        </script>
    </form>
</body>
</html>
