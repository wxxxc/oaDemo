$(function () {
    window.Modal = function () {
        var reg = new RegExp("\\[([^\\[\\]]*?)\\]", 'igm');
        var alr = $("#fsk-alert");
        var ahtml = alr.html();

        var _alert = function (options) {
            alr.html(ahtml);    // 复原
            alr.find('.ok').removeClass('btn-success').addClass('btn-primary');
            alr.find('.cancel').hide();
            _dialog(options);

            return {
                on: function (callback) {
                    if (callback && callback instanceof Function) {
                        alr.find('.ok').click(function () { callback(true) });
                    }
                }
            };
        };

        var _confirm = function (options) {
            alr.html(ahtml); // 复原
            alr.find('.ok').removeClass('btn-primary').addClass('btn-success');
            alr.find('.cancel').show();
            _dialog(options);

            return {
                on: function (callback) {
                    if (callback && callback instanceof Function) {
                        alr.find('.ok').click(function () { callback(true) });
                        alr.find('.cancel').click(function () { callback(false) });
                    }
                }
            };
        };

        var _dialog = function (options) {
            var ops = {
                msg: "提示内容",
                title: "操作提示",
                btnok: "确定",
                btncl: "取消"
            };

            $.extend(ops, options);

            console.log(alr);

            var html = alr.html().replace(reg, function (node, key) {
                return {
                    Title: ops.title,
                    Message: ops.msg,
                    BtnOk: ops.btnok,
                    BtnCancel: ops.btncl
                }[key];
            });

            alr.html(html);
            alr.modal({
                width: 500,
                backdrop: 'static'
            });
        }

        return {
            alert: _alert,
            confirm: _confirm
        }

    }();
});

function gettask_index(obj, q_type) {
    $("#txt_query").val(q_type);
    $("#btn_query").click();
    $(obj).siblings().each(function () {
        $(this).removeClass("active");
    });
    $(obj).addClass("active");
}

//消息
function gettask_msg(obj, m_type) {
    $("#txt_query").val(m_type);
    $("#btn_query").click();
    $(obj).siblings().each(function () {
        $(this).removeClass("active");
    });
    $(obj).addClass("active");
}

//收件人
function get_select_userj() {
    var ids = "";
    var descs = "";
    $("#d_user .input_check:checked").each(function () {
        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
        //alert($(this).attr("id"));
        //alert(u);
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#jsr").val(descs);
    $("#jsr_real").val(ids);
}

//接收人
function get_select_user() {
    var ids = "";
    var descs = "";
    $("#d_user .input_check:checked").each(function () {
        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#jsdx").val(descs);
    $("#jsdx_real").val(ids);
}

//牵头领导
function get_select_qtld() {
    var ids = "";
    var descs = "";
    $("#d_user1 .input_check:checked").each(function () {

        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#qtld").val(descs);
    $("#qtld_real").val(ids);
}
//责任领导
function get_select_zrld() {
    var ids = "";
    var descs = "";
    $("#d_user2 .input_check:checked").each(function () {
        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#zrld").val(descs);
    $("#zrld_real").val(ids);
}

//责任人
function get_select_zrr() {
    var ids = "";
    var descs = "";
    $("#d_user3 .input_check:checked").each(function () {
        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#zrr").val(descs);
    $("#zrr_real").val(ids);
}
//牵头部门
function get_select_qtbm() {
    var ids = "";
    var descs = "";
    $("#d_user4 .input_check:checked").each(function () {
        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#qtbm").val(descs);
    $("#qtbm_real").val(ids);
}
//责任部门
function get_select_zrbm() {
    var ids = "";
    var descs = "";
    $("#d_user5 .input_check:checked").each(function () {
        ids = ids + $(this).attr("id") + ",";
        descs = descs + $(this).attr("data-desc") + ",";
    });
    ids = ids.substr(0, ids.length - 1);
    descs = descs.substr(0, descs.length - 1);
    $("#zrbm").val(descs);
    $("#zrbm_real").val(ids);
}



//手机端底部图标单击事件
function dj(dom) {
    var icons = $(".my_bottom_icon");
    var texts = $(".my_bottom_text");
    $.each(icons, function () {
        $(this).removeClass("end");
        $(this).addClass("start");
    });
    $.each(texts, function () {
        $(this).removeClass("end");
        $(this).addClass("start");
    });
    $(dom).removeClass("start");
    $(dom).addClass("end");
    $(dom).siblings().each(function () {
        $(this).removeClass("start");
        $(this).addClass("end");
    });
}
