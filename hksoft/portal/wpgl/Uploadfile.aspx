<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Uploadfile.aspx.cs" Inherits="hkpro.portal.wpgl.Uploadfile" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>上传文件</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <script language="javascript" type="text/javascript">
        function addFile() {
            var filebutton = '<br><input type="file" size="80" name="File" class="mytext" />';
            document.getElementById('FileList').insertAdjacentHTML("beforeEnd", filebutton);
        }
    </script>
</head>
<body class="main">
    <form id="form1" method="post" runat="server" enctype="multipart/form-data">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table width="100%" border="0" cellpadding="4" cellspacing="0">
                    <tr>
                        <td width="5%">
                        </td>
                        <td width="90%">
                            <br />
                            <b>单个/批量上传文件</b>
                            <p id="FileList">
                                <input type="file" size="80" name="File" class="mytext" /></p>
                            <p>
                                <input type="button" value="批量上传文件" class="mybtn" onclick="addFile()" style="width: 90" />
                                <asp:Button runat="server" CssClass="mybtn" Text="开始上传" ID="SureBtn" OnClick="SureBtn_Click">
                                </asp:Button>
                                <asp:Button ID="ReturnBtn" runat="server" Text="返 回" CssClass="mybtn" OnClick="ReturnBtn_Click"
                                    CausesValidation="False" />
                            </p>
                        </td>
                        <td width="5%">
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25">
                            &nbsp;
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label ID="StatusMsg" runat="server" Width="100%"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
