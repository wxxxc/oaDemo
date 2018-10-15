<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseUser.aspx.cs" Inherits="hkpro.Choose_A.portal.ChooseUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>选择用户</title>
    <base target="_self" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

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
            window.opener.setValue(chkSelect());
            window.close();
        }

        function clearwin() {
            window.opener.setValue("|");
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
<body>
    <form id="form1" method="post" runat="server" data-ajax="false">
    <div data-role="page" id="indexPage">
        <div data-role="header" data-position="fixed" data-theme="b">
            <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true"
                data-theme="e">
                <asp:Button ID="DeptBtn" runat="server" OnClick="Dept_Click" Text="按部门" data-inline="true"
                    data-mini="true" />
                <asp:Button ID="UserBtn" runat="server" OnClick="User_Click" Text="按人员" data-inline="true"
                    data-mini="true" />
                <asp:Button ID="RoleBtn" runat="server" OnClick="Role_Click" Text="按角色" data-inline="true"
                    data-mini="true" />
                <asp:Button ID="PosiBtn" runat="server" OnClick="Posi_Click" Text="按职位" data-inline="true"
                    data-mini="true" />
                <asp:Button ID="QzBtn" runat="server" OnClick="Qz_Click" Text="按群组" data-inline="true"
                    data-mini="true" />
            </fieldset>
        </div>
        <div data-role="content" data-theme="d">
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" style="width: 50%" valign="top">
                        <b>检索条件</b>
                    </td>
                    <td align="center" style="width: 50%" valign="top">
                        <b>待选用户</b>
                    </td>
                </tr>
                <tr>
                    <td valign="top" rowspan="4">
                        <asp:ListBox ID="QueryListBox" runat="server" Height="260px" Width="120px" AutoPostBack="True"
                            OnSelectedIndexChanged="QueryListBox_SelectedIndexChanged" Visible="false" data-role="none">
                        </asp:ListBox>
                        <asp:Panel runat="server" ID="p_dept" ScrollBars="Auto" Height="350">
                            <asp:TreeView ID="DeptTreeView" runat="server" OnSelectedNodeChanged="DeptTreeView_SelectedNodeChanged"
                                ShowLines="True" ForeColor="black" ExpandDepth="2">
                            </asp:TreeView>
                        </asp:Panel>
                    </td>
                    <td align="center" valign="top">
                        <asp:ListBox ID="SelectListBox" runat="server" Height="140px" Width="150px" data-role="none">
                        </asp:ListBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top">
                        <fieldset data-role="controlgroup" data-type="horizontal" data-mini="true" data-corners="true"
                            data-theme="e">
                            <asp:Button ID="sSelectBtn" runat="server" OnClick="sSelect_Click" Text="﹀" Width="55px"
                                data-inline="true" data-mini="true" />
                            <asp:Button ID="mSelectBtn" runat="server" OnClick="mSelect_Click" Text="︾" Width="55px"
                                data-inline="true" data-mini="true" />
                            <asp:Button ID="sNoSelectBtn" runat="server" OnClick="sNoSelect_Click" Text="︿" Width="55px"
                                data-inline="true" data-mini="true" />
                            <asp:Button ID="mNoSelectBtn" runat="server" OnClick="mNoSelect_Click" Text="︽"
                                Width="55px" data-inline="true" data-mini="true" />
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top">
                        <b>已选用户</b>
                    </td>
                </tr>
                <tr>
                    <td align="center" valign="top">
                        <asp:ListBox ID="SelectedListBox" runat="server" Height="140px" Width="150px" data-role="none">
                        </asp:ListBox>
                    </td>
                </tr>
            </table>
            <div data-role="controlgroup" data-type="horizontal" align="center">
                <input id="SaveBtn" onclick="return checkbtn();" type="button" value="确定" data-theme="e"
                    data-inline="true" />
                <input id="ClearBtn" onclick="clearwin();" type="button" value="清空" data-theme="e"
                    data-inline="true" />
                <input type="button" value="关闭" onclick="closewin();" id="CloseBtn" data-theme="e"
                    data-inline="true" />
            </div>
        </div>
    </div>
    <asp:TextBox ID="tbType" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbvalue" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="tbtext" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="rqstr" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>
