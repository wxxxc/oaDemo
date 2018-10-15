<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Car.aspx.cs" Inherits="hkpro.other.wj.Car" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <title>全国各地车牌查询</title>
</head>
<body class="main">
    <form id="search" runat="server" name="search" onsubmit="return findInPage(this.string.value);">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="height: 30px" align="right">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 30px;" align="center">
                            <table width="700" border="0" cellpadding="3" cellspacing="1" bgcolor="#CCCCCC">
                                <tr bgcolor="#ff9900" class="word-b">
                                    <th colspan="2" bgcolor="#316AC5">
                                        <font color="#ffffff">河北省（冀）</font>
                                    </th>
                                    <th colspan="2" bgcolor="#316AC5">
                                        <font color="#ffffff">河南省（豫）</font>
                                    </th>
                                    <th colspan="2" bgcolor="#316AC5">
                                        <font color="#ffffff">云南省（云）</font>
                                    </th>
                                </tr>
                                <tr class="word-b">
                                    <th bgcolor="#EFF8FE">
                                        牌号
                                    </th>
                                    <th bgcolor="#EFF8FE">
                                        地区
                                    </th>
                                    <th bgcolor="#E8FFE8">
                                        牌号
                                    </th>
                                    <th bgcolor="#E8FFE8">
                                        地区
                                    </th>
                                    <th bgcolor="#FFFFD9">
                                        牌号
                                    </th>
                                    <th bgcolor="#FFFFD9">
                                        地区
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        石家庄市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        郑州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        昆明市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀B
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        唐山市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        开封市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        东川市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        秦皇岛市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        洛阳市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        昭通市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        邯郸市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        平顶山市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        曲靖市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        邢台市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        安阳市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        楚雄彝族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        保定市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        鹤壁市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        玉溪市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        张家口市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        新乡市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        红河哈尼族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        承德市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        焦作市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        文山壮族苗
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        沧州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        濮阳市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        思茅市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀K
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        邯郸市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫K
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        许昌市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云K
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        西双版纳
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀L
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        邢台市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫L
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        漯河市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云L
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        大理白族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀N
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        保定市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫M
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        三门峡市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云M
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        保山市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀P
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        张家口市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫N
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        商丘市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云N
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        德宏傣族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀Q
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        承德市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫P
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        周口市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云P
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        丽江市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀R
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        廊坊市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫Q
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        驻马店市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云Q
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        怒江傈族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀S
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        沧州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫R
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        南阳市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云R
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        迪庆藏族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        冀T
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        衡水市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        豫S
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        信阳市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        云S
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        临沧市
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#ff9900">
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">辽宁省（辽）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">黑龙江省(黑)</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">湖南省（湘）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        沈阳市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        哈尔滨市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        长沙市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        大连市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑B
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        齐齐哈尔市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        株州市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鞍山市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        牡丹江市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘潭市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        抚顺市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        佳木斯市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        衡阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        本溪市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        大庆市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        邵阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        丹东市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        伊春市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        岳阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        锦州市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        鸡西市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        大庸市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        营口市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        鹤岗市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        益阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        阜新市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        双鸭山市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        常德市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽K
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        辽阳市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑K
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        七台河市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘K
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        娄底市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽L
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        盘锦市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑L
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        松花江市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘L
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        郴州市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽M
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        铁岭市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑M
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        绥化市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘M
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        零陵市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽N
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        朝阳市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑N
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑河地区行
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘N
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        杯化市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        辽P
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        葫芦岛市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        黑P
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        大兴安岭行
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘P
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湘西自治州
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#ff9900" class="word-b">
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">安徽省（皖）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">山东省（鲁）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">新疆维吾尔（新）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        合肥市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        济南市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        乌鲁木齐市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        芜湖市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        青岛市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新B
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        昌吉回族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        蚌埠市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        淄博市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        石河子市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        淮南市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        枣庄市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        奎屯市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        马鞍山市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        东营市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        博尔塔拉
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        淮北市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        烟台市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        伊犁哈萨
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        铜陵市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        潍坊市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        塔城市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        安庆市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        济宁市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        阿勒泰市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        黄山市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        泰安市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        克拉玛依市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖K
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        阜阳市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁K
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        威海市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新K
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        吐鲁番市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖L
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        宿县市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁L
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        日照市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新L
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        哈密市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖M
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        滁县市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁M
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        惠州市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新M
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        巴音郭愣
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖N
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        六安市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁N
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        德州市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新N
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        阿克苏市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖P
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        宜城市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁P
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        聊城市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新P
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        克孜勒苏柯
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖Q
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        巢湖市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁Q
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        临沂市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新Q
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        喀什市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        皖R
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        池州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁R
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        荷泽市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        新R
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        和田市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鲁S
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        莱芜市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#ff9900">
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">江苏省（苏）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">浙江省（浙）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">江西省（赣）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        南京市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        杭州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        南昌市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏B
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        无锡市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        宁波市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣州市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        徐州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        温州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        宜春市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        常州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        绍兴市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        吉安市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        苏州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        湖州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        上饶市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        南通市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        嘉兴市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        抚州市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        连云港市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        金华市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        九江市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        淮阴市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        巨州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        景德镇市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        盐城市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        台州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        萍乡市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏K
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        扬州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        浙K
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        丽水市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赣K
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        新余市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        苏L
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        镇江市
                                    </td>
                                    <td bgcolor="#E8FFE8" rowspan="3">
                                        浙L
                                    </td>
                                    <td bgcolor="#E8FFE8" rowspan="3">
                                        舟山市
                                    </td>
                                    <td bgcolor="#FFFFD9" rowspan="3">
                                        赣L
                                    </td>
                                    <td bgcolor="#FFFFD9" rowspan="3">
                                        鹰潭市
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td bgcolor="#EFF8FE">
                                        苏M
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        泰州
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td bgcolor="#EFF8FE">
                                        苏N
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        宿迁
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#ff9900">
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">湖北省（鄂）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">广西壮族（桂）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">甘肃省（甘）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        武汉市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        南宁市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        兰州市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        黄石市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂B
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        柳州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        嘉峪关市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        十堰市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂林市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        金昌市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        沙市市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        梧州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        白银市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        宜昌市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        北海市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        天水市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        襄樊市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        南宁市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        洒泉市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鄂州市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        柳州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        张掖市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        荆门市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂林市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        武威市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        黄岗市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        梧州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        定西市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂K
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        孝感市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂K
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        玉林市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘K
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        陇南市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂L
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        咸宁市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂L
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        河池市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘L
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        平凉市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂M
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        荆州市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂M
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        百色市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘M
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        庆阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂N
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        郧阳市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂N
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        钦州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘N
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        临夏回族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂P
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        宜昌市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        桂P
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        防城港区
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘P
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        甘南藏族
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        鄂Q
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        鄂西自治州
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#ff9900">
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">山西省（晋）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">内蒙古（蒙）</font>
                                    </th>
                                    <th colspan="2" height="20" bgcolor="#316AC5">
                                        <font color="#ffffff">陕西省（陕）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        太原市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        呼和浩特市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        西安市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        大同市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        包头市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕B
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        铜川市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        阳泉市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        乌海市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        宝鸡市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        长治市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        赤峰市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        威阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        晋城市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        呼和浩特市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        渭南市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        朔州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        兴安盟
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        汉中市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        雁北市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        锡林郭勒盟
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        安康市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        忻州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        乌兰察布盟
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        延安市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        吕梁市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        伊克昭盟
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        商洛市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋K
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        晋中市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙K
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        巴彦淖尔盟
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        陕K
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        榆林市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋L
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        临汾市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        蒙L
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        阿拉善盟
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        晋M
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        运城市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#009999">
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">吉林省（吉）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">福建省（闽）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">贵州省（贵）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        长春市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        福州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵阳市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE" height="24">
                                        吉B
                                    </td>
                                    <td bgcolor="#EFF8FE" height="24">
                                        吉林市
                                    </td>
                                    <td bgcolor="#E8FFE8" height="24">
                                        闽B
                                    </td>
                                    <td bgcolor="#E8FFE8" height="24">
                                        莆田市
                                    </td>
                                    <td bgcolor="#FFFFD9" height="24">
                                        贵B
                                    </td>
                                    <td bgcolor="#FFFFD9" height="24">
                                        六盘水市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        四平市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        泉州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        遵义市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        辽源市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        厦门市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        铜仁市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        通化市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        漳州市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        黔西南州
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        浑江市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        龙岩市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        毕节市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        白城市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        三明市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        安顺市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                        吉H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        延边朝鲜族
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        南平市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        黔东南州
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        闽J
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        宁德市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        贵J
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        黔南州
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#009999">
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">广东省（粤）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">四川省（川）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">青海省（青）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤A
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        广州市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川A
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        成都市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青A
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        西宁市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤B
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        深圳市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川C
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        自贡市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青B
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        海东市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤C
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        珠海市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川D
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        攀枝花市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青C
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        海北州
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤D
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        汕头市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川E
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        泸州市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青D
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        黄南市
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤E
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        佛山市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川F
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        德阳市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青E
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        海南州
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤F
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        韶关市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川G
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        绵阳市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青F
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        果洛州
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤G
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        湛江市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川H
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        广元市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青G
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        玉树州
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#FFFFD9">
                                        粤H
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        肇庆市
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        川J
                                    </td>
                                    <td bgcolor="#EFF8FE">
                                        遂宁市
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        青H
                                    </td>
                                    <td bgcolor="#E8FFE8">
                                        海西州
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤J
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        江门市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川K
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        内江市
                                    </td>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">西藏（藏）</font>
                                    </th>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤K
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        茂名市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川L
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        乐山市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏A
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        拉萨市
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤L
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        惠州市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川M
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        万县市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏B
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        昌都
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤M
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        梅州市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川N
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        涪陵市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏C
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        山南
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤N
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        汕尾市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川P
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        黔江市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏D
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        日喀则
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤P
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        河源市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川Q
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        宜宾市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏E
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        那曲
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤Q
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        阳江市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川R
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        南充市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏F
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        阿里
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤R
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        清远市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川S
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        达县市
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        藏G
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        林芝
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤S
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        东莞市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川T
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        雅安市
                                    </td>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">海南省（琼）</font>
                                    </th>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤T
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        中山市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川U
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        阿坝藏族
                                    </td>
                                    <td class="word-b" bgcolor="#E8FFE8">
                                        琼A
                                    </td>
                                    <td class="word-b" bgcolor="#E8FFE8">
                                        海口市
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤U
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        潮州市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川V
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        甘孜藏族
                                    </td>
                                    <td class="word-b" bgcolor="#E8FFE8">
                                        琼B
                                    </td>
                                    <td class="word-b" bgcolor="#E8FFE8">
                                        三亚市
                                    </td>
                                </tr>
                                <tr align="middle">
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        粤V
                                    </td>
                                    <td class="word-b" bgcolor="#FFFFD9">
                                        揭阳市
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        川W
                                    </td>
                                    <td class="word-b" bgcolor="#EFF8FE">
                                        凉山彝族
                                    </td>
                                    <td class="word-b" bgcolor="#E8FFE8">
                                        琼C
                                    </td>
                                    <td class="word-b" bgcolor="#E8FFE8">
                                        琼北市
                                    </td>
                                </tr>
                                <tr align="middle" bgcolor="#009999">
                                    <th bgcolor="#316AC5" colspan="3" height="20">
                                        <font color="#ffffff">宁夏回族（宁）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="3" height="20">
                                        <font color="#ffffff">重庆市（渝）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        宁A
                                    </td>
                                    <td colspan="2" bgcolor="#E8FFE8">
                                        银川市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        渝A
                                    </td>
                                    <td colspan="2" bgcolor="#FFFFD9">
                                        重庆市区（江南）
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        宁B
                                    </td>
                                    <td colspan="2" bgcolor="#E8FFE8">
                                        石嘴山市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        渝B
                                    </td>
                                    <td colspan="2" bgcolor="#FFFFD9">
                                        重庆市区（江北）
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        宁C
                                    </td>
                                    <td colspan="2" bgcolor="#E8FFE8">
                                        银南市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        渝C
                                    </td>
                                    <td colspan="2" bgcolor="#FFFFD9">
                                        永川区
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                        宁D
                                    </td>
                                    <td colspan="2" bgcolor="#E8FFE8">
                                        固原市
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        渝F
                                    </td>
                                    <td colspan="2" bgcolor="#FFFFD9">
                                        万州区
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                    </td>
                                    <td colspan="2" bgcolor="#E8FFE8">
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        渝G
                                    </td>
                                    <td colspan="2" bgcolor="#FFFFD9">
                                        涪陵区
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td bgcolor="#E8FFE8">
                                    </td>
                                    <td colspan="2" bgcolor="#E8FFE8">
                                    </td>
                                    <td bgcolor="#FFFFD9">
                                        渝H
                                    </td>
                                    <td colspan="2" bgcolor="#FFFFD9">
                                        黔江区
                                    </td>
                                </tr>
                            </table>
                            <table width="700" border="0" cellpadding="3" cellspacing="1" bgcolor="#cccccc" id="table1">
                                <tr align="middle" bgcolor="#009999">
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">北京市（京）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#FFFFFF">天津</font><font color="#ffffff">市（ 津）</font>
                                    </th>
                                    <th bgcolor="#316AC5" colspan="2" height="20">
                                        <font color="#ffffff">上海市（沪）</font>
                                    </th>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td width="68" bgcolor="#FFFFD9">
                                        京A
                                    </td>
                                    <td width="157" bgcolor="#FFFFD9">
                                        北京市
                                    </td>
                                    <td width="84" bgcolor="#EFF8FE">
                                        津A
                                    </td>
                                    <td width="168" bgcolor="#EFF8FE">
                                        <font color="#000000">天津市</font>
                                    </td>
                                    <td width="95" bgcolor="#E8FFE8">
                                        <font color="#000000">沪A</font>
                                    </td>
                                    <td width="184" bgcolor="#E8FFE8">
                                        <font color="#000000">上海市</font>
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td width="68" bgcolor="#FFFFD9">
                                        京B
                                    </td>
                                    <td width="157" bgcolor="#FFFFD9">
                                        北京市
                                    </td>
                                    <td width="84" bgcolor="#EFF8FE">
                                        津C
                                    </td>
                                    <td width="168" bgcolor="#EFF8FE">
                                        <font color="#000000">天津市</font>
                                    </td>
                                    <td width="95" bgcolor="#E8FFE8">
                                        <font color="#000000">沪B</font>
                                    </td>
                                    <td width="184" bgcolor="#E8FFE8">
                                        <font color="#000000">上海市</font>
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td width="68" bgcolor="#FFFFD9">
                                        京C
                                    </td>
                                    <td width="157" bgcolor="#FFFFD9">
                                        北京市
                                    </td>
                                    <td width="84" bgcolor="#EFF8FE">
                                        津D
                                    </td>
                                    <td width="168" bgcolor="#EFF8FE">
                                        <font color="#000000">天津市</font>
                                    </td>
                                    <td width="95" bgcolor="#E8FFE8">
                                        <font color="#000000">沪C</font>
                                    </td>
                                    <td width="184" bgcolor="#E8FFE8">
                                        <font color="#000000">上海市</font>
                                    </td>
                                </tr>
                                <tr align="middle" class="word-b">
                                    <td width="68" bgcolor="#FFFFD9">
                                        京D
                                    </td>
                                    <td width="157" bgcolor="#FFFFD9">
                                        北京市
                                    </td>
                                    <td width="84" bgcolor="#EFF8FE">
                                        津E
                                    </td>
                                    <td width="168" bgcolor="#EFF8FE">
                                        <font color="#000000">天津市</font>
                                    </td>
                                    <td width="95" bgcolor="#E8FFE8">
                                        <font color="#000000">沪D</font>
                                    </td>
                                    <td width="184" bgcolor="#E8FFE8">
                                        <font color="#000000">上海市</font>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
