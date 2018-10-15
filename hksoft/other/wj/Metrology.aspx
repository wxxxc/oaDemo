<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Metrology.aspx.cs" Inherits="hkpro.other.wj.Metrology" %>

<html>
<head>
    <title></title>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script language="javascript">
        function _otmw(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.formw.textf.value = 0;
                document.formw.textfm.value = 0;
            }
            else
            { document.formw.textfm.value = _other * _p1 * _p2; }
        }
        function _mtow(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.formw.textf.value = 0;
                document.formw.textfm.value = 0;
            }
            else
            { document.formw.textf.value = (_this / (_p1 * _p2)); }
        }

        function _otml(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.forml.textf.value = 0;
                document.forml.textfm.value = 0;
            }
            else
            { document.forml.textfm.value = _other * _p1 * _p2; }
        }
        function _mtol(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.forml.textf.value = 0;
                document.forml.textfm.value = 0;
            }
            else
            { document.forml.textf.value = (_this / (_p1 * _p2)); }
        }

        function _otms(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.forms.textf.value = 0;
                document.forms.textfm.value = 0;
            }
            else
            { document.forms.textfm.value = _other * _p1 * _p2; }
        }
        function _mtos(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.forms.textf.value = 0;
                document.forms.textfm.value = 0;
            }
            else
            { document.forms.textf.value = (_this / (_p1 * _p2)); }
        }

        function _otmv(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.formv.textf.value = 0;
                document.formv.textfm.value = 0;
            }
            else
            { document.formv.textfm.value = _other * _p1 * _p2; }
        }
        function _mtov(_other, _p1, _this, _p2) {
            if ((_p1 == 0) || (_p2 == 0)) {
                document.formv.textf.value = 0;
                document.formv.textfm.value = 0;
            }
            else
            { document.formv.textf.value = (_this / (_p1 * _p2)); }
        }


    </script>
    <meta content="Microsoft FrontPage 4.0" name="GENERATOR">
</head>
<body class="main">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="height: 30px;" align="center">
                            <br />
                            <table cellspacing="0" cellpadding="0" width="610" border="0" align="center" height="588">
                                <tr>
                                    <td valign="top" width="702">
                                        <p>
                                        </p>
                                        <div>
                                            <table height="584" cellspacing="0" cellpadding="0" width="625" border="0">
                                                <tr>
                                                    <td height="88" width="625">
                                                        <table width="100%" border="1" cellspacing="0" bordercolor="#687BC4" bordercolorlight="#687BC4"
                                                            bordercolordark="#FFFFFF">
                                                            <form name="formw">
                                                            <tr class="MToolBar1">
                                                                <td>
                                                                    <font face="Arial Black" color="#ff0000">W</font><font face="Arial Black">eight</font><b>重量</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--英制--</option>
                                                                        <option value="0.4536" selected>磅</option>
                                                                        <option value="0.02835">盎司</option>
                                                                        <option value="1016.0470">英吨</option>
                                                                        <option value="907.1849">美吨</option>
                                                                        <option value="0.0017718">打兰</option>
                                                                        <option value="0.0000648">格令</option>
                                                                        <option value="0.0002">克拉</option>
                                                                        <option value="0">--市制--</option>
                                                                        <option value="50">市担</option>
                                                                        <option value="0.5">市斤</option>
                                                                        <option value="0.05">市两</option>
                                                                        <option value="0.005">市钱</option>
                                                                        <option value="0.0005">市厘</option>
                                                                        <option value="0.00005">市毫</option>
                                                                        <option value="0.000005">市丝</option>
                                                                    </select>
                                                                    &nbsp; <font size="5">=</font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    <select size="1" name="select2">
                                                                        <option value="1" selected>公斤(千克)</option>
                                                                        <option value="1000">克</option>
                                                                        <option value="0.001">吨</option>
                                                                        <option value="100">公担</option>
                                                                        <option value="10000">分克</option>
                                                                        <option value="100000">厘克</option>
                                                                        <option value="1000000">毫克</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otmw(  &#13;&#10;document.formw.textf.value,  &#13;&#10;document.formw.select1.value,  &#13;&#10;document.formw.textfm.value,  &#13;&#10;document.formw.select2.value);"
                                                                            type="button" value="其他->公制" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtow(document.formw.textf.value,        &#13;&#10;document.formw.select1.value,        &#13;&#10;document.formw.textfm.value,        &#13;&#10;document.formw.select2.value);"
                                                                            type="button" value="公制->其他" name="mto" class="font9boldwhite">
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            </form>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="82" width="625">
                                                        <br>
                                                        <table width="100%" border="1" cellspacing="0" bordercolor="#687BC4" bordercolorlight="#687BC4"
                                                            bordercolordark="#FFFFFF">
                                                            <form name="forml">
                                                            <tr>
                                                                <td class="MToolBar1">
                                                                    <font face="Arial Black" color="#ff0000">L</font><font face="Arial Black">ength</font><b>长度</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--英制--</option>
                                                                        <option value="0.0254" selected>英寸</option>
                                                                        <option value="0.3048">英尺</option>
                                                                        <option value="0.9144">码</option>
                                                                        <option value="1609.3">英里</option>
                                                                        <option value="0">--市制--</option>
                                                                        <option value="500">市里</option>
                                                                        <option value="33.3333">市引</option>
                                                                        <option value="3.3333">市丈</option>
                                                                        <option value="0.3333">市尺</option>
                                                                        <option value="0.03333">市寸</option>
                                                                        <option value="0.003333">市分</option>
                                                                        <option value="0.0003333">市厘</option>
                                                                        <option value="0.00003333">市毫</option>
                                                                    </select>
                                                                    <font size="5">=</font><font size="4"><b> </b></font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    &nbsp;
                                                                    <select size="1" name="select2">
                                                                        <option value="1" selected>米</option>
                                                                        <option value="0.001">公里(千米)</option>
                                                                        <option value="0.0005399568">海里</option>
                                                                        <option value="10">分米</option>
                                                                        <option value="100">厘米</option>
                                                                        <option value="1000">毫米</option>
                                                                        <option value="10000">丝米</option>
                                                                        <option value="100000">忽米</option>
                                                                        <option value="1000000">微米</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otml(document.forml.textf.value,     &#13;&#10;document.forml.select1.value,     &#13;&#10;document.forml.textfm.value,     &#13;&#10;document.forml.select2.value);"
                                                                            type="button" value="其他->公制" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtol(document.forml.textf.value,                      &#13;&#10;document.forml.select1.value,                      &#13;&#10;document.forml.textfm.value,                      &#13;&#10;document.forml.select2.value);"
                                                                            type="button" value="公制->其他" name="mto" class="font9boldwhite">
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            </form>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="82" width="625">
                                                        <br>
                                                        <table width="100%" border="1" cellspacing="0" bordercolor="#687BC4" bordercolorlight="#687BC4"
                                                            bordercolordark="#FFFFFF">
                                                            <form name="forms">
                                                            <tr>
                                                                <td class="MToolBar1">
                                                                    <font face="Arial Black" color="#ff0000">A</font><font face="Arial Black">rea</font><b>面积</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--市制--</option>
                                                                        <option value="66666.6667">市顷</option>
                                                                        <option value="666.6667" selected>市亩</option>
                                                                        <option value="66.6667">市分</option>
                                                                        <option value="0.1111">平方市尺</option>
                                                                        <option value="0">--英制--</option>
                                                                        <option value="0.00064516">平方英寸</option>
                                                                        <option value="0.0929">平方英尺</option>
                                                                        <option value="0.8361">平方码</option>
                                                                        <option value="4046.86">英亩</option>
                                                                        <option value="2590000">平方英里</option>
                                                                    </select>
                                                                    <font size="5">=</font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    <font color="#cccccc">--</font>
                                                                    <select size="1" name="select2">
                                                                        <option value="0.000001" selected>平方公里</option>
                                                                        <option value="0.0001">公顷</option>
                                                                        <option value="0.01">公亩</option>
                                                                        <option value="1">平方米</option>
                                                                        <option value="100">平方分米</option>
                                                                        <option value="10000">平方厘米</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otms(document.forms.textf.value,             &#13;&#10;document.forms.select1.value,             &#13;&#10;document.forms.textfm.value,             &#13;&#10;document.forms.select2.value);"
                                                                            type="button" value="其他->公制" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtos(document.forms.textf.value,               &#13;&#10;document.forms.select1.value,               &#13;&#10;document.forms.textfm.value,               &#13;&#10;document.forms.select2.value);"
                                                                            type="button" value="公制->其他" name="mto" class="font9boldwhite">
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            </form>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="82" width="625">
                                                        <br>
                                                        <table width="100%" border="1" cellspacing="0" bordercolor="#687BC4" bordercolorlight="#687BC4"
                                                            bordercolordark="#FFFFFF">
                                                            <form name="formv">
                                                            <tr>
                                                                <td class="MToolBar1">
                                                                    <font face="Arial Black" color="#ff0000">V</font><font face="Arial Black">olume</font><b>体积</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--英制--</option>
                                                                        <option value="0.0045461" selected>英国加仑</option>
                                                                        <option value="0.0037854">美国液体加仑</option>
                                                                        <option value="0.0044049">美国固体加仑</option>
                                                                        <option value="0.0000163871">立方英寸</option>
                                                                        <option value="0.0283">立方英尺</option>
                                                                        <option value="0.7646">立方码</option>
                                                                        <option value="0">--市制--</option>
                                                                        <option value="0.000037">立方市寸</option>
                                                                        <option value="0.037">立方市尺</option>
                                                                        <option value="37">立方市丈</option>
                                                                    </select>
                                                                    <font size="5">= </font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    <select size="1" name="select2">
                                                                        <option value="1" selected>立方米</option>
                                                                        <option value="1000">立方分米</option>
                                                                        <option value="1000000">立方厘米</option>
                                                                        <option value="1000">升</option>
                                                                        <option value="1000000">毫升</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otmv(document.formv.textf.value,             &#13;&#10;document.formv.select1.value,             &#13;&#10;document.formv.textfm.value,             &#13;&#10;document.formv.select2.value);"
                                                                            type="button" value="其他->公制" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtov(document.formv.textf.value,               &#13;&#10;document.formv.select1.value,               &#13;&#10;document.formv.textfm.value,               &#13;&#10;document.formv.select2.value);"
                                                                            type="button" value="公制->其他" name="mto" class="font9boldwhite">
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            </form>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="82" width="625">
                                                        <br>
                                                        <table width="100%" border="1" cellspacing="0" bordercolor="#687BC4" bordercolorlight="#687BC4"
                                                            bordercolordark="#FFFFFF">
                                                            <form name="formt">
                                                            <tr>
                                                                <td class="MToolBar1">
                                                                    <font face="Arial Black" color="#ff0000">T</font><font face="Arial Black">emperature</font><b>温度</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="50" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option selected>华氏</option>
                                                                    </select>
                                                                    <font size="5">=</font>
                                                                    <input value="10" name="textfg" size="20" class="input">
                                                                    <select size="1" name="select2">
                                                                        <option selected>摄氏</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="document.formt.textfg.value=(document.formt.textf.value-32)*5/9"
                                                                            type="button" value="华氏->摄氏" name="otm" class="font9boldwhite">
                                                                        <input onclick="document.formt.textf.value=document.formt.textfg.value*9/5+32" type="button"
                                                                            value="摄氏->华氏" name="mto" class="font9boldwhite">
                                                                    </p>
                                                                </td>
                                                            </tr>
                                                            </form>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="625">
                                                        <br>
                                                        <table width="100%" border="1" cellspacing="0" bordercolor="#687BC4" bordercolorlight="#687BC4"
                                                            bordercolordark="#FFFFFF">
                                                            <tr>
                                                                <td bgcolor="#CCCCCC" height="26" class="MToolBar1">
                                                                    <p align="center">
                                                                        <b><font color="#FF0000" face="宋体">使 用 说 明</font></b></p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="1">
                                                                    <p class="font">
                                                                        <b>1.其他计量单位制－&gt;公制：</b><br>
                                                                        在等式左边文字输入框填入非标准计量单位数量，如“1”，在等式左边非标准计量单位下拉菜单中选择单位，如“磅”；在等式右边公制计量单位下拉菜单中选择单位，如“公斤”，点击“其他-&gt;公制”按钮，即在等式右边的文字输入框中得到“0.4536”公斤。</p>
                                                                    <p class="font">
                                                                        <b>2.公制－&gt;其他计量单位制：</b><br>
                                                                        在等式右边文字输入框填入公制计量单位数量，如“1”，在等式右边公制计量单位下拉菜单中选择单位，如“公斤”；在等式左边非标准计量单位下拉菜单中选择单位，如“磅”，点击“公制-&gt;其他”按钮，即在等式左边的文字输入框中得到“2.205”磅。</p>
                                                                    <p class="font">
                                                                        <b>3.其他计量单位之间换算：</b><br>
                                                                        例如计算“市斤”与“磅”的关系。在等式左边文字输入框输入“1”，在左边下拉菜单选“市斤”，点击“其他－&gt;公制”按钮，再从等式左边下拉菜单中选择磅，点击“公制－&gt;其他”按钮，即得到1市斤相当于“1.102”磅。</p>
                                                                    <p class="font">
                                                                        <b>4.公制单位之间换算：</b><br>
                                                                        例如计算“公斤”与“克”的关系。在等式右边文字输入框输入“1”，在右边下拉菜单选“公斤”，左边下拉菜单选“市斤”（或其他有效单位），点击“公制－&gt;其他”按钮，得到“2”市斤，再从右边下拉菜单中选择“克”，点击“其他－&gt;公制”按钮，即得到1公斤相当于“1000”克。</p>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="25" width="625">
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </td>
                                    <td valign="top" width="1">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
