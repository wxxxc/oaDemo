<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hksoft.Index_OA" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <%--<title id="PageTitle" runat="server"></title>--%>
    <title></title>
    <link href="res/css/default.css" rel="stylesheet" type="text/css" />
    <link href="css/mydefault.css" rel="stylesheet" />
    <link href="css/lanrenzhijia.css" rel="stylesheet" />
    <script src="Scripts/jquery.js"></script>
    <script src="Scripts/cloud.js"></script>
    <script type="text/javascript">

        // 本页面一定是顶层窗口，不会嵌在IFrame中
        //if (top.window != window) {
        //    top.window.location.href = "./Default.aspx";
        //}

        // 将 localhost 转换为 localhost/Default.aspx
        //if (window.location.href.indexOf('/Default.aspx') < 0) {
        //    window.location.href = "./Default.aspx";
        //}

    
    </script>
    <style>
        .login-image
        {
            background-color: #efefef;
            border-right: solid 1px #ddd;
        }

            .login-image img
            {
                width: 160px;
                height: 218px;
                padding: 10px;
            }
    </style>
</head>
<body style=" background-image:url(/images/wqbj1920.jpg); background-repeat:no-repeat; z-index:18997; background-position:center top; overflow:hidden; ">
       <div id="mainBody">
        <div id="cloud1" class="cloud"></div>
        <div id="cloud2" class="cloud"></div>
    </div>
    <form id="form1" runat="server">
        <f:PageManager ID="PageManager1" runat="server" />
        <f:Window ID="Window1" runat="server" IsModal="true" Hidden="false" EnableClose="false"
            EnableMaximize="false" WindowPosition="GoldenSection" 
            Layout="HBox" BoxConfigAlign="Stretch" BoxConfigPosition="Start" Width="500px">
            <Items>
                <f:Image ID="imageLogin" ImageUrl="images/menu/oa/login_icon.png" runat="server"
                    CssClass="login-image">
                </f:Image>
                <f:SimpleForm ID="SimpleForm1" LabelAlign="Top" BoxFlex="1" runat="server"
                    BodyPadding="5px 20px" ShowBorder="false" ShowHeader="false">
                    <Items>
                        <f:TextBox ID="tbxUserName" FocusOnPageLoad="true" runat="server" Label="用户名" Required="true"
                            ShowRedStar="true" Text="" NextFocusControl="tbxPassword">
                        </f:TextBox>
                        <f:TextBox ID="tbxPassword" TextMode="Password" runat="server" Required="true" ShowRedStar="true"
                            Label="密码" Text="" NextFocusControl="tbxCaptcha">
                        </f:TextBox>
                        <f:TextBox ID="tbxCaptcha" Label="验证码" Required="true" runat="server" ShowRedStar="true" NextFocusControl="btnLogin">
                        </f:TextBox>
                        <f:Panel ID="Panel1" CssStyle="padding-left:65px;" ShowBorder="false" ShowHeader="false"
                            runat="server">
                            <Items>
                                <f:Image ID="imgCaptcha" CssStyle="float:left;width:160px;" runat="server">
                                </f:Image>
                                <f:LinkButton CssStyle="float:left;margin-top:8px;" ID="btnRefresh" Text="看不清？"
                                    runat="server" OnClick="btnRefresh_Click">
                                </f:LinkButton>
                            </Items>
                        </f:Panel>
                    </Items>
                </f:SimpleForm>
            </Items>
            <Toolbars>
                <f:Toolbar ID="Toolbar1" runat="server" Position="Bottom" ToolbarAlign="Right">
                    <Items>
                        <%--<f:HyperLink ID="hlBrowse" runat="server" Text="第一次使用本系统升级IE或下载浏览器" NavigateUrl="Down/portal/BrowserSet.doc"></f:HyperLink>--%>
                         <f:HyperLink ID="hlBrowse" Target="_blank" runat="server" Text="第一次使用本系统请升级IE" NavigateUrl="https://support.microsoft.com/zh-cn/help/17621/internet-explorer-downloads"></f:HyperLink>
                         <f:HyperLink ID="HyperLink1" runat="server" Text="或下载浏览器" NavigateUrl="exe/68.0.3440.106_chrome_installer.exe"></f:HyperLink>
                     
                         <f:Label ID="lblcopy" runat="server" Label="" EncodeText="false" Text="&copy; CopyRight 2018"></f:Label>
                        <f:Button ID="btnLogin" Icon="LockOpen" Type="Submit" runat="server" ValidateForms="SimpleForm1"
                            OnClick="btnLogin_Click" Text="登录">
                        </f:Button>
                        <f:Button ID="btnReset" Icon="Reload" Text="重置" Type="Reset" EnablePostBack="false"
                            runat="server">
                        </f:Button>
                    </Items>
                </f:Toolbar>
            </Toolbars>
        </f:Window>
        <f:Label ID="lblCs" runat="server" EncodeText="false" CssClass="loginLabel"></f:Label>
        <f:Label ID="uid" runat="server"></f:Label>
    </form>
</body>
</html>