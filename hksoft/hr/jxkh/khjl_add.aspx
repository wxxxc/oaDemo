<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="khjl_add.aspx.cs" Inherits="hksoft.hr.jxkh.khjl_add" 
   ValidateRequest="false" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../CssJs/WebCalendar.js"></script>
    <script src="../../res/js/jquery.js"></script>
    <script src="../../js/myselfjs.js"></script>
    
<script>
    function chkAll1() {
        var chkall = document.all["chkall1"];
        var chkother = document.getElementsByTagName("input");
        for (var i = 0; i < chkother.length; i++) {
            if (chkother[i].type == 'checkbox') {
                if (chkother[i].id.indexOf('GridView1') > -1) {
                    if (chkall.checked == true) {
                        chkother[i].checked = true;
                    }
                    else {
                        chkother[i].checked = false;
                    }
                }
            }
        }
    }
    
             /**
             * js 前台搜索
             * @param searchContent 搜索的内容
             * @col 要搜索的哪一列，这里是第一列，从0开始数起  
             */
            function onSearch(searchContent,col){
                //setTimeout(function(){//因为是即时查询，需要用setTimeout进行延迟，让值写入到input内，再读取  
                    var storeId = document.getElementById('GridView1');//获取table的id标识  
                    var rowsLength = storeId.rows.length;//表格总共有多少行  
              
                    var searchCol = col;//要搜索的哪一列，这里是第一列，从0开始数起  
              
                    for(var i=1;i<rowsLength;i++){//按表的行数进行循环，本例第一行是标题，所以i=1，从第二行开始筛选（从0数起）  
                        
                        var searchText = storeId.rows[i].innerText;//取得table行，列的值  
                        if(searchText.match(searchContent) || searchText.toUpperCase().match(searchContent.toUpperCase())){//用match函数进行筛选，如果input的值，即变量 key的值为空，返回的是ture，  
                            storeId.rows[i].style.display='';//显示行操作，  
                        }else{  
                            storeId.rows[i].style.display='none';//隐藏行操作  
                        }  
                    }  
               // },20);//20为延时时间  
            }   
</script>
    <title>添加考核记录</title>
   <style>
       td {
       text-align:center;
       }
      
   </style>
</head>
    <body class="main">
    <form id="form1" runat="server" enctype="multipart/form-data">
        
        <asp:ScriptManager runat="server" ID="scriptmanager_index"></asp:ScriptManager>
       <%--    <asp:UpdatePanel runat="server" ID="up1">
                            <ContentTemplate>
          --%>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_base" style="width: 100%; height: 25px">新增考核记录
                </td>
                
            </tr>
            <tr >
                <td width="100%">
                    <table cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                        <tr>
                            <td >
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="form">
                                    <tr style="margin-top:10px;">
                                        <td class="form-item" style="width: 10%">
                                            <font color="red">*</font>开始日期：
                                        </td>
                                        <td style="width: 40%">
                                            <asp:TextBox ID="txtSdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                        </td>
                                        <td class="form-item" style="width: 10%">
                                            <font color="red">*</font>截止日期：
                                        </td>
                                        <td style="width: 40%">
                                            <asp:TextBox ID="txtEdate" onclick="SelectDate(this,'yyyy-MM-dd')" runat="server"
                                                CssClass="mytext" Width="90%" MaxLength="10"></asp:TextBox>
                                        </td>
                                    </tr>
                              
                                
                                    <tr>
                                        
                                    <td class="form-item" style="width: 10%"> <font color="red">*</font>被考核人：
                                        </td>
                                        <td  style="width: 40%; height: 500px;">
                                            <div style="height:500px; overflow-y:scroll">
                                             <span style="padding: 10px">用户名称：</span>
                                             <asp:TextBox ID="query_content" runat="server" CssClass="mytext" Width="180" Height="38" Style="border-radius: 2px" onkeyup="onSearch(this.value,2)"></asp:TextBox>
                       
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                                                DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                <Columns>
                                                      <asp:TemplateField>
                                                            <HeaderStyle Width="20px"></HeaderStyle>
                                                            <ItemStyle Width="20px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall1" type="checkbox" onclick="chkAll1();" title="全选或全不选" style="width: 16;margin-left: 5px; height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="用户名称"></asp:BoundField>
                                                   
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>
                                                </div>
                                        </td>
                                          <td class="form-item" style="width: 10%"> <font color="red">*</font>考核事项：
                                        </td>
                                        <td style="width: 40%; height: 500px;">
                                            <div style="height:500px; overflow-y:scroll">
                                           
                                            <%--  <span style="padding: 10px">事项名称：</span>
                                             <asp:TextBox ID="query_content2" runat="server" CssClass="mytext" Width="180" Height="38" Style="border-radius: 2px" onchange="onSearch(this.value,2)" ></asp:TextBox>
                                        --%>        <asp:TreeView ID="TreeView1" runat="server" Font-Size="10pt" BorderStyle="None" ForeColor="black"
                                                    NodeWrap="True" ShowLines="true" ExpandDepth="2" ShowCheckBoxes="All">
                                                
                                                      </asp:TreeView>
                                                <asp:TextBox runat="server" ID="times_temp" style="display:none;"></asp:TextBox>
                                            <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False"
                                                DataKeyNames="ui_id" EmptyDataText="没有查到符合条件的数据！" Width="100%" CssClass="hkgv">
                                                <Columns>
                                                    <asp:TemplateField>
                                                            <HeaderStyle Width="20px"></HeaderStyle>
                                                            <ItemStyle Width="20px" Height="18px" HorizontalAlign="Center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall2" type="checkbox" onclick="chkAll2();" title="全选或全不选" style="width: 16; margin-left: 5px;height: 16" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="事项名称"></asp:BoundField>
                                                   
                                                </Columns>
                                                <RowStyle CssClass="hkRowStyle" />
                                                <HeaderStyle CssClass="hkHeadStyle" />
                                                <EmptyDataRowStyle CssClass="hkEmpRowStyle" />
                                            </asp:GridView>--%>
                                                </div>
                                        </td>
                                        
                              
                                    </tr>
                                    <tr>
                                        <td class="form-item">附件：
                                        </td>
                                        <td colspan="3" style="text-align:left">
                                             <asp:TextBox ID="fjname"  visable="true" runat="server" CssClass="mytext" Width="10%"></asp:TextBox>
                                           <input id="fj1" runat="server" type="file" multiple="multiple"  style="width: 80%; float:left" class="mytext" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="height: 30">
                                 <asp:Button CssClass="btn btn-primary" ID="SaveAddBtn" runat="server" Text="保存" OnClick="Save_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-success" ID="SaveBtn" runat="server" Text="保存并关闭" OnClick="Save_Click"></asp:Button>
                               <input type="button" name="BackBtn" value="关闭" class="btn btn-danger" onclick="javascript: window.close()" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblAttachSize" runat="server" Visible="false"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" EnableClientScript="true"
            ShowMessageBox="true" ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtSdate"
            ErrorMessage="请选择开始日期">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEdate"
            ErrorMessage="请选择截止日期">&nbsp;
        </asp:RequiredFieldValidator>
      
       
<%--          </ContentTemplate>
         </asp:UpdatePanel>--%>
    </form>
</body>

</html>