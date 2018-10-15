<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zshdShowBack.aspx.cs" Inherits="hkpro.oa.zsgl.zshdShowBack"
    ValidateRequest="false" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>知识互动</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="../../ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td class="td_base" width="80%" height="25px">
                回复知识讨论
            </td>
            <td class="td_base" width="20%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top" colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" align="center">
                    <tr>
                        <td colspan="2" style="height: 20">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100px" align="right" style="height: 15px;">
                            回复内容：
                        </td>
                        <td style="height: 15px">
                            <textarea runat="server" id="editor" name="editor" rows="10" cols="10" style="width: 90%;
                                height: 280px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td style="height: 30px">
                            <asp:Button ID="BtnS" runat="server" CssClass="mybtn" OnClick="BtnS_Click" Text=" 保存 " />
                            <asp:Button ID="BtnF" runat="server" OnClick="BtnF_Click" Text=" 返回 " CssClass="mybtn"
                                CausesValidation="false" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        var ue = UE.getEditor('editor');
    </script>
    </form>
</body>
</html>
