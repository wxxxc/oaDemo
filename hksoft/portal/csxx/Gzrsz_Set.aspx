<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gzrsz_Set.aspx.cs" Inherits="hkpro.portal.csxx.Gzrsz_Set" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����������</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script language="jscript">
        function Click_Cell(object) {

            if (object.style.backgroundColor.toUpperCase() == '<%=indaycolor%>'.toUpperCase())
                object.style.backgroundColor = '<%=outdaycolor%>';
            else
                object.style.backgroundColor = '<%=indaycolor%>';

            //alert(object.style.backgroundColor);
            //���ݸ�ʽ����ID:n,{ID:n....}��n˫���ϰ࣬������Ϣ��
            var innerstring;
            innerstring = document.ShowDay.hcellstatus.value;
            //����ID�ҵ��Ƿ���ڸ�ID,����о��޸�VALUE��û�о����VALUE=0
            var arr = innerstring.split(",");
            var arrtmp;
            var re = /\d+/; //ƥ��id
            var re1 = /:\w+/; //ƥ��n
            var n, tmpstr;
            var havefound = false; //�ҵ���ƥ����
            for (var i = 0; i < arr.length; i++) {
                arrtmp = arr[i].match(re);
                //	if(arrtmp!=null)
                //		alert("|"+arrtmp[0]+"|"+object.id+"|");
                if ((arrtmp != null) && (arrtmp[0] == object.id))//�ҵ�ƥ����
                {
                    //alert("�ҵ�ƥ����"+"|"+arrtmp[0]+"|"+object.id);
                    n = arr[i].match(re1);
                    n = n[0].substr(1);
                    n = ":" + String(parseInt(n) + 1);
                    tmpstr = arr[i].replace(re1, n);
                    document.ShowDay.hcellstatus.value = innerstring.replace(arr[i], tmpstr);
                    havefound = true;
                    break;
                }

            }
            if (!havefound)//û���ҵ�ƥ�������ַ���
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
                            <asp:Label runat="server" ID="labelgzr" BackColor="red" Width="50" Height="20"></asp:Label>&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label runat="server" ID="label1" BackColor="#ffff00" Width="50" Height="20"></asp:Label>&nbsp;������Ϣ��
                        </td>
                        <td align="right" style="height: 40">
                            <input id="hcellstatus" type="hidden" runat="server">
                            <asp:Button ID="btnsubmit" runat="server" Text="�� ��" CssClass="btn btn-success" OnClick="btnsubmit_Click">
                            </asp:Button>
                            <input type="button" name="RecBtn" value="�� ��" class="btn btn-info" onclick="javascript:location.href='Gzrsz.aspx'" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <table id="daytable" cellspacing="0" cellpadding="0" width="100%" align="center"
                                border="1" runat="server" class="gbtext" style="border-collapse: collapse" bordercolor="#93bee2">
                                <tr height="30">
                                    <td align="center" style="cursor: hand" onclick="Top_Click(0)" onmouseover="this.title='����ı�����'"
                                        title="����޸�����" bgcolor="#e8f4ff">
                                        ����һ
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(1)" onmouseover="this.title='����ı�����'"
                                        bgcolor="#e8f4ff">
                                        ���ڶ�
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(2)" onmouseover="this.title='����ı�����'"
                                        bgcolor="#e8f4ff">
                                        ������
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(3)" onmouseover="this.title='����ı�����'"
                                        bgcolor="#e8f4ff">
                                        ������
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(4)" onmouseover="this.title='����ı�����'"
                                        bgcolor="#e8f4ff">
                                        ������
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(5)" onmouseover="this.title='����ı�����'"
                                        bgcolor="#e8f4ff">
                                        ������
                                    </td>
                                    <td align="center" style="cursor: hand" onclick="Top_Click(6)" onmouseover="this.title='����ı�����'"
                                        bgcolor="#e8f4ff">
                                        ������
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
