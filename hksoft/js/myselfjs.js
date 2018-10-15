function mytab_li_init_click(obj) {
    var $obj = $(obj);
    var this_li = $obj.parent();
    var lis = this_li.parent().children();
    lis.each(function () {
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
        }
    });
    this_li.addClass("active");

    var div_id = $obj.attr("href").substr(1);
    var this_div = $("#" + div_id);
    var divs = this_div.parent().children();
    divs.each(function () {
        if ($(this).hasClass("active")) {
            $(this).removeClass("active");
        }
    });
    this_div.addClass("active");

    $("#bread_crumb_title_li").text($obj.text());
}

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

function logout() {
    Modal.confirm(
  {
      msg: "确定退出系统？"
  })
  .on(function (e) {
      //点击“确定” e: true;点击“取消” e: false
      if (e) {
          $("#fsk_logout").click();
      }
  });
}

function showmsg(msgid, fjr, content, fjsj) {
    // 四个选项都是可选参数
    Modal.alert(
      {
          msg: content + "<br>" + fjsj,
          title: '发件人:' + fjr,
          btnok: '已读',
          btncl: '取消'
      })
    .on(function (e) {
        //点击“确定” e: true;点击“取消” e: false
        if (e) {
            $("#txt_msgid").val(msgid);
            $("#btn_readmsg").click();
        }
    });
}

function getmsgs() {
    $("#btn_getmsgs").click();
}

function set_pftimes(dom) {
    var times = $(dom).val();
    var id = $(dom).attr("id");
    var v = $("#times_temp").val();
    v = v + id + "|" + times + ";";
    $("#times_temp").val(v);
}