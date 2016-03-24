$(function () {
	//初始规则基本信息
	initRule();
	
	//保存
	$("#btnIllgal").click(function(){
		save();
	});
	//关闭
	$("#btnClose").click(function(){
		closeLayer();
	});
});
//初始规则基本信息
function initRule(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, 
			url:GLOBAL.WEBROOT + "/configManage/getRule.ajax",
			data:{
				ruleId:ruleId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					$("#ruleName").html(data.ruleName);
					$("#status").html(data.status);
					$("#remark").html(data.remark);
					$("#createTime").html(data.createTimeStr);
					$("#createStaffName").html(data.createStaffName);
					$("#selFreq").html(data.ruleExecFreq);
				}else{
					alert("获取规则失败");
				}
			}
	});
	
	var illegalDetailHtml = "<tr class='lineborder'><td><input type='checkbox' id='illegalcheck' onchange='selectAll()'></td><td><b>序号</b></td><td><b>类别</b></td><td><b>详情</b></td></tr>";
	//显示模块列表
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/getSupModuleExt.ajax?ruleId="+$("#ruleId").val(),
			success:function (data) {
				if (data.ERRCODE == "0") {
					for(var i=0;i<data.list.length;i++){
						illegalDetailHtml+="<tr class='lineborder'><td><input type='checkbox' name='illegal' value='"+data.list[i].moduleId+"'";
						if(data.list[i].isChecked=="1"){
							illegalDetailHtml+=" checked='checked'";
						}
						illegalDetailHtml+=" /></td><td>"+data.list[i].moduleId+"</td><td>"+data.list[i].moduleName+"</td><td><a href='javascript:void(0);' onclick='showModule(\""+data.list[i].moduleId+"\",\""+data.list[i].moduleName+"\",\""+ruleId+"\",\""+data.list[i].isFix+"\")'>查看</a></td></tr>";
					}
					$("#illegalDetail").append(illegalDetailHtml);
				}else{
					alert("获取规则模板失败");
				}
			}
	});
}

function showModule(moduleId,moduleName,ruleId,isFix){
	if(isFix=='0'){
		layer.open({
	        type: 2,
	        title:moduleName+"信息",
	        area: ['800px', '300px'],
	        fix: false, //不固定
	        maxmin: true,
	        content: GLOBAL.WEBROOT + "/configManage/staticModule.html?moduleId="+moduleId+"&ruleId="+ruleId+"&orgId=1001"
    	});
	}else{
		layer.open({
	        type: 2,
	        title:moduleName+"信息",
	        area: ['800px', '300px'],
	        fix: false, //不固定
	        maxmin: true,
	        content: GLOBAL.WEBROOT + "/configManage/dynamicModule.html?moduleId="+moduleId+"&ruleId="+ruleId+"&orgId=1001"
    	});
	}
	
}

function selectAll(){
	$("[name='illegal']").prop("checked",$("#illegalcheck").prop("checked"));
}
//保存
function save(){
	//数据数据日期定义
	var spCodesTemp = "";
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$('input:checkbox[name=illegal]:checked').each(function(i){
       if(0==i){
        spCodesTemp = $(this).val();
       }else{
        spCodesTemp += (","+$(this).val());
       }
    });
	if(spCodesTemp==""){
		alert("请配置违规类别");
		return;
	}
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/saveModuleRule.ajax",
			data:{
				ruleId : ruleId,
				orgId : '1001',
				spCodesTemp:spCodesTemp
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					alert("保存成功");
					saveSuccess();
				}else{
					alert("保存失败");
				}
			}
	});
}
function saveSuccess(){
    parent.reloadGrid();
    closeLayer();
}
function closeLayer(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}