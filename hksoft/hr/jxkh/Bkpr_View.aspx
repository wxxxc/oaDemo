<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bkpr_View.aspx.cs" Inherits="hkpro.oa.jxkh.Bkpr_View" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
      <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>

    <script type="text/javascript" src="../../CssJs/MyJs.js"></script>

    <title>被考评人维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tbody>
            <tr>
                <td class="td_base" width="80%" height="25px">
                    <asp:Label ID="lbltitle" runat="server"></asp:Label>被考评人信息
                </td>
                <td class="td_base" width="20%">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <table id="search" cellspacing="0" cellpadding="0" width="98%" border="0" align="center">
                        <tbody>
                            <tr>
                                <td style="height: 10px">
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="left">
                                    <table cellspacing="0" cellpadding="0" border="0" width="100%" align="center">
                                        <tr>
                                            <td style="height: 21px; width: 91px; background-image: url(../../images/tab_b_y.gif)"
                                                align="center">
                                                <a href="#" class="mail_top">基本信息</a>
                                            </td>
                                            <td style="width: 91px; background-image: url(../../images/tab_b_n.gif)" align="center">
                                                <a href="Bkpr_View_pfxm.aspx?id=<%=bid.Text %>" class="black">评分项目信息</a>
                                            </td>
                                            <td align="right">
                                                <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" />
                                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click"
                                                    AccessKey="s"></asp:Button>
                                                <asp:Button CssClass="btn btn-danger" ID="DelBtn" runat="server" Text="删 除" OnClick="Del_Click"
                                                    Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button>
                                                <input type="button" name="BackBtn" value="关闭" class="btn btn-warning" onclick="javascript:window.close()"
                                                    accesskey="q" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table border="0" cellpadding="0" cellspacing="0" class="form" width="100%">
                                        <tr>
                                            <td class="form-item" style="width:20%">
                                                被考评人<font color="red">*</font>：
                                            </td>
                                            <td style="width:30%">
                                                <asp:TextBox ID="xm" runat="server" CssClass="mytext" Width="80%"></asp:TextBox>
                                                <img id="img1" onclick="OpenBkpr();" src="../../Images/choose.gif" border="0" alt="选择被考评人" runat="server" />
                                            </td>
                                            <td class="form-item" style="width:20%">
                                                分管副主管<font color="red">*</font>：
                                            </td>
                                            <td style="width:30%">
                                                <asp:TextBox CssClass="mytext" ID="fgzrmc" runat="server" Width="80%"></asp:TextBox>
                                                <img id="img2" onclick="chooseuser_s();" src="../../Images/choose.gif" border="0" alt="选择人员" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">
                                                部室<font color="red">*</font>：</td>
                                            <td>
                                                <asp:TextBox CssClass="mytext" ID="bs" runat="server" Width="90%"></asp:TextBox>
                                            </td>
                                            <td class="form-item">
                                                岗位<font color="red">*</font>：</td>
                                            <td>
                                                <asp:TextBox CssClass="mytext" ID="gw" runat="server" Width="90%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="form-item">
                                                备注：
                                            </td>
                                            <td colspan="3">
                                                <asp:TextBox ID="bz" runat="server" CssClass="mytextarea" TextMode="multiLine" Rows="3"
                                                    Width="96%"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:TextBox ID="bid" runat="server" Style="display: none"></asp:TextBox>
    <asp:TextBox ID="fgzrid" runat="server" Style="display: none"></asp:TextBox>
    
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true"
        ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="xm"
        ErrorMessage="请选择被考评人">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fgzrmc"
        ErrorMessage="请选择分管副主管">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator123" runat="server" ControlToValidate="bs"
        ErrorMessage="请输入部室">&nbsp;
    </asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="gw"
        ErrorMessage="请输入岗位">&nbsp;
    </asp:RequiredFieldValidator>
    
    <script language="javascript">
        var wName;
        function OpenBkpr() {
            var num = Math.random();
            var str = "" + document.getElementById('bid').value + "|" + document.getElementById('xm').value + "|" + document.getElementById('bs').value + "|" + document.getElementById('gw').value + "";
            wName = window.showModalDialog("../../choose/hr/ChooseBkpr.aspx?tmp=" + num + "&requeststr=" + str + "&id=" + str + "", "window", "dialogWidth:550px;DialogHeight=480px;status:no;scroll=yes;help:no");
            var arr = wName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("bid").value = arr[0];
                document.getElementById("xm").value = arr[1];
                document.getElementById("bs").value = arr[2];
                document.getElementById("gw").value = arr[3];
            }
        }

        var uIdName;
        function chooseuser_s() {
            var rdm = Math.random();
            var str = "" + document.getElementById('fgzrid').value + "|" + document.getElementById('fgzrmc').value + "";
            uIdName = window.showModalDialog("../../choose/hr/ChoosePwS.aspx?tmp=" + rdm + "&rqstr=" + str + "", "window", "dialogWidth:550px;DialogHeight=480px;status:no;scroll=yes;help:no");
            var arr = uIdName.split("|");
            for (var i = 0; i < arr.length; i++) {
                document.getElementById("fgzrid").value = arr[0];
                document.getElementById("fgzrmc").value = arr[1];
            }
        }
    </script>
    </form>
</body>
</html>