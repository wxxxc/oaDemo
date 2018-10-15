<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgHistory.aspx.cs" Inherits="hkpro.portal.xxgl.MsgHistory" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />

    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>

    <title>历史记录</title>
</head>
<body>
    <form id="form1" method="post" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRow_Bound"
        BorderWidth="0px" EmptyDataText="没有查到符合条件的数据！" ShowHeader="false" Width="100%">
        <Columns>
            <asp:TemplateField>
                <HeaderStyle Height="25px" />
                <ItemTemplate>
                    <asp:Label ID="Label1" ForeColor="#0000FF" runat="server" Text='<%# Bind("fssj") %>' />&nbsp;&nbsp;<font
                        color="#0000FF">(<asp:Label ID="Label2" ForeColor="#0000FF" runat="server" Text='<%# Bind("ui_desc") %>' />)</font><br />
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("nr") %>' />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    </form>
</body>
</html>
