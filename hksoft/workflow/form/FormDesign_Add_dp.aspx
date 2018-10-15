<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormDesign_Add_dp.aspx.cs"
    Inherits="hkpro.workflow.form.FormDesign_Add_dp" %>

<html>
<head>
    <title>表单设计 - 设定下拉列表</title>
    <link href="../../CssJs/Main.css" type="text/css" rel="stylesheet" />
     <link href="../../bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="../../bootstrap/js/bootstrap.min.js"></script>
    <script>
        function dpSubmit()
        {
       
            var parent_window = parent.dialogArguments;
        
            var option_str="";
       
            for(i=1;i<=50;i++)
            {
                var item_str="item_"+i;
                if(document.all(item_str).value!="")
                    option_str+="<option name='"+document.all(item_str).value+"'>"+document.all(item_str).value+"</option>";
            }
            control_html="<select name=\""+itemname.value.replace("\"","&quot;")+"\">"+option_str+"</select>";

            if(edit_flag==1)
            {
                oSelection =  parent.dialogArguments.document.selection.createRange();
                oSelection(0).name=itemname.value;
                window.opener.hkTemplate(control_html);
            }
            else
                window.opener.hkTemplate(control_html);
            window.close();
        }                       

        //控件属性
        var edit_flag=0;
        function myLoad()
        {
            document.getElementById('itemname').value=<%=Request.QueryString["cValue"]%>;
        oSelection = dialogArguments.document.selection.createRange();
        sRangeType = dialogArguments.document.selection.type;
        if (sRangeType == "Control")
        {
            edit_flag=1;
            itemname.value = oSelection(0).name;

            for (i=0; i<oSelection(0).options.length; i++)
            {
                var item_str="item_"+(i+1);
                document.all(item_str).value =  oSelection(0).options(i).text;
            }
        }
        itemname.focus();
    }
    </script>
</head>
<body class="main" onload="myLoad();">
    <table border="1" cellspacing="0" width="100%" cellpadding="0" align="center">
        <tr>
            <td align="center" height="25">
                <b>序号</b>
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <b>请输入下拉列表的值</b>
            </td>
        </tr>
        <tr>
            <td align="center">1
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_1" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">2
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_2" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">3
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_3" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">4
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_4" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">5
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_5" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">6
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_6" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">7
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_7" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">8
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_8" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">9
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_9" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">10
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_10" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">11
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_11" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">12
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_12" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">13
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_13" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">14
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_14" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">15
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_15" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">16
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_16" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">17
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_17" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">18
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_18" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">19
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_19" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">20
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_20" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">21
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_21" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">22
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_22" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">23
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_23" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">24
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_24" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">25
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_25" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">26
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_26" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">27
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_27" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">28
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_28" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">29
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_29" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">30
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_30" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">31
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_31" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">32
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_32" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">33
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_33" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">34
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_34" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">35
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_35" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">36
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_36" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">37
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_37" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">38
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_38" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">39
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_39" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">40
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_40" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">41
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_41" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">42
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_42" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">43
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_43" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">44
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_44" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">45
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_45" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">46
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_46" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">47
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_47" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">48
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_48" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">49
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_49" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center">50
            </td>
            <td align="center" title="按Tab键可向下切换输入框">
                <input name="item_50" type="text" size="45" class="mytext">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2" height="25">
                <input name="itemname" type="text" size="20" style="display: none" id="itemname">
                <input type="button" onclick="dpSubmit();" value=" 确定 " class="btn btn-success">
                <input type="button" name="BackBtn" value=" 关闭 " class="btn btn-danger" onclick="javascript:window.close()" />
            </td>
        </tr>
    </table>
</body>
</html>
