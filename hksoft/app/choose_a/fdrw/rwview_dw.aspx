<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rwview_dw.aspx.cs" Inherits="hksoft.app.choose_a.fdrw.rwview__dw" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WebAPP</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0" />
    <link href="../../cssjs_a/frame/jquery.mobile-1.3.2.css" rel="stylesheet" />
    <link href="../../cssjs_a/frame/Mycss.css" rel="stylesheet" />
    <link href="../../cssjs_a/global.css" rel="stylesheet" />
    <link href="../../cssjs_a/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="../../cssjs_a/frame/jquery-1.8.2.min.js"></script>
    <script src="../../cssjs_a/frame/jquery.mobile-1.3.0.min.js"></script>
    <script src="../../cssjs_a/global.js"></script>

    <style>
        .pagination {
            display: inline-block;
            padding-left: 0;
            margin: 7px 0;
            border-radius: 4px;
            padding-left: 25px;
            margin-top: 10px;
        }
    </style>
    <script language="javascript">
        
    
       
        var openerFiled = "jsdx";
        console.log( openerFiled);
        function clickemail(stremail) {
            select = (document.getElementById(stremail).checked) ? '1' : '0';
            if (select == '1') {
                add_email(stremail);
            } else {
                del_email(stremail);
            }
        };

        function add_email(stremail) {

            var a =window.parent.document;
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
       
    
    </script>

    <style>
    </style>
</head>
<body>
    <form id="choose" runat="server">
        <div data-role="page" id="indexPage" class="cum_index">
            <div class="hf_index">
                <div data-role="header" data-position="fixed" data-theme="b" style="border-bottom-color: white; background: #5295EE; height: 58px">
                    <h1 style="font-weight: 100; color: white; font-size: 18px; text-shadow: none; margin: 1em 30% 0.8em;">选择牵头部门</h1>
                    <a onclick="javascript:window.close()" data-role="button" data-inline="true" data-ajax="false" data-theme="b"
                        class="ui-btn-up-a  ui-btn" style="border: none; background: #5295EE; top: 19px; left: 85%;" data-iconpos="left">
                        <span aria-hidden="true">完成</span>
                    </a>
                </div>
            </div>
            <%-- <td align="left" style="width: 33%; padding-left: 10px">--%>
            <%-- <asp:Button CssClass="mybtn" ID="NullBtn" runat="server" Text="清空" OnClick="set_null" CausesValidation="False" />--%>
            <%--<input type="button" name="BackBtn" value="确定关闭" class="mybtn" onclick="javascript:window.close()" />--%>
            <%--<input type="button" name="ClearBtn" value="清空" onclick="javascript:window.opener.document.getElementById('jsr').value='';window.close()" data-inline="true" data-theme="e" data-mini="true" />--%>
            <%--   <img src="../../images_a/app/3.png" name="ClearBtn" value="清空" onclick="javascript:window.opener.document.getElementById(jsr').value=''; window.location="'../../Add_fbdbrw.aspx'"" data-inline="true" style="width: 25px; height: 30px" />
            --%> <%-- </td>--%>

            <div data-role="content" data-theme="d">
                <table style="width: 100%;">
                    <tr>
                        <td valign="top">
                            <div class="hw_cx_txt">
                                <asp:TextBox ID="cxtj" runat="server" placeholder="请输入部门" data-clear-btn="true"
                                    data-inline="true" data-mini="true"></asp:TextBox>
                            </div>
                        </td>
                        <td valign="top" style="width: 10px">
                            <%--<asp:Button ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" data-inline="true" data-theme="e" data-mini="true" data-icon="search" />--%>
                            <div class="hw_cx">
                                <asp:ImageButton ID="imagebutton1" runat="server"
                                    AlternateText="ImageButton1"
                                    ImageAlign="left"
                                    ImageUrl="../../images_a/app/suo.png"
                                    OnPreRender="Query_Click" />
                            </div>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td style="height: 60px;" valign="top" colspan="2">
                            <div class="btn_xl">
                                <asp:DropDownList ID="bm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Query_Click"
                                    data-mini="true" data-theme="d">
                                </asp:DropDownList>
                            </div>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <li>
                            <table>
                                <tr>
                                    <td>
                                        <input name="chk" id="<%# Eval("id") %>" type="checkbox"
                                            onclick="javascript:clickemail('<%# Eval("id").ToString()%>');" data-role="none" class="input_check" />
                                    </td>
                                    <td>
                                        <h3 class="listtitle">
                                            <asp:Label ID="lblui_name" runat="server" Text='<%# Eval("name") %>' Font-Bold="true" />
                                        </h3>
                                          <asp:Label ID="lblbyh" runat="server" Text='<%# Eval("createuser") %>' ForeColor="Gray"
                                            Font-Size="Small" />&nbsp;&nbsp;
                                        <asp:Label ID="lblcjsj" runat="server" Text='<%# Eval("createtime") %>' ForeColor="Gray"
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
                            ShowCustomInfoSection="Right" ShowInputBox="Auto" AlwaysShow="false" CustomInfoHTML="共%RecordCount%行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页"
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
