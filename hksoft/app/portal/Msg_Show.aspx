<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Msg_Show.aspx.cs" Inherits="hkpro.app.portal.Msg_Show" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>春城泉镇-重点工作</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/myapp.css" rel="stylesheet" />
    <link href="../cssjs_a/frame/global.css" rel="stylesheet" />
    <script src="../assets/plugins/jquery/jquery.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="../js/waves.js"></script>
    <script src="../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../cssjs_a/global.js"></script>
    <script src="../js/myselfjs.js"></script>
    <script>
        function fade() {
            //停留2秒后消失,在停留的时候,透明度为1.0什么都不做
            $('<div id="bubble_tooltip"><div class="bubble_top"><span></span></div><div class="bubble_middle"><span id="bubble_tooltip_content">提交成功！</span></div><div class="bubble_bottom"></div></div>').insertBefore($("#hiddenSpan")).animate({ opacity: 1.0 }, 2000).fadeOut("slow", function () {
                //隐藏时把元素删除
                $(this).remove();
            });
        }
    </script>

    <style type="text/css">

        .width {
            overflow: auto;
            word-break: break-all;
            word-wrap: break-word;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div data-role="page" id="indexPage">
            <div data-role="header" data-position="fixed" data-theme="d" class="bg-info mytop">
                <div>
                    <a onclick="window.location='Msg.aspx'">
                        <i class="fa fa-chevron-left"></i>
                    </a>
                    <div class="div_h1">
                        <h1>查看消息</h1>
                    </div>
                </div>
            </div>
            <div data-role="content" data-theme="d" class="mycontent_detail" >
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="id">
                    <ItemTemplate>
                        <li class="list-group-item">
                            <div class="separated_line"></div>
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>发送人：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lblfsrmc" runat="server" Text='<%# Eval("ui_desc") %>' />
                                </div>
                            </div>
                            <div class="separated_line"></div>
                            <div class="separated_line"></div>
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>发送时间：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lblfssj" runat="server" Text='<%# Bind("fssj", "{0:yyyy-MM-dd HH:mm}") %>' />
                                </div>
                            </div>
                            <div class="separated_line"></div>
                            <div class="row con_div">
                                <div class="col-4 text-right">
                                    <span>发送内容：</span>
                                </div>
                                <div class="col-8 text-left">
                                    <asp:Label ID="lblnr" runat="server" Text='<%# Bind("nr") %>' CssClass="width" Width="200px">  </asp:Label>
                                </div>
                            </div>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="contentList" runat="server" data-role="listview" class="list-group">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <div align="center">
                    <asp:Label ID="lblMsg" runat="server" Font-Size="Medium" ForeColor="Red" />
                </div>
                <div class="row con_div">
                    <div class="col-12 text-left">
                        <asp:Label ID="lblfsrid" runat="server" Visible="false" />
                        <asp:TextBox ID="hfnr" runat="server" placeholder="请输入回复内容" data-clear-btn="true"
                            data-inline="true" data-mini="true" required="required" Style="width: 90%; margin-left: 5%; height: 100px" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div align="center" class="btn_color">
                    <asp:Button ID="ReplyBtn" runat="server" Text="回复" data-theme="e" data-mini="true"
                        OnClick="Reply_Click" CssClass="btn btn-info" Width="90%" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
