<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseUser.aspx.cs" Inherits="hkpro.Choose.portal.ChooseUser" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
<head>
    <title>请选择用户</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <base target="_self" />

    <script language="javascript">
        function checkbtn() {
            for (var i = 0; i < document.getElementById('SelectedListBox').length; i++) {
                document.getElementById("tbvalue").value = "" + document.getElementById("tbvalue").value + "" + document.getElementById('SelectedListBox').options[i].value + ",";
                document.getElementById("tbtext").value = "" + document.getElementById("tbtext").value + "" + document.getElementById('SelectedListBox').options[i].text + ",";
            }

            if (document.getElementById("tbvalue").value == '') {
                alert('您未选择任何人员！');
                return false;
            }
            else {
                sendFromChild();
            }
        }

        var getFromParent = window.dialogArguments;
        function chkSelect() {
            var retrunstr = "";
            retrunstr = "" + document.getElementById("tbvalue").value + "|" + document.getElementById("tbtext").value + "";
            return retrunstr;
        }

        function sendFromChild() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5')
            {
                //window.opener.returnValue = chkSelect();  //chr37+以前支持
                window.opener.setValue(chkSelect());
            }
            else
            {
                window.returnValue = chkSelect();
            }
            
            window.close();
        }

        function clearwin() {
            //browser
            var bstr = getBrowserType();
            if (bstr == '3' | bstr == '4' | bstr == '5') {
                window.opener.setValue("|");
            }
            else {
                window.returnValue = "|";
            }
            
            window.close();
        }

        window.onbeforeunload = function() {
            var n = window.event.screenX - window.screenLeft;
            var b = n > document.documentElement.scrollWidth - 20;
            if (b && window.event.clientY < 0 || window.event.altKey) {
            }
        }

        function closewin() {
            window.close();
        }

        function ChangeItem(l1, l2) {
            var cc = document.getElementById(l1).options[window.document.getElementById(l1).selectedIndex].value;
            var dd = document.getElementById(l1).options[window.document.getElementById(l1).selectedIndex].text;
            //alert(dd + ":" + cc); 
            document.getElementById(l1).options.remove(window.document.getElementById(l1).selectedIndex);
            var op = new Option(dd, cc, false, false);
            document.getElementById(l2).options.add(op);
        }  
    </script>
</head>
<body class="main">
    <form id="form1" method="post" runat="server">
    <table border="0" cellspacing="0" cellpadding="0" style="width: 100%;">
        <tr>
            <td style="height: 30px;">&nbsp;待选用户过滤关键词:<asp:TextBox ID="tj" runat="server" Width="150px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="height: 30px; text-align: center;">
                <asp:Button ID="DeptBtn" runat="server" OnClick="Dept_Click" Text="按部门设置" class="mybtn" style="width:100" />
                <asp:Button ID="UserBtn" runat="server" OnClick="User_Click" Text="按人员设置" class="mybtn" style="width:100" />
                <asp:Button ID="RoleBtn" runat="server" OnClick="Role_Click" Text="按角色设置" class="mybtn" style="width:100" />
                <asp:Button ID="PosiBtn" runat="server" OnClick="Posi_Click" Text="按职位设置" class="mybtn" style="width:100" />
                <asp:Button ID="QzBtn" runat="server" OnClick="Qz_Click" Text="按群组设置" class="mybtn" style="width:100" />
                <asp:Button ID="GysBtn" runat="server" OnClick="Gys_Click" Text="按供应商设置" class="mybtn" style="width:100" Visible="false" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center" style="width: 30%" valign="top">
                            <b>检索条件</b></td>
                        <td align="center" style="width: 5%">&nbsp;
                            </td>
                        <td align="center" style="width: 30%" valign="top">
                            <b>待选用户</b></td>
                        <td align="center" style="width: 5%" valign="top">&nbsp;
                            </td>
                        <td align="center" style="width: 30%" valign="top">
                            <b>已选用户</b></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <asp:ListBox ID="QueryListBox" runat="server" Height="370px" Width="170px" AutoPostBack="True"
                                OnSelectedIndexChanged="QueryListBox_SelectedIndexChanged" Visible="false"></asp:ListBox>
                            <asp:Panel runat="server" ID="p_dept" ScrollBars="Auto" Height="350">
                                <asp:TreeView ID="DeptTreeView" runat="server" OnSelectedNodeChanged="DeptTreeView_SelectedNodeChanged"
                                    ShowLines="True" ForeColor="black" ExpandDepth="2">
                                </asp:TreeView>
                            </asp:Panel>
                        </td>
                        <td align="center">
                        </td>
                        <td align="center" valign="top">
                            <asp:ListBox ID="SelectListBox" runat="server" Height="370px" Width="170px"></asp:ListBox><br />
                        </td>
                        <td align="center" valign="top">
                            <asp:Button ID="sSelectBtn" runat="server" OnClick="sSelect_Click" Text=">" Width="55px" /><br />
                            <br />
                            <asp:Button ID="mSelectBtn" runat="server" OnClick="mSelect_Click" Text=">>" Width="55px" />
                            <br />
                            <asp:Button ID="sNoSelectBtn" runat="server" OnClick="sNoSelect_Click" Text="<" Width="55px" /><br />
                            <br />
                            <asp:Button ID="mNoSelectBtn" runat="server" OnClick="mNoSelect_Click" Text="<<" Width="55px" />
                        </td>
                        <td align="center" valign="top">
                            <asp:ListBox ID="SelectedListBox" runat="server" Height="370px" Width="170px"></asp:ListBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 25;" align="center">
                <input id="SaveBtn" class="mybtn" onclick="return checkbtn();" type="button" value=" 确定 " />
                <input id="ClearBtn" class="mybtn" onclick="clearwin();" type="button" value=" 清空 " />
                <input type="button" value=" 关闭 " onclick="closewin();" class="mybtn" id="CloseBtn">
            </td>
        </tr>
    </table>
    <asp:TextBox ID="tbType" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbvalue" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbtext" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="rqstr" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
