<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Jsq.aspx.cs" Inherits="hkpro.other.wj.Jsq" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <title>科学型计算器</title>
    <style type="text/css">
        <!
        -- BODY
        {
            font-size: 12px;
            background-color: #d4d4d4;
            color: #0001fC;
            background-attachment: fixed;
        }
        td
        {
            font-size: 12px;
            font-color: #000000;
        }
         //
        -- ></style>
    <script type="text/javascript">
<!--
        var endNumber = true
        var mem = 0
        var carry = 10
        var hexnum = "0123456789abcdef"
        var angle = "d"
        var stack = ""
        var level = "0"
        var layer = 0


        //数字键

        function inputkey(key) {
            var index = key.charCodeAt(0);
            if ((carry == 2 && (index == 48 || index == 49))
|| (carry == 8 && index >= 48 && index <= 55)
|| (carry == 10 && (index >= 48 && index <= 57 || index == 46))
|| (carry == 16 && ((index >= 48 && index <= 57) || (index >= 97 && index <= 102))))
                if (endNumber) {
                    endNumber = false
                    document.calc.display.value = key
                }
                else if (document.calc.display.value == null || document.calc.display.value == "0")
                    document.calc.display.value = key
                else
                    document.calc.display.value += key
            }

            function changeSign() {
                if (document.calc.display.value != "0")
                    if (document.calc.display.value.substr(0, 1) == "-")
                        document.calc.display.value = document.calc.display.value.substr(1)
                    else
                        document.calc.display.value = "-" + document.calc.display.value
                }

                //函数键

                function inputfunction(fun, shiftfun) {
                    endNumber = true
                    if (document.calc.shiftf.checked)
                        document.calc.display.value = decto(funcalc(shiftfun, (todec(document.calc.display.value, carry))), carry)
                    else
                        document.calc.display.value = decto(funcalc(fun, (todec(document.calc.display.value, carry))), carry)
                    document.calc.shiftf.checked = false
                    document.calc.hypf.checked = false
                    inputshift()
                }

                function inputtrig(trig, arctrig, hyp, archyp) {
                    if (document.calc.hypf.checked)
                        inputfunction(hyp, archyp)
                    else
                        inputfunction(trig, arctrig)
                }


                //运算符

                function operation(join, newlevel) {
                    endNumber = true
                    var temp = stack.substr(stack.lastIndexOf("(") + 1) + document.calc.display.value
                    while (newlevel != 0 && (newlevel <= (level.charAt(level.length - 1)))) {
                        temp = parse(temp)
                        level = level.slice(0, -1)
                    }
                    if (temp.match(/^(.*\d[\+\-\*\/\%\^\&\|x])?([+-]?[0-9a-f\.]+)$/))
                        document.calc.display.value = RegExp.$2
                    stack = stack.substr(0, stack.lastIndexOf("(") + 1) + temp + join
                    document.calc.operator.value = " " + join + " "
                    level = level + newlevel

                }

                //括号

                function addbracket() {
                    endNumber = true
                    document.calc.display.value = 0
                    stack = stack + "("
                    document.calc.operator.value = "   "
                    level = level + 0

                    layer += 1
                    document.calc.bracket.value = "(=" + layer
                }

                function disbracket() {
                    endNumber = true
                    var temp = stack.substr(stack.lastIndexOf("(") + 1) + document.calc.display.value
                    while ((level.charAt(level.length - 1)) > 0) {
                        temp = parse(temp)
                        level = level.slice(0, -1)
                    }

                    document.calc.display.value = temp
                    stack = stack.substr(0, stack.lastIndexOf("("))
                    document.calc.operator.value = "   "
                    level = level.slice(0, -1)

                    layer -= 1
                    if (layer > 0)
                        document.calc.bracket.value = "(=" + layer
                    else
                        document.calc.bracket.value = ""
                }

                //等号

                function result() {
                    endNumber = true
                    while (layer > 0)
                        disbracket()
                    var temp = stack + document.calc.display.value
                    while ((level.charAt(level.length - 1)) > 0) {
                        temp = parse(temp)
                        level = level.slice(0, -1)
                    }

                    document.calc.display.value = temp
                    document.calc.bracket.value = ""
                    document.calc.operator.value = ""
                    stack = ""
                    level = "0"
                }


                //修改键

                function backspace() {
                    if (!endNumber) {
                        if (document.calc.display.value.length > 1)
                            document.calc.display.value = document.calc.display.value.substring(0, document.calc.display.value.length - 1)
                        else
                            document.calc.display.value = 0
                    }
                }

                function clearall() {
                    document.calc.display.value = 0
                    endNumber = true
                    stack = ""
                    level = "0"
                    layer = ""
                    document.calc.operator.value = ""
                    document.calc.bracket.value = ""
                }


                //转换键

                function inputChangCarry(newcarry) {
                    endNumber = true
                    document.calc.display.value = (decto(todec(document.calc.display.value, carry), newcarry))
                    carry = newcarry

                    document.calc.sin.disabled = (carry != 10)
                    document.calc.cos.disabled = (carry != 10)
                    document.calc.tan.disabled = (carry != 10)
                    document.calc.bt.disabled = (carry != 10)
                    document.calc.pi.disabled = (carry != 10)
                    document.calc.e.disabled = (carry != 10)
                    document.calc.kp.disabled = (carry != 10)

                    document.calc.k2.disabled = (carry <= 2)
                    document.calc.k3.disabled = (carry <= 2)
                    document.calc.k4.disabled = (carry <= 2)
                    document.calc.k5.disabled = (carry <= 2)
                    document.calc.k6.disabled = (carry <= 2)
                    document.calc.k7.disabled = (carry <= 2)
                    document.calc.k8.disabled = (carry <= 8)
                    document.calc.k9.disabled = (carry <= 8)
                    document.calc.ka.disabled = (carry <= 10)
                    document.calc.kb.disabled = (carry <= 10)
                    document.calc.kc.disabled = (carry <= 10)
                    document.calc.kd.disabled = (carry <= 10)
                    document.calc.ke.disabled = (carry <= 10)
                    document.calc.kf.disabled = (carry <= 10)



                }

                function inputChangAngle(angletype) {
                    endNumber = true
                    angle = angletype
                    if (angle == "d")
                        document.calc.display.value = radiansToDegress(document.calc.display.value)
                    else
                        document.calc.display.value = degressToRadians(document.calc.display.value)
                    endNumber = true
                }

                function inputshift() {
                    if (document.calc.shiftf.checked) {
                        document.calc.bt.value = "deg "
                        document.calc.ln.value = "exp "
                        document.calc.log.value = "expd"

                        if (document.calc.hypf.checked) {
                            document.calc.sin.value = "ahs "
                            document.calc.cos.value = "ahc "
                            document.calc.tan.value = "aht "
                        }
                        else {
                            document.calc.sin.value = "asin"
                            document.calc.cos.value = "acos"
                            document.calc.tan.value = "atan"
                        }

                        document.calc.sqr.value = "x^.5"
                        document.calc.cube.value = "x^.3"

                        document.calc.floor.value = "小数"
                    }
                    else {
                        document.calc.bt.value = "d.ms"
                        document.calc.ln.value = " ln "
                        document.calc.log.value = "log "

                        if (document.calc.hypf.checked) {
                            document.calc.sin.value = "hsin"
                            document.calc.cos.value = "hcos"
                            document.calc.tan.value = "htan"
                        }
                        else {
                            document.calc.sin.value = "sin "
                            document.calc.cos.value = "cos "
                            document.calc.tan.value = "tan "
                        }

                        document.calc.sqr.value = "x^2 "
                        document.calc.cube.value = "x^3 "

                        document.calc.floor.value = "取整"
                    }

                }
                //存储器部分

                function clearmemory() {
                    mem = 0
                    document.calc.memory.value = "   "
                }

                function getmemory() {
                    endNumber = true
                    document.calc.display.value = decto(mem, carry)
                }

                function putmemory() {
                    endNumber = true
                    if (document.calc.display.value != 0) {
                        mem = todec(document.calc.display.value, carry)
                        document.calc.memory.value = " M "
                    }
                    else
                        document.calc.memory.value = "   "
                }

                function addmemory() {
                    endNumber = true
                    mem = parseFloat(mem) + parseFloat(todec(document.calc.display.value, carry))
                    if (mem == 0)
                        document.calc.memory.value = "   "
                    else
                        document.calc.memory.value = " M "
                }

                function multimemory() {
                    endNumber = true
                    mem = parseFloat(mem) * parseFloat(todec(document.calc.display.value, carry))
                    if (mem == 0)
                        document.calc.memory.value = "   "
                    else
                        document.calc.memory.value = " M "
                }

                //十进制转换

                function todec(num, oldcarry) {
                    if (oldcarry == 10 || num == 0) return (num)
                    var neg = (num.charAt(0) == "-")
                    if (neg) num = num.substr(1)
                    var newnum = 0
                    for (var index = 1; index <= num.length; index++)
                        newnum = newnum * oldcarry + hexnum.indexOf(num.charAt(index - 1))
                    if (neg)
                        newnum = -newnum
                    return (newnum)
                }

                function decto(num, newcarry) {
                    var neg = (num < 0)
                    if (newcarry == 10 || num == 0) return (num)
                    num = "" + Math.abs(num)
                    var newnum = ""
                    while (num != 0) {
                        newnum = hexnum.charAt(num % newcarry) + newnum
                        num = Math.floor(num / newcarry)
                    }
                    if (neg)
                        newnum = "-" + newnum
                    return (newnum)
                }

                //表达式解析

                function parse(string) {
                    if (string.match(/^(.*\d[\+\-\*\/\%\^\&\|x\<])?([+-]?[0-9a-f\.]+)([\+\-\*\/\%\^\&\|x\<])([+-]?[0-9a-f\.]+)$/))
                        return (RegExp.$1 + cypher(RegExp.$2, RegExp.$3, RegExp.$4))
                    else
                        return (string)
                }

                //数学运算和位运算

                function cypher(left, join, right) {
                    left = todec(left, carry)
                    right = todec(right, carry)
                    if (join == "+")
                        return (decto(parseFloat(left) + parseFloat(right), carry))
                    if (join == "-")
                        return (decto(left - right, carry))
                    if (join == "*")
                        return (decto(left * right, carry))
                    if (join == "/" && right != 0)
                        return (decto(left / right, carry))
                    if (join == "%")
                        return (decto(left % right, carry))
                    if (join == "&")
                        return (decto(left & right, carry))
                    if (join == "|")
                        return (decto(left | right, carry))
                    if (join == "^")
                        return (decto(Math.pow(left, right), carry))
                    if (join == "x")
                        return (decto(left ^ right, carry))
                    if (join == "<")
                        return (decto(left << right, carry))
                    alert("除数不能为零")
                    return (left)
                }

                //函数计算

                function funcalc(fun, num) {
                    with (Math) {
                        if (fun == "pi")
                            return (PI)
                        if (fun == "e")
                            return (E)

                        if (fun == "abs")
                            return (abs(num))
                        if (fun == "ceil")
                            return (ceil(num))
                        if (fun == "round")
                            return (round(num))

                        if (fun == "floor")
                            return (floor(num))
                        if (fun == "deci")
                            return (num - floor(num))


                        if (fun == "ln" && num > 0)
                            return (log(num))
                        if (fun == "exp")
                            return (exp(num))
                        if (fun == "log" && num > 0)
                            return (log(num) * LOG10E)
                        if (fun == "expdec")
                            return (pow(10, num))


                        if (fun == "cube")
                            return (num * num * num)
                        if (fun == "cubt")
                            return (pow(num, 1 / 3))
                        if (fun == "sqr")
                            return (num * num)
                        if (fun == "sqrt" && num >= 0)
                            return (sqrt(num))

                        if (fun == "!")
                            return (factorial(num))

                        if (fun == "recip" && num != 0)
                            return (1 / num)

                        if (fun == "dms")
                            return (dms(num))
                        if (fun == "deg")
                            return (deg(num))

                        if (fun == "~")
                            return (~num)

                        if (angle == "d") {
                            if (fun == "sin")
                                return (sin(degressToRadians(num)))
                            if (fun == "cos")
                                return (cos(degressToRadians(num)))
                            if (fun == "tan")
                                return (tan(degressToRadians(num)))

                            if (fun == "arcsin" && abs(num) <= 1)
                                return (radiansToDegress(asin(num)))
                            if (fun == "arccos" && abs(num) <= 1)
                                return (radiansToDegress(acos(num)))
                            if (fun == "arctan")
                                return (radiansToDegress(atan(num)))
                        }
                        else {
                            if (fun == "sin")
                                return (sin(num))
                            if (fun == "cos")
                                return (cos(num))
                            if (fun == "tan")
                                return (tan(num))

                            if (fun == "arcsin" && abs(num) <= 1)
                                return (asin(num))
                            if (fun == "arccos" && abs(num) <= 1)
                                return (acos(num))
                            if (fun == "arctan")
                                return (atan(num))
                        }

                        if (fun == "hypsin")
                            return ((exp(num) - exp(0 - num)) * 0.5)
                        if (fun == "hypcos")
                            return ((exp(num) + exp(-num)) * 0.5)
                        if (fun == "hyptan")
                            return ((exp(num) - exp(-num)) / (exp(num) + exp(-num)))

                        if (fun == "ahypsin" | fun == "hypcos" | fun == "hyptan") {
                            alert("对不起,公式还没有查到!")
                            return (num)
                        }

                        alert("超出函数定义范围")
                        return (num)
                    }
                }

                function factorial(n) {
                    n = Math.abs(parseInt(n))
                    var fac = 1
                    for (; n > 0; n -= 1)
                        fac *= n
                    return (fac)
                }

                function dms(n) {
                    var neg = (n < 0)
                    with (Math) {
                        n = abs(n)
                        var d = floor(n)
                        var m = floor(60 * (n - d))
                        var s = (n - d) * 60 - m
                    }
                    var dms = d + m / 100 + s * 0.006
                    if (neg)
                        dms = -dms
                    return (dms)
                }

                function deg(n) {
                    var neg = (n < 0)
                    with (Math) {
                        n = abs(n)
                        var d = floor(n)
                        var m = floor((n - d) * 100)
                        var s = (n - d) * 100 - m
                    }
                    var deg = d + m / 60 + s / 36
                    if (neg)
                        deg = -deg
                    return (deg)
                }

                function degressToRadians(degress) {
                    return (degress * Math.PI / 180)
                }

                function radiansToDegress(radians) {
                    return (radians * 180 / Math.PI)
                }

                //界面

//-->
    </script>
</head>
<!--written by GoldHuman li hai-->
<!--2000.8-->
<body class="main">
    <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td valign="top">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <br>
                            <div align="center">
                                <form name="calc">
                                <table border="1" width="500" height="250">
                                    <tr>
                                        <td height="50">
                                            <table width="500">
                                                <td width="133">
                                                </td>
                                                <td width="353">
                                                    <div align="center">
                                                        <input type="text" name="display" value="0" readonly size="40">
                                                    </div>
                                                </td>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="500">
                                                <tr>
                                                    <td width="290">
                                                        <input type="radio" name="carry" onclick="inputChangCarry(16)">
                                                        十六进制
                                                        <input type="radio" name="carry" checked onclick="inputChangCarry(10)">
                                                        十进制
                                                        <input type="radio" name="carry" onclick="inputChangCarry(8)">
                                                        八进制
                                                        <input type="radio" name="carry" onclick="inputChangCarry(2)">
                                                        二进制
                                                    </td>
                                                    <td>
                                                    </td>
                                                    <td width="135">
                                                        <input type="radio" name="angle" value="d" onclick="inputChangAngle('d')" checked>
                                                        角度制
                                                        <input type="radio" name="angle" value="r" onclick="inputChangAngle('r')">
                                                        弧度制
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="500">
                                                <tr>
                                                    <td width="170">
                                                        <input name="shiftf" type="checkbox" onclick="inputshift()">上档功能
                                                        <input name="hypf" type="checkbox" onclick="inputshift()">双曲函数
                                                    </td>
                                                    <td>
                                                        <input name="bracket" value="" type="text" size="3" readonly style="background-color=lightgrey">
                                                        <input name="memory" value="" type="text" size="3" readonly style="background-color=lightgrey">
                                                        <input name="operator" value="" type="text" size="3" readonly style="background-color=lightgrey">
                                                    </td>
                                                    <td width="183">
                                                        <input type="button" value=" 退格 " onclick="backspace()" style="color=red">
                                                        <input type="button" value=" 清屏 " onclick="document.calc.display.value = 0 " style="color=red">
                                                        <input type="button" value=" 全清" onclick="clearall()" style="color=red">
                                                    </td>
                                                </tr>
                                            </table>
                                            <table width="500">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr align="center">
                                                                <td>
                                                                    <input name="pi" type="button" value=" PI " onclick="inputfunction('pi','pi')" style="color=blue">
                                                                </td>
                                                                <td>
                                                                    <input name="e" type="button" value=" E  " onclick="inputfunction('e','e')" style="color=blue">
                                                                </td>
                                                                <td>
                                                                    <input name="bt" type="button" value="d.ms" onclick="inputfunction('dms','deg')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td>
                                                                    <input type="button" value=" (  " onclick="addbracket()" style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input type="button" value=" )  " onclick="disbracket()" style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input name="ln" type="button" value=" ln " onclick="inputfunction('ln','exp')" style="color=#ff00ff">
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td>
                                                                    <input name="sin" type="button" value="sin " onclick="inputtrig('sin','arcsin','hypsin','ahypsin')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input type="button" value="x^y " onclick="operation('^',7)" style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input name="log" type="button" value="log " onclick="inputfunction('log','expdec')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td>
                                                                    <input name="cos" type="button" value="cos " onclick="inputtrig('cos','arccos','hypcos','ahypcos')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input name="cube" type="button" value="x^3 " onclick="inputfunction('cube','cubt')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input type="button" value=" n! " onclick="inputfunction('!','!')" style="color=#ff00ff">
                                                                </td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td>
                                                                    <input name="tan" type="button" value="tan " onclick="inputtrig('tan','arctan','hyptan','ahyptan')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input name="sqr" type="button" value="x^2 " onclick="inputfunction('sqr','sqrt')"
                                                                        style="color=#ff00ff">
                                                                </td>
                                                                <td>
                                                                    <input type="button" value="1/x " onclick="inputfunction('recip','recip')" style="color=#ff00ff">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="30">
                                                    </td>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <input type="button" value=" 储存 " onclick="putmemory()" style="color=red">
                                                                </td>
                                                            </tr>
                                                            <td>
                                                                <input type="button" value=" 取存 " onclick="getmemory()" style="color=red">
                                                            </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="button" value=" 累存 " onclick="addmemory()" style="color=red">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="button" value=" 积存 " onclick="multimemory()" style="color=red">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="33">
                                                        <input type="button" value=" 清存 " onclick="clearmemory()" style="color=red">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="30">
                                        </td>
                                        <td>
                                            <table>
                                                <tr align="center">
                                                    <td>
                                                        <input name="k7" type="button" value=" 7 " onclick="inputkey('7')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="k8" type="button" value=" 8 " onclick="inputkey('8')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="k9" type="button" value=" 9 " onclick="inputkey('9')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" / " onclick="operation('/',6)" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value="取余" onclick="operation('%',6)" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" 与 " onclick="operation('&',3)" style="color=red">
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <input name="k4" type="button" value=" 4 " onclick="inputkey('4')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="k5" type="button" value=" 5 " onclick="inputkey('5')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="k6" type="button" value=" 6 " onclick="inputkey('6')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" * " onclick="operation('*',6)" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input name="floor" type="button" value="取整" onclick="inputfunction('floor','deci')"
                                                            style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" 或 " onclick="operation('|',1)" style="color=red">
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <input type="button" value=" 1 " onclick="inputkey('1')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="k2" type="button" value=" 2 " onclick="inputkey('2')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="k3" type="button" value=" 3 " onclick="inputkey('3')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" - " onclick="operation('-',5)" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value="左移" onclick="operation('<',4)" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" 非 " onclick="inputfunction('~','~')" style="color=red">
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <input type="button" value=" 0 " onclick="inputkey('0')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input type="button" value="+/-" onclick="changeSign()" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input name="kp" type="button" value=" . " onclick="inputkey('.')" style="color=blue">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" + " onclick="operation('+',5)" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value=" ＝ " onclick="result()" style="color=red">
                                                    </td>
                                                    <td>
                                                        <input type="button" value="异或" onclick="operation('x',2)" style="color=red">
                                                    </td>
                                                </tr>
                                                <tr align="center">
                                                    <td>
                                                        <input name="ka" type="button" value=" A " onclick="inputkey('a')" style="color=blue"
                                                            disabled="true">
                                                    </td>
                                                    <td>
                                                        <input name="kb" type="button" value=" B " onclick="inputkey('b')" style="color=blue"
                                                            disabled="true">
                                                    </td>
                                                    <td>
                                                        <input name="kc" type="button" value=" C " onclick="inputkey('c')" style="color=blue"
                                                            disabled="true">
                                                    </td>
                                                    <td>
                                                        <input name="kd" type="button" value=" D " onclick="inputkey('d')" style="color=blue"
                                                            disabled="true">
                                                    </td>
                                                    <td>
                                                        <input name="ke" type="button" value=" E" onclick="inputkey('e')" style="color=blue"
                                                            disabled="true">
                                                    </td>
                                                    <td>
                                                        <input name="kf" type="button" value=" F" onclick="inputkey('f')" style="color=blue"
                                                            disabled="true">
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                        </td>
                    </tr>
                </table>
                </form> </div>
            </td>
        </tr>
    </table>
    </td> </tr> </table>
</body>
</html>
