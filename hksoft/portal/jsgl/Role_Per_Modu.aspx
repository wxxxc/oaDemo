<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Role_Per_Modu.aspx.cs"
    Inherits="hkpro.portal.jsgl.Role_Per_Modu" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>角色管理 - 模块权限</title>
    <link href="../../CssJs/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../CssJs/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="../../CssJs/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="../../CssJs/jquery.ztree.excheck-3.5.js"></script>
    <script language="javascript" type="text/javascript">
        //设置
        var setting = {
            check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
                //beforeClick: beforeClick,
                onCheck: onCheck
            }
        };
        
        //赋值
        var zNodes=<%=seriesData.ToString()%>;
        $(document).ready(function(){
            $.fn.zTree.init($("#treeModu"), setting, zNodes);
        });
        
        //单击事件
        function beforeClick(treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("treeModu");
            zTree.checkNode(treeNode, !treeNode.checked, null, true);
            return false;
        }
        
        //复选框事件
        function onCheck(e, treeId, treeNode) {
            //当前选中的节点ID、名称、复选框状态
            //alert(treeNode.id + ", " + treeNode.name + "," + treeNode.checked);
            
            var zTree = $.fn.zTree.getZTreeObj("treeModu"),
            nodes = zTree.getCheckedNodes(true),
            v = "";
            var txtID = "";
            for (var i=0, l=nodes.length; i<l; i++) {
                v += nodes[i].name + ",";
                txtID += nodes[i].id + ",";
            }
            if (v.length > 0 ) v = v.substring(0, v.length-1);
            
            //节点名称
            //var McObj = $("#txtMc");
            //McObj.attr("value", v);
            
            //节点ID
            var hidObj = $("#hidSaveId");
            hidObj.attr("value",txtID);
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                    <tr>
                        <td style="height: 40px">
                            设置『<asp:Label ID="LabelRole" runat="server" />』的模块权限
                        </td>
                        <td align="right">
                            <asp:Button ID="SaveBtn" runat="server" Text="保 存" OnClick="Save_Click" CssClass="mybtn" />
                            <input type="button" class="mybtn" name="BackBtn" value="返 回" onclick="javascript:location.href='role.aspx'" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul id="treeModu" class="ztree">
                            </ul>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:HiddenField ID="hidSaveId" runat="server" />
    </form>
</body>
</html>
