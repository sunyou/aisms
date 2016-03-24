  
$(function () {
	//initDict();
});
 
//操作
function view(id,type) {
	var url ;
	var title ;
	if(type=="query"){
		title="查看人员信息";
		url="/sms/drugreuse/view.html?id="+id+"&type="+type;
		//所有控件不可用
	}else if(type=="update"){
		title = "修改人员信息";
		url="/sms/drugreuse/view.html?id="+id+"&type="+type;
	}else{
		title = "新增人员信息";
		url="/sms/drugreuse/view.html?id="+id+"&type="+type;
	}
    var index = layer.open({
        type: 2,
        title:title,
        area: ['800px', '500px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + url
    });
//    layer.full(index);
}


