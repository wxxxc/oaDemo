<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChooseUserM.aspx.cs" Inherits="hkpro.Choose_A.portal.ChooseUserM" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WebAPP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../../CssJs_A/frame/jquery.mobile-1.3.2.css" />
    <link href="../../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link rel="stylesheet" href="../../CssJs_A/frame/Mycss.css" />
    <link rel="stylesheet" href="../../CssJs_A/global.css" />


    <%--bootstrap引用--%>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="../../bootstrap/css/bootstrap.min.css" />



    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery-1.8.2.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="../../CssJs_A/frame/jquery.mobile-1.3.0.min.js"></script>

    <script language="javascript">
    <!--
    var openerFiled = "jsr";

    function clickemail(stremail) {
        select = (document.getElementById(stremail).checked) ? '1' : '0';
        if (select == '1') {
            add_email(stremail);
        } else {
            del_email(stremail);
        }
    }

    function add_email(stremail) {
        addressList = window.opener.document.getElementById(openerFiled).value;
        if (addressList.length == 0) {
            addressList = stremail;
            window.opener.document.getElementById(openerFiled).value = addressList;
        } else {
            if (addressList.indexOf(stremail) == -1) {
                addressList = addressList + "," + stremail;
                window.opener.document.getElementById(openerFiled).value = addressList;
            }
        }
    }

    function del_email(stremail) {
        addressList = window.opener.document.getElementById(openerFiled).value;
        index = addressList.indexOf(stremail);
        if (index == 0) {
            addressList = addressList.substr(stremail.length + 1);
            window.opener.document.getElementById(openerFiled).value = addressList;
        } else if (index > 1) {
            addressList = addressList.substr(0, index - 1) + addressList.substr(index + stremail.length);
            window.opener.document.getElementById(openerFiled).value = addressList;
        }
    }

    function init_checkbox() {
        openerFiled = window.opener.document.getElementById("textfiled").value;
        addressList = window.opener.document.getElementById(openerFiled).value;
        if (addressList.length == 0) {
            return;
        }
        for (var i = 0; i < choose.elements.length; i++) {
            var e = choose.elements[i];
            if (addressList.indexOf(e.id) >= 0) {
                e.checked = true;
            }
        }
    }

    function CheckAll(choose) {
        select = (choose.chkall.checked) ? '1' : '0';
        for (var i = 0; i < choose.elements.length; i++) {
            var e = choose.elements[i];
            if (e.name == "chk") {
                e.checked = choose.chkall.checked;
                if (select == '1') {
                    add_email(e.id);
                }
                else {
                    del_email(e.id);
                }
            }
        }
    }
    //--> 
    </script>
    <style>
        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 7px 0;
            border-radius: 4px;
            padding-left: 30px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="choose" runat="server">
        <div data-role="page" id="indexPage" class="cum_index">
            <div data-role="header" data-position="fixed" data-theme="b" style="border-bottom-color: white; background: #5295EE; height: 58px">
                <table style="width: 100%; height: 58px;">
                    <tr>
                        <td align="left" style="width: 33%; padding-left: 10px">
                            <%--<input type="button" name="ClearBtn" value="清空" onclick="javascript:window.opener.document.getElementById('jsr').value='';window.close()" data-inline="true" data-theme="e" data-mini="true" />--%>
                            <img src="../../images_a/app/3.png" name="ClearBtn" value="清空" onclick="javascript:window.opener.document.getElementById('jsr').value='';window.location='../../Main_A.aspx'" data-inline="true" style="width: 25px; height: 30px" />
                        </td>
                        <td align="center" style="width: 34%">
                            <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none;">选择用户</h1>
                        </td>
                        <td align="right" style="width: 33%; padding-right: 15px">
                            <div class="btn_back" name="BackBtn" onclick="javascript:window.close()" data-inline="true" data-mini="true">
                                <%--<input type="button" name="BackBtn" value="完成" onclick="javascript:window.close()" data-inline="true" data-theme="b" data-mini="true" />--%>
                                <h1 style="font-weight: 100; color: white; font-size: 14px; text-shadow: none;">完成</h1>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div data-role="content" data-theme="d">
                <table style="width: 100%;">
                    <tr>
                        <td valign="top" style="width: 10px">
                            <%--<asp:Button ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" data-inline="true" data-theme="e" data-mini="true" data-icon="search" />--%>
                            <div class="hw_cx">
                                <asp:ImageButton ID="imagebutton1" runat="server"
                                    AlternateText="ImageButton 1"
                                    ImageAlign="left"
                                    ImageUrl="/images_a/app/suo.png"
                                    OnPreRender="Query_Click" />
                            </div>
                        </td>
                        <td valign="top">
                            <div class="hw_cx_txt">
                                <asp:TextBox ID="cxtj" runat="server" placeholder="请输入编码或姓名" data-clear-btn="true"
                                    data-inline="true" data-mini="true"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 60px;" valign="top" colspan="2">
                            <div class="btn_xl">
                                <asp:DropDownList ID="bm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                    data-mini="true" data-theme="d">
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </table>


                <%--<div data-role="controlgroup" data-type="horizontal">
                   <input type="button" name="ClearBtn" value="清空" onclick="javascript:window.opener.document.getElementById('jsr').value='';window.close()" data-inline="true" data-theme="e" data-mini="true" data-icon="back" />
                    <input type="button" name="BackBtn" value="确定关闭" onclick="javascript:window.close()" data-inline="true" data-theme="e" data-mini="true" data-icon="delete" />
                </div>--%>

                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <li>
                            <table>
                                <tr>
                                    <td>
                                        <input name="chk" id="<%# Eval("ui_id") %>" type="checkbox" onclick="javascript:clickemail('<%# Eval("ui_id")%>    ');" data-role="none" class="input_check" />
                                    </td>
                                    <td>
                                        <h3 class="listtitle">
                                            <asp:Label ID="lblui_desc" runat="server" Text='<%# Eval("ui_desc") %>' Font-Bold="true" />
                                        </h3>
                                        <asp:Label ID="lblbm_mc" runat="server" Text='<%# Eval("bm_mc") %>' ForeColor="Gray"
                                            Font-Size="Small" />&nbsp;&nbsp;
                                        <asp:Label ID="lblzwmc" runat="server" Text='<%# Eval("zwmc") %>' ForeColor="Gray"
                                            Font-Size="Small" />
                                    </td>
                                </tr>
                            </table>
                        </li>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <ul id="contentList" runat="server" data-role="listview" data-inset="false" class="contentList">
                            <li runat="server" id="itemPlaceholder" />
                        </ul>
                    </LayoutTemplate>
                </asp:ListView>
                <div class="row">
                    <div class="col-12">
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" OnPageChanged="AspNetPager1_PageChanged"
                            ShowCustomInfoSection="Right" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
                            NumericButtonCount="5" FirstPageText="首页" LastPageText="末页" NextPageText="下页"
                            PrevPageText="上页" CustomInfoSectionWidth="200px" CssClass="pagination" ShowBoxThreshold="11"
                            InputBoxClass="pagetext" SubmitButtonClass="pagebtn" SubmitButtonText="Go" LayoutType="Ul"
                            PagingButtonLayoutType="UnorderedList" PagingButtonSpacing="0" CurrentPageButtonClass="active"
                            ShowPageIndexBox="Never" ShowMoreButtons="false" ShowPageIndex="false">
                        </webdiyer:AspNetPager>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>
