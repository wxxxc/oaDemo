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
                                                                    <font face="Arial Black" color="#ff0000">W</font><font face="Arial Black">eight</font><b>����</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--Ӣ��--</option>
                                                                        <option value="0.4536" selected>��</option>
                                                                        <option value="0.02835">��˾</option>
                                                                        <option value="1016.0470">Ӣ��</option>
                                                                        <option value="907.1849">����</option>
                                                                        <option value="0.0017718">����</option>
                                                                        <option value="0.0000648">����</option>
                                                                        <option value="0.0002">����</option>
                                                                        <option value="0">--����--</option>
                                                                        <option value="50">�е�</option>
                                                                        <option value="0.5">�н�</option>
                                                                        <option value="0.05">����</option>
                                                                        <option value="0.005">��Ǯ</option>
                                                                        <option value="0.0005">����</option>
                                                                        <option value="0.00005">�к�</option>
                                                                        <option value="0.000005">��˿</option>
                                                                    </select>
                                                                    &nbsp; <font size="5">=</font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    <select size="1" name="select2">
                                                                        <option value="1" selected>����(ǧ��)</option>
                                                                        <option value="1000">��</option>
                                                                        <option value="0.001">��</option>
                                                                        <option value="100">����</option>
                                                                        <option value="10000">�ֿ�</option>
                                                                        <option value="100000">���</option>
                                                                        <option value="1000000">����</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otmw(  &#13;&#10;document.formw.textf.value,  &#13;&#10;document.formw.select1.value,  &#13;&#10;document.formw.textfm.value,  &#13;&#10;document.formw.select2.value);"
                                                                            type="button" value="����->����" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtow(document.formw.textf.value,        &#13;&#10;document.formw.select1.value,        &#13;&#10;document.formw.textfm.value,        &#13;&#10;document.formw.select2.value);"
                                                                            type="button" value="����->����" name="mto" class="font9boldwhite">
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
                                                                    <font face="Arial Black" color="#ff0000">L</font><font face="Arial Black">ength</font><b>����</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--Ӣ��--</option>
                                                                        <option value="0.0254" selected>Ӣ��</option>
                                                                        <option value="0.3048">Ӣ��</option>
                                                                        <option value="0.9144">��</option>
                                                                        <option value="1609.3">Ӣ��</option>
                                                                        <option value="0">--����--</option>
                                                                        <option value="500">����</option>
                                                                        <option value="33.3333">����</option>
                                                                        <option value="3.3333">����</option>
                                                                        <option value="0.3333">�г�</option>
                                                                        <option value="0.03333">�д�</option>
                                                                        <option value="0.003333">�з�</option>
                                                                        <option value="0.0003333">����</option>
                                                                        <option value="0.00003333">�к�</option>
                                                                    </select>
                                                                    <font size="5">=</font><font size="4"><b> </b></font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    &nbsp;
                                                                    <select size="1" name="select2">
                                                                        <option value="1" selected>��</option>
                                                                        <option value="0.001">����(ǧ��)</option>
                                                                        <option value="0.0005399568">����</option>
                                                                        <option value="10">����</option>
                                                                        <option value="100">����</option>
                                                                        <option value="1000">����</option>
                                                                        <option value="10000">˿��</option>
                                                                        <option value="100000">����</option>
                                                                        <option value="1000000">΢��</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otml(document.forml.textf.value,     &#13;&#10;document.forml.select1.value,     &#13;&#10;document.forml.textfm.value,     &#13;&#10;document.forml.select2.value);"
                                                                            type="button" value="����->����" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtol(document.forml.textf.value,                      &#13;&#10;document.forml.select1.value,                      &#13;&#10;document.forml.textfm.value,                      &#13;&#10;document.forml.select2.value);"
                                                                            type="button" value="����->����" name="mto" class="font9boldwhite">
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
                                                                    <font face="Arial Black" color="#ff0000">A</font><font face="Arial Black">rea</font><b>���</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--����--</option>
                                                                        <option value="66666.6667">����</option>
                                                                        <option value="666.6667" selected>��Ķ</option>
                                                                        <option value="66.6667">�з�</option>
                                                                        <option value="0.1111">ƽ���г�</option>
                                                                        <option value="0">--Ӣ��--</option>
                                                                        <option value="0.00064516">ƽ��Ӣ��</option>
                                                                        <option value="0.0929">ƽ��Ӣ��</option>
                                                                        <option value="0.8361">ƽ����</option>
                                                                        <option value="4046.86">ӢĶ</option>
                                                                        <option value="2590000">ƽ��Ӣ��</option>
                                                                    </select>
                                                                    <font size="5">=</font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    <font color="#cccccc">--</font>
                                                                    <select size="1" name="select2">
                                                                        <option value="0.000001" selected>ƽ������</option>
                                                                        <option value="0.0001">����</option>
                                                                        <option value="0.01">��Ķ</option>
                                                                        <option value="1">ƽ����</option>
                                                                        <option value="100">ƽ������</option>
                                                                        <option value="10000">ƽ������</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otms(document.forms.textf.value,             &#13;&#10;document.forms.select1.value,             &#13;&#10;document.forms.textfm.value,             &#13;&#10;document.forms.select2.value);"
                                                                            type="button" value="����->����" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtos(document.forms.textf.value,               &#13;&#10;document.forms.select1.value,               &#13;&#10;document.forms.textfm.value,               &#13;&#10;document.forms.select2.value);"
                                                                            type="button" value="����->����" name="mto" class="font9boldwhite">
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
                                                                    <font face="Arial Black" color="#ff0000">V</font><font face="Arial Black">olume</font><b>���</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="1" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option value="0">--Ӣ��--</option>
                                                                        <option value="0.0045461" selected>Ӣ������</option>
                                                                        <option value="0.0037854">����Һ�����</option>
                                                                        <option value="0.0044049">�����������</option>
                                                                        <option value="0.0000163871">����Ӣ��</option>
                                                                        <option value="0.0283">����Ӣ��</option>
                                                                        <option value="0.7646">������</option>
                                                                        <option value="0">--����--</option>
                                                                        <option value="0.000037">�����д�</option>
                                                                        <option value="0.037">�����г�</option>
                                                                        <option value="37">��������</option>
                                                                    </select>
                                                                    <font size="5">= </font>
                                                                    <input value="0" name="textfm" size="20" class="input">
                                                                    <select size="1" name="select2">
                                                                        <option value="1" selected>������</option>
                                                                        <option value="1000">��������</option>
                                                                        <option value="1000000">��������</option>
                                                                        <option value="1000">��</option>
                                                                        <option value="1000000">����</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="_otmv(document.formv.textf.value,             &#13;&#10;document.formv.select1.value,             &#13;&#10;document.formv.textfm.value,             &#13;&#10;document.formv.select2.value);"
                                                                            type="button" value="����->����" name="otm" class="font9boldwhite">
                                                                        <input onclick="_mtov(document.formv.textf.value,               &#13;&#10;document.formv.select1.value,               &#13;&#10;document.formv.textfm.value,               &#13;&#10;document.formv.select2.value);"
                                                                            type="button" value="����->����" name="mto" class="font9boldwhite">
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
                                                                    <font face="Arial Black" color="#ff0000">T</font><font face="Arial Black">emperature</font><b>�¶�</b>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%">
                                                                    <input value="50" name="textf" size="20" class="input">
                                                                    <select size="1" name="select1">
                                                                        <option selected>����</option>
                                                                    </select>
                                                                    <font size="5">=</font>
                                                                    <input value="10" name="textfg" size="20" class="input">
                                                                    <select size="1" name="select2">
                                                                        <option selected>����</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="50%">
                                                                    <p align="right">
                                                                        <input onclick="document.formt.textfg.value=(document.formt.textf.value-32)*5/9"
                                                                            type="button" value="����->����" name="otm" class="font9boldwhite">
                                                                        <input onclick="document.formt.textf.value=document.formt.textfg.value*9/5+32" type="button"
                                                                            value="����->����" name="mto" class="font9boldwhite">
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
                                                                        <b><font color="#FF0000" face="����">ʹ �� ˵ ��</font></b></p>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td width="100%" height="1">
                                                                    <p class="font">
                                                                        <b>1.����������λ�ƣ�&gt;���ƣ�</b><br>
                                                                        �ڵ�ʽ����������������Ǳ�׼������λ�������硰1�����ڵ�ʽ��߷Ǳ�׼������λ�����˵���ѡ��λ���硰�������ڵ�ʽ�ұ߹��Ƽ�����λ�����˵���ѡ��λ���硰��������������-&gt;���ơ���ť�����ڵ�ʽ�ұߵ�����������еõ���0.4536�����</p>
                                                                    <p class="font">
                                                                        <b>2.���ƣ�&gt;����������λ�ƣ�</b><br>
                                                                        �ڵ�ʽ�ұ�������������빫�Ƽ�����λ�������硰1�����ڵ�ʽ�ұ߹��Ƽ�����λ�����˵���ѡ��λ���硰������ڵ�ʽ��߷Ǳ�׼������λ�����˵���ѡ��λ���硰���������������-&gt;��������ť�����ڵ�ʽ��ߵ�����������еõ���2.205������</p>
                                                                    <p class="font">
                                                                        <b>3.����������λ֮�任�㣺</b><br>
                                                                        ������㡰�н�롰�����Ĺ�ϵ���ڵ�ʽ���������������롰1��������������˵�ѡ���н�������������&gt;���ơ���ť���ٴӵ�ʽ��������˵���ѡ�������������ƣ�&gt;��������ť�����õ�1�н��൱�ڡ�1.102������</p>
                                                                    <p class="font">
                                                                        <b>4.���Ƶ�λ֮�任�㣺</b><br>
                                                                        ������㡰����롰�ˡ��Ĺ�ϵ���ڵ�ʽ�ұ�������������롰1�������ұ������˵�ѡ���������������˵�ѡ���н����������Ч��λ������������ƣ�&gt;��������ť���õ���2���н�ٴ��ұ������˵���ѡ�񡰿ˡ��������������&gt;���ơ���ť�����õ�1�����൱�ڡ�1000���ˡ�</p>
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
