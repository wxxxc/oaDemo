<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign_Add_ct.aspx.cs"
    Inherits="hkpro.workflow.form.FormDesign_Add_ct" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<script>
function submitvalue()  
{  
    var cValue = <%=Request.QueryString["Number"] %>;
    var cvalues = document.getElementById('Name').value;
    
    var str='<input id="Text2" name="'+cValue+'"  type="text" value="'+cvalues+'" style="border-left:0px;border-top:0px;border-right:0px;border-bottom:1px   solid   #000000"/>';
    window.opener.hkTemplate(str);
    window.close();
}			

function sethelp()
{
   if(document.getElementById("hc").style.display=="none")
      document.getElementById("hc").style.display="";
   else
   	  document.getElementById("hc").style.display="none";
}

</script>
<head id="Head1" runat="server">
    <title>表单设计 - 自定义宏控件</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <base target="_self" />
</head>
<body class="main">
    <form id="form1" runat="server">
    <table align="center" border="1" cellpadding="5" cellspacing="0" width="100%">
        <tr>
            <td height="30">
                &nbsp;自动编号表达式：
                <asp:TextBox ID="Name" runat="server" Width="60%" CssClass="mytext"></asp:TextBox>
                <img alt="" onclick="javascript:sethelp();" src="../../Images/help.gif" border="0">
            </td>
        </tr>
        <tr id="hc" style="display: none">
            <td>
                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                    <tr>
                        <td colspan="2">
                            表达式中可采用如下标记：
                        </td>
                    </tr>
                    <tr>
                        <td width="20%" align="right">
                            {BD}：
                        </td>
                        <td width="80%">
                            表示工作名称/文号
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {SD}：
                        </td>
                        <td>
                            表示部门名称
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {F}：
                        </td>
                        <td>
                            表示流程名
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {U}：
                        </td>
                        <td>
                            表示用户姓名
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {R}：
                        </td>
                        <td>
                            表示角色名称
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {Y}：
                        </td>
                        <td>
                            表示年
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {M}：
                        </td>
                        <td>
                            表示月
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {D}：
                        </td>
                        <td>
                            表示日
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {H}：
                        </td>
                        <td>
                            表示时
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {I}：
                        </td>
                        <td>
                            表示分
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {S}：
                        </td>
                        <td>
                            表示秒
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            {W}：
                        </td>
                        <td>
                            表示星期
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            例如，表达式为：{Y}年{M}月{D}日{H}:{I}-{F}流程（{SD}-{U}）<br>
                            自动生成文号如：2011年01月01日12:15-请假流程（行政部-刘备）
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" height="26">
                <input id="SaveBtn" class="btn btn-success" onclick="javascript:submitvalue()" type="button"
                    value="确定" />
                <input id="CloseBtn" class="btn btn-danger" onclick="javascript:window.close()" type="button"
                    value="关闭" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
