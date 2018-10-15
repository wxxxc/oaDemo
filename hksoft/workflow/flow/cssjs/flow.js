//ͼ�λ����
var dragapproved = false;
var eventsource, x, y;
var popeventsource = "";
var temp1 = 0;
var temp2 = 0;

function nomenu() {
    event.cancelBubble = true
    event.returnValue = false;

    return false;
}

//��ʼ���ƶ�����
function nodrags() {
    dragapproved = false;
}

function move() {
    if (event.button == 1 && dragapproved) {
        var newleft = temp1 + event.clientX - x;
        var newtop = temp2 + event.clientY - y;
        eventsource.style.pixelLeft = newleft;
        eventsource.style.pixelTop = newtop;

        drawLine();

        return false;
    }
}

function drags() {
    if (event.button != 1)
        return;

    var objRect = event.srcElement;
    if (event.srcElement.tagName.toLowerCase() == 'textbox') objRect = event.srcElement.parentElement;

    if ((objRect.tagName == 'roundrect') && (!event.ctrlKey)) {
        dragapproved = true;
        eventsource = objRect;
        temp1 = eventsource.style.pixelLeft;
        temp2 = eventsource.style.pixelTop;
        x = event.clientX;
        y = event.clientY;
        document.onmousemove = move;
    }
}

//����
function drawLine() {
    var source;
    var object;
    var sourceObj;
    var objectObj;
    var x0, y0, x1, y1;
    var p0, p1;
    var a = document.getElementsByTagName('line');
    for (var i = 0; i < a.length; i++) {
        source = a[i].getAttribute('source');
        object = a[i].getAttribute('object');
        if ((source != null) && (object != null)) {
            sourceObj = document.getElementById(source);
            objectObj = document.getElementById(object);

            if ((sourceObj == null) || (objectObj == null)) continue;

            if (sourceObj.style.pixelLeft > objectObj.style.pixelLeft) {
                if ((sourceObj.style.pixelLeft - objectObj.style.pixelLeft) <= objectObj.style.pixelWidth) {
                    x0 = sourceObj.style.pixelLeft + sourceObj.style.pixelWidth / 2;
                    x1 = objectObj.style.pixelLeft + objectObj.style.pixelWidth / 2;
                    if (sourceObj.style.pixelTop > objectObj.style.pixelTop) {
                        y0 = sourceObj.style.pixelTop;
                        y1 = objectObj.style.pixelTop + objectObj.style.pixelHeight;
                    }
                    else {
                        y0 = sourceObj.style.pixelTop + sourceObj.style.pixelHeight;
                        y1 = objectObj.style.pixelTop;
                    }
                }
                else {
                    x0 = sourceObj.style.pixelLeft;
                    x1 = objectObj.style.pixelLeft + objectObj.style.pixelWidth;
                    y0 = sourceObj.style.pixelTop + sourceObj.style.pixelHeight / 2;
                    y1 = objectObj.style.pixelTop + objectObj.style.pixelHeight / 2;
                }
            }
            else {
                if ((objectObj.style.pixelLeft - sourceObj.style.pixelLeft) <= objectObj.style.pixelWidth) {
                    x0 = sourceObj.style.pixelLeft + sourceObj.style.pixelWidth / 2;
                    x1 = objectObj.style.pixelLeft + objectObj.style.pixelWidth / 2;
                    if (sourceObj.style.pixelTop > objectObj.style.pixelTop) {
                        y0 = sourceObj.style.pixelTop;
                        y1 = objectObj.style.pixelTop + objectObj.style.pixelHeight;
                    }
                    else {
                        y0 = sourceObj.style.pixelTop + sourceObj.style.pixelHeight;
                        y1 = objectObj.style.pixelTop;
                    }
                }
                else {
                    x0 = sourceObj.style.pixelLeft + sourceObj.style.pixelWidth;
                    x1 = objectObj.style.pixelLeft;
                    y0 = sourceObj.style.pixelTop + sourceObj.style.pixelHeight / 2;
                    y1 = objectObj.style.pixelTop + objectObj.style.pixelHeight / 2;
                }
            }

            a[i].from = String(x0) + ',' + String(y0);
            a[i].to = String(x1) + ',' + String(y1);

            a[i].style.pixelLeft = x0 + 'px';
            a[i].style.pixelTop = y0 + 'px';

            //����
            strIF = a[i].getAttribute('title');
            if ((strIF != null) && (strIF != '')) {
                var id = 'if_' + source + '_' + object;
                var obj = document.getElementById(id);

                var left = (x0 + (x1 - x0) / 2 - 30);
                var top = (y0 + (y1 - y0) / 2 - 15);

                if (obj != null) {
                    obj.style.pixelLeft = left + 'px';
                    obj.style.pixelTop = top + 'px';

                    obj.style.left = left + 'px';
                    obj.style.top = top + 'px';

                    obj.style.display = '';
                }
            }

            a[i].style.display = '';
        }
    }
}

//�����������
function document.onreadystatechange() {
    if (document.readyState == 'complete') {
        drawLine();
        document.onmousedown = drags;  //��ʼ�ƶ�
        document.onmouseup = nodrags;  //�����ƶ�
    }
}

// �γɲ˵���
function getMenuRow(s_Event, s_Html) {
    var s_MenuRow = "";
    s_MenuRow = "<tr><td align=center valign=middle nowrap><TABLE border=0 cellpadding=0 cellspacing=0 width=132><tr><td nowrap valign=middle height=20 class=MouseOut onMouseOver=this.className='MouseOver'; onMouseOut=this.className='MouseOut';";
    s_MenuRow += " onclick=\"parent." + s_Event + ";parent.oPopupMenu.hide();\"";
    s_MenuRow += ">&nbsp;";
    s_MenuRow += s_Html + "<\/td><\/tr><\/TABLE><\/td><\/tr>";
    return s_MenuRow;
}

//�Ҽ��˵�
var sMenuHr = "<tr><td align=center valign=middle height=2><TABLE border=0 cellpadding=0 cellspacing=0 width=128 height=2><tr><td height=1 class=HrShadow><\/td><\/tr><tr><td height=1 class=HrHighLight><\/td><\/tr><\/TABLE><\/td><\/tr>";
var sMenu1 = "<TABLE onmousedown='if (event.button==1) return true; else return false;' border=0 cellpadding=0 cellspacing=0 class=Menu width=150><tr><td width=18 valign=bottom align=center style='background:url(/images/bg_left.gif);background-position:bottom;'><\/td><td width=132 class=RightBg><TABLE border=0 cellpadding=0 cellspacing=0>";
var sMenu2 = "<\/TABLE><\/td><\/tr><\/TABLE>";
var oPopupMenu = null;
oPopupMenu = window.createPopup();

function showContextMenu(event, type) {
    var style = "";
    style = "BODY {margin:0px;border:0px}";
    style += " TD {font-size:9pt;font-family:����,Verdana,Arial}";
    style += " TABLE.Menu {border-top:window 1px solid;border-left:window 1px solid;border-bottom:buttonshadow 1px solid;border-right:buttonshadow 1px solid;background-color:#0072BC}";
    style += "TD.RightBg {background-color:buttonface}";
    style += "TD.MouseOver {background-color:highlight;color:highlighttext;cursor:default;}";
    style += "TD.MouseOut {background-color:buttonface;color:buttontext;cursor:default;}";
    style += "TD.HrShadow {background-color:buttonshadow;}";
    style += "TD.HrHighLight {background-color:buttonhighlight;}";
    style = "<style>" + style + "</style>";

    var width = 150;
    var height = 0;
    var lefter = event.clientX;
    var topper = event.clientY;

    var oPopDocument = oPopupMenu.document;
    var oPopBody = oPopupMenu.document.body;

    var objRect = event.srcElement;
    if (event.srcElement.tagName.toLowerCase() == 'textbox')
        objRect = event.srcElement.parentElement;

    var Process_ID = objRect.getAttribute('table_id');

    var sMenu = style;

    switch (type) {
        case 1:

            sMenu += getMenuRow("Edit_Step(" + Process_ID + ")", "�����������");
            height += 20;

            sMenu += getMenuRow("set_next(" + Process_ID + ")", "�ڴ˲�����׷��");
            height += 20;

            sMenu += getMenuRow("set_item(" + Process_ID + ")", "��д�ֶ�");
            height += 20;

            sMenu += getMenuRow("set_condition(" + Process_ID + ")", "��������");
            height += 20;

            sMenu += getMenuRow("set_user(" + Process_ID + ")", "������Ա");
            height += 20;

            sMenu += getMenuRow("set_dept(" + Process_ID + ")", "���첿��");
            height += 20;

            sMenu += getMenuRow("set_priv(" + Process_ID + ")", "�����ɫ");
            height += 20;

            sMenu += sMenuHr;
            height += 2;

            sMenu += getMenuRow("Del_Step(" + Process_ID + ")", "ɾ���ò���");
            height += 20;

            break;

        case 2:

            sMenu += getMenuRow("Add_Step()", "�½�����");
            height += 20;

            sMenu += sMenuHr;
            height += 2;

            sMenu += getMenuRow("SavePosition()", "���沼��");
            height += 20;

            sMenu += getMenuRow("Refresh()", "ˢ����ͼ");
            height += 20;

            break;
    }

    sMenu = sMenu1 + sMenu + sMenu2;

    height += 2;
    if (lefter + width > document.body.clientWidth) lefter = lefter - width + 2;
    if (topper + height > document.body.clientHeight) topper = topper - height + 2;

    oPopupMenu.document.body.innerHTML = sMenu;
    oPopupMenu.show(lefter, topper, width, height, document.body);

    return false;
}

//����һ�
function rightclick() {
    pub_x = event.clientX;
    pub_y = event.clientY;

    SetSel();

    var objRect = event.srcElement;
    if (event.srcElement.tagName.toLowerCase() == 'textbox') objRect = event.srcElement.parentElement;

    if (objRect.tagName.toLowerCase() == 'roundrect') {
        if (event.button == 2) return showContextMenu(event, 1);
    }
    else {
        if (objRect.tagName.toLowerCase() == 'line') {
            //if (event.button == 2) return showContextMenu(event,3);
        }
        else {
            if (event.button == 2) return showContextMenu(event, 2);
        }
    }
}

//ѡ����
function SetSel() {
    var flowType = '';
    var flowID = 0;
    var passCount = 0;
    var flowColor = '';
    var strStart = "#00EE00";
    var strEnd = "#F4A8BD";
    var strOut = "#EEEEEE";
    var strSelect = "#8E83F5";

    var vml = document.getElementsByTagName('roundrect');
    for (var i = 0; i < vml.length; i++) {
        flowType = vml[i].getAttribute('flowType');
        if (flowType == 'start') {
            flowColor = strStart;
        }
        else if (flowType == 'end') {
            flowColor = strEnd;
        }
        else {
            flowColor = strOut;
        }
        vml[i].fillcolor = flowColor;
    }

    var objRect = event.srcElement;
    if (event.srcElement.tagName.toLowerCase() == 'textbox')
        objRect = event.srcElement.parentElement;

    //��������
    try { if (objRect.tagName == 'roundrect') objRect.fillcolor = strSelect; } catch (e) { }
}


//ɾ��������
function SetSqlDelFlow(fid) {
    var strSql = '';
    strSql = "delete from office_missive_flow_run where office_missive_flow_run_id='" + fid + "' ";
    document.all('tbSQL').value += strSql;
}

//���沼��
function SavePosition() {
    var id = 0;
    var strSql = '';
    var mf_pixel_left = 0;
    var mf_pixel_top = 0;

    a = document.getElementsByTagName('roundrect');
    for (var i = 0; i < a.length; i++) {
        table_id = eval(a[i].getAttribute('table_id'));
        mf_pixel_left = a[i].style.pixelLeft;
        mf_pixel_top = a[i].style.pixelTop;

        if (table_id > 0) {
            strSql += "LeftMargin=" + mf_pixel_left + ",TopMargin=" + mf_pixel_top + " where fnID=" + table_id + ";";
        }
    }

    //document.form1.sql_layout.value += strSql;

    //var str11 = document.getElementById("sql_layout").value;
    var str11 = strSql;
    
    window.open("WorkFlow_Node_SaveLayOut.aspx?str=" + str11 + "", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")


}

//ɾ��������
function DelFlowRun(fid) {
    if ((fid == null) || (fid == 0)) return;

    SavePosition();
    SetSqlDelFlow(fid);

    document.all('btnSave').click();
}

//ˢ��
function Refresh() {
    location.href = location.href;
}

function LoadWindow(URL) {
    loc_x = (screen.availWidth - 700) / 2;
    loc_y = (screen.availHeight - 550) / 2;
    window.open(URL, "set_process", "height=550,width=700,status=1,toolbar=no,menubar=no,location=no,scrollbars=yes,top=" + loc_y + ",left=" + loc_x + ",resizable=yes");
}

//�½�����
function Add_Step() {
    var str11 = document.getElementById("lblwfno").value;
    LoadWindow("WorkFlow_Node_Add.aspx?FlowNumber=" + str11 + "");
}

//�༭��������
function Edit_Step(Process_ID) {
    LoadWindow("WorkFlow_Node_Base.aspx?ID=" + Process_ID);
}

function set_next(Process_ID) {
    var str11 = document.getElementById("lblwfno").value;
    LoadWindow("WorkFlow_Node_Append.aspx?FlowNumber=" + str11 + "&ID=" + Process_ID + "");
}


function set_item(Process_ID) {
    LoadWindow("WorkFlow_Node_Write.aspx?ID=" + Process_ID);
}

function set_condition(Process_ID) {
    LoadWindow("WorkFlow_Node_Branch.aspx?ID=" + Process_ID);
}

function set_user(Process_ID) {
    LoadWindow("WorkFlow_Node_Users.aspx?ID=" + Process_ID);
}

function set_dept(Process_ID) {
    LoadWindow("WorkFlow_Node_Depts.aspx?ID=" + Process_ID);
}

function set_priv(Process_ID) {
    LoadWindow("WorkFlow_Node_Roles.aspx?ID=" + Process_ID);
}

//ɾ������
function Del_Step(Process_ID) {
    msg = '��ȷ��Ҫɾ���˲�����';
    if (window.confirm(msg))
        window.open("WorkFlow_Node_Del.aspx?id=" + Process_ID + "", "_blank", "height=1, width=1,toolbar=no, menubar=no, scrollbars=no,resizable=yes,location=no, status=no")
}