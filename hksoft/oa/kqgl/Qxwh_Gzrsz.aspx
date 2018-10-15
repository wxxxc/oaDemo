<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Qxwh_Gzrsz.aspx.cs" Inherits="hkpro.oa.kqgl.Qxwh_Gzrsz" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>员工考勤 - 工作日设置</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script language="jscript">
        function Click_Cell(object) {

            if (object.style.backgroundColor.toUpperCase() == '<%=indaycolor%>'.toUpperCase())
                object.style.backgroundColor = '<%=outdaycolor%>';
            else
                object.style.backgroundColor = '<%=indaycolor%>';

            //alert(object.style.backgroundColor);
            //数据格式采用ID:n,{ID:n....}（n双数上班，单数休息）
            var innerstring;
            innerstring = document.ShowDay.hcellstatus.value;
            //遍历ID找到是否存在该ID,如果有就修改VALUE，没有就添加VALUE=0
            var arr = innerstring.split(",");
            var arrtmp;
            var re = /\d+/; //匹配id
            var re1 = /:\w+/; //匹配n
            var n, tmpstr;
            var havefound = false; //找到了匹配项
            for (var i = 0; i < arr.length; i++) {
                arrtmp = arr[i].match(re);
                //	if(arrtmp!=null)
                //		alert("|"+arrtmp[0]+"|"+object.id+"|");
                if ((arrtmp != null) && (arrtmp[0] == object.id))//找到匹配项
                {
                    //alert("找到匹配项"+"|"+arrtmp[0]+"|"+object.id);
                    n = arr[i].match(re1);
                    n = n[0].substr(1);
                    n = ":" + String(parseInt(n) + 1);
                    tmpstr = arr[i].replace(re1, n);
                    document.ShowDay.hcellstatus.value = innerstring.replace(arr[i], tmpstr);
                    havefound = true;
                    break;
                }

            }
            if (!havefound)//没有找到匹配项，添加字符串
            {
                //alert(object.style.backgroundColor);
                if (object.style.backgroundColor.toUpperCase() == '<%=indaycolor%>'.toUpperCase())
                    innerstring = object.id + ":0,";
                else
                    innerstring = object.id + ":1,";
                document.ShowDay.hcellstatus.value += innerstring;
                //alert(document.ShowDay.hcellstatus.value);
            }

            //alert(object.style.backgroundColor);

        }

        function Top_Click(cellnumber) {
            for (var i = 0; i < daytable.rows.length; i++) {
                daytable.rows[i].cells[cellnumber].click();

            }
        }
    </script>
</head>
<body class="main">
    <form id="ShowDay" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="98%" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr>
                        <td>
                            切换年份：<asp:DropDownList ID="year" runat="server" AutoPostBack="true" OnSelectedIndexChanged="year_SelectedIndexChanged">
                                <asp:ListItem Text="2015年" Value="2015"></asp:ListItem>
                                <asp:ListItem Text="2016年" Value="2016"></asp:ListItem>
                                <asp:ListItem Text="2017年" Value="2017"></asp:ListItem>
                                <asp:ListItem Text="2018年" Value="2018"></asp:ListItem>
                                <asp:ListItem Text="2019年" Value="2019"></asp:ListItem>
                                <asp:ListItem Text="2020年" Value="2020"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label runat="server" ID="labelgzr" BackColor="red" Width="50" Height="20"></asp:Label>&nbsp;代表工作日&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" ID="label1" BackColor="#ffff00" Width="50" Height="20"></asp:Label>&nbsp;代表休息日
                        </td>
                        <td align="right" style="height: 40">
                            <input id="hcellstatus" type="hidden" runat="server">
                            <asp:Button ID="btnsubmit" runat="server" Text="保 存" CssClass="mybtn" OnClick="btnsubmit_Click"
                                ></asp:Button>
                            <input type="button" name="BackBtn" value="关 闭" class="mybtn" onclick="javascript:window.close()"
                                 />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table id="daytable" cellspacing="0" cellpadding="0" width="100%" align="center"
                                border="1" runat="server" class="gbtext" style="border-collapse: collapse" bordercolor="#93bee2">
                                <tr height="30">
                                    <td align="center" style="cursor: hand" onclick="Top_Click(0)" onmouseover="this.title='点击改变整列'"
                                        title="点击修改整列" bgcolor="#e8f4ff">
                                        星期一
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(1)" onmouseover="this.title='点击改变整列'"
                                        bgcolor="#e8f4ff">
                                        星期二
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(2)" onmouseover="this.title='点击改变整列'"
                                        bgcolor="#e8f4ff">
                                        星期三
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(3)" onmouseover="this.title='点击改变整列'"
                                        bgcolor="#e8f4ff">
                                        星期四
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(4)" onmouseover="this.title='点击改变整列'"
                                        bgcolor="#e8f4ff">
                                        星期五
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(5)" onmouseover="this.title='点击改变整列'"
                                        bgcolor="#e8f4ff">
                                        星期六
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(6)" onmouseover="this.title='点击改变整列'"
                                        bgcolor="#e8f4ff">
                                        星期日
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
