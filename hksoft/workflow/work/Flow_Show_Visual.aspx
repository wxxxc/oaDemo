<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Flow_Show_Visual.aspx.cs"
    Inherits="hkpro.workflow.work.Flow_Show_Visual" %>
    
<html xmlns:vml="urn:schemas-microsoft-com:vml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="../Flow/cssjs/css.css" type="text/css" rel="stylesheet">
    <object id="vmlRender" classid="CLSID:10072CEC-8CC1-11D1-986E-00A0C955B42E" viewastext>
    </object>
    <style>
        vml\:*
        {
            font-size: 12px;
            behavior: url(#VMLRender);
        }
    </style>
    <script language="javascript" src="../Flow/cssjs/flow_view.js"></script>
    <script src="../../CssJs/MyJs.js" type="text/javascript" charset="gb2312"></script>
    <script language="javascript">
        function chkBrowser() {
            //��ȡ������汾
            var bstr = getBrowserType();
            //alert(bstr);
            if (bstr == '2' | bstr == '3' | bstr == '4' | bstr == '5') {
                alert("��Ǹ�����������õ�ǰ�������IE����ģʽ��װ��IE����󣬲�������ʹ�ô˹��ܣ�\r\n����˵���ɲο���ϵͳ��¼ҳ���·��ġ�������ظ����������˵�����ĵ���");
            }
        }
    </script>
    <meta content="MSHTML 6.00.3790.3041" name="GENERATOR">
    <title>�鿴����(ͼ����ͼ)</title>
</head>
<body oncontextmenu="nomenu();" onmousedown="rightclick();" leftmargin="2" topmargin="2" onload="chkBrowser();">
    <form id="form1" runat="server">
    <vml:line id="line1" style="display: none; z-index: 15; position: absolute" to="0,0"
        from="0,0">
    <vml:Stroke dashstyle="shortDash"></vml:Stroke></vml:line>
    <%=nlContent %>
    <%=lblContent %>
    <asp:TextBox ID="lblwfno" runat="server" Style="display: none"></asp:TextBox>
    </form>
</body>
</html>