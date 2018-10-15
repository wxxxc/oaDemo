/**hkWebApp**/
$.mobile.transitionFallbacks.slide = "none";
$.mobile.buttonMarkup.hoverDelay = "false";
function goTo(page) {
	showLoading();
	$.mobile.changePage(page, {
		  transition: "slide"
		});
}
function goBack() {
	$.mobile.back();
}

function showLoading(){
	$.mobile.loadingMessageTextVisible = true;
	$.mobile.showPageLoadingMsg("a", "加载中..." );
}


function hideLoading(){
	$.mobile.hidePageLoadingMsg();
}

function errpic(thepic) {
	thepic.src = "../../images/no_pic.png" 
}

function getUrlParam(string) {  
    var obj =  new Array();  
	    if (string.indexOf("?") != -1) {  
	        var string = string.substr(string.indexOf("?") + 1); 
	        var strs = string.split("&");  
	        for(var i = 0; i < strs.length; i ++) {  
	            var tempArr = strs[i].split("=");  
	            obj[i] = tempArr[1];
	        }  
	    }  
	    return obj;  
} 

//init iscroll
var myScroll;
function initMyScroll(id){
	function loaded() {
		if(myScroll!=null){
			myScroll.destroy();
		}
		myScroll = new iScroll(id,{checkDOMChange:false});
	}
}

//通用弹窗1:用户
function openUserWin(str) {
    win = window.open(str, "选择用户", 'width=300,height=300,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 300) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
    win.focus();
}

//通用弹窗2:用户
function chooseuser_m() {
    var num = Math.random();
    var str = "" + document.getElementById('txt_wUserIDs').value + "";
    window.open("../../Choose_A/portal/ChooseUser.aspx?tmp=" + num + "&rqstr=" + str + "", 'window', 'width=300,height=300,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 300) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
}
function setValue(str) {
    var arr = str.split("|");
    for (var i = 0; i < arr.length; i++) {
        document.getElementById("txt_wUserIDs").value = arr[0];
        document.getElementById("txt_wUserNames").value = arr[1];
    }
}

//flow弹窗:部门
function choosedept() {
    var num = Math.random();
    var str = "" + document.getElementById('txt_wDeptIDs').value + "";
    var str1 = "" + document.getElementById('txt_wUserIDs').value + "";
    window.open("../../Choose_A/flow/ChooseUser_WorkDept.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", 'window', 'width=300,height=300,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 300) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
}
function setValue_workdept(str) {
    var arr = str.split("|");
    for (var i = 0; i < arr.length; i++) {
        document.getElementById("txt_wUserIDs").value = arr[0];
        document.getElementById("txt_wUserNames").value = arr[1];
    }
}

//flow弹窗:角色
function chooserole() {
    var num = Math.random();
    var str = "" + document.getElementById('txt_wRoleIDs').value + "";
    var str1 = "" + document.getElementById('txt_wUserIDs').value + "";
    window.open("../../Choose_A/flow/ChooseUser_WorkRole.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", 'window', 'width=300,height=300,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 300) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
}
function setValue_workrole(str) {
    var arr = str.split("|");
    for (var i = 0; i < arr.length; i++) {
        document.getElementById("txt_wUserIDs").value = arr[0];
        document.getElementById("txt_wUserNames").value = arr[1];
    }
}

//flow弹窗:用户
function openUser() {
    var num = Math.random();
    var str = "" + document.getElementById('OwUserIDs').value + "";
    var str1 = "" + document.getElementById('txt_wUserIDs').value + "";
    window.open("../../Choose_A/flow/ChooseUser_WorkUser.aspx?tmp=" + num + "&rqstr=" + str + "&usernamestr=" + str1 + "", 'window', 'width=300,height=300,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 300) / 2 + ',resizeable=no,scrollbars=yes,menubar=no,status=yes;');
}
function setValue_workuser(str) {
    var arr = str.split("|");
    for (var i = 0; i < arr.length; i++) {
        document.getElementById("txt_wUserIDs").value = arr[0];
        document.getElementById("txt_wUserNames").value = arr[1];
    }
}
