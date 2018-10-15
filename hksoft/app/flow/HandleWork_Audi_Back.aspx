<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HandleWork_Audi_Back.aspx.cs"
    Inherits="hkpro.app.flow.HandleWork_Audi_Back" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WebAPP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=yes, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />
    <link rel="stylesheet" href="../../CssJs_A/global.css" />

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/global.js"></script>

    <script type="text/javascript">
        function chknull() {
            if (document.getElementById('FormName').value == '') {
                alert('对不起，没有找到下一步骤！');
                form1.FormName.focus();
                return false;
            }

            if (document.getElementById('FormName').value != '0') {
                if (document.getElementById('txt_wUserNames').value == '') {
                    alert('请选择审批人员！');
                    form1.txt_wUserNames.focus();
                    return false;
                }
            }
        }

        function dpfn_onchange(targ, selObj, restore) {
            document.getElementById('txt_wUserNames').value = '';
            document.getElementById('txt_wUserIDs').value = '';
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div data-role="page" id="indexPage1">
        <div data-role="header" data-position="fixed" data-theme="b">
            <a data-role="button" data-inline="true" data-icon="back" data-ajax="false" href="#"
                onclick="javascript:location.href='HandleWork.aspx'">返回</a>
            <h1>
                办理工作-审批驳回</h1>
        </div>
        <div data-role="content" data-theme="d">
            <ul data-role="listview">
                <li>
                    <div align="center">
                        <asp:Label ID="lblMsg" runat="server" Font-Size="Medium" ForeColor="Red" /></div>
                    <h3>
                        选择下一步骤：<asp:DropDownList ID="FormName" runat="server" AutoPostBack="True" onchange="dpfn_onchange()">
                        </asp:DropDownList>
                    </h3>
                </li>
                <asp:Panel ID="Panel1" runat="server">
                    <li>
                        <h3>
                            <asp:Label ID="lbljbry" runat="server"></asp:Label></h3>
                        <a href="#" onclick="javascript:openUser()" data-ajax="false">
                            <asp:TextBox ID="OwUserNames" runat="server" TextMode="MultiLine" Font-Size="Small"
                                ForeColor="Gray"></asp:TextBox>
                        </a>
                        <h3>
                            <asp:Label ID="lbljbbm" runat="server"></asp:Label></h3>
                        <a href="#" onclick="javascript:choosedept()" data-ajax="false">
                            <asp:TextBox ID="txt_wDeptNames" runat="server" TextMode="MultiLine" Font-Size="Small"
                                ForeColor="Gray"></asp:TextBox>
                        </a>
                        <h3>
                            <asp:Label ID="lbljbjs" runat="server"></asp:Label></h3>
                        <a href="#" onclick="javascript:chooserole()" data-ajax="false">
                            <asp:TextBox ID="txt_wRoleNames" runat="server" TextMode="MultiLine" Font-Size="Small"
                                ForeColor="Gray"></asp:TextBox>
                        </a>
                        <h3>
                            <asp:Label ID="lblyh" runat="server"></asp:Label></h3>
                        <asp:Label ID="lblmsg41" runat="server"></asp:Label>
                        <asp:TextBox ID="txt_wUserNames" runat="server" TextMode="MultiLine"
                            Font-Size="Small" ForeColor="Gray" placeholder="暂未选择任何人员"></asp:TextBox>
                        <asp:Label ID="lblmsg42" runat="server"></asp:Label>
                    </li>
                </asp:Panel>
                <li>
                    <div data-role="controlgroup" data-type="horizontal" align="center">
                        <asp:Button ID="Button1" runat="server" Text="驳回" OnClick="Button1_Click" data-inline="true"
                            data-theme="e" data-icon="edit" />
                        <input type="button" name="RecBtn" value="返回" onclick="javascript:location.href='HandleWork.aspx'"
                            data-inline="true" data-theme="e" data-icon="back" />
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <asp:Label ID="lblName" runat="server" Visible="false"></asp:Label>
    <asp:TextBox ID="txt_wUserIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="OwUserIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="txt_wDeptIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="txt_wRoleIDs" runat="server" Style="display: none"></asp:TextBox>
    <asp:Label ID="lblFlowId" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstrPromoterID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblstrPromoterName" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
