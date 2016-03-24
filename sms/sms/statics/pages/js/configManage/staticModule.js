$(function () {
	initTableCol();
	
	initData();
	
	//保存
	$("#btnStaticConfig").click(function(){
		save();
	});
	//关闭
	$("#btnClose").click(function(){
		closeLayer();
	});
});

function saveSuccess(){
    closeLayer();
}
function closeLayer(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

function initTableCol(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	var moduleId = $("#moduleId").val();
	if(moduleId=="" || moduleId==0){
		return;
	}
	var tabName = $("#tabName").val();
	if(tabName=="" || tabName==0){
		return;
	}
	//初始化下拉框
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/getColConfig.ajax",
			data:{
				ruleId:ruleId,
				moduleId:moduleId,
				tabName:tabName,
				orgId : '1001'
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var selectOptionHtml = ""; 
					$.each(data.list, function (i, bean) {
						selectOptionHtml+="<option value='"+bean.colName+"'>"+bean.colName+"</option>";
					});
					$("[name='selStaicCol']").html(selectOptionHtml);
					$("[name='selStaicCol']").val("");
				}else{
					layer.msg('获取信息失败', {icon: 5});
				}
			}
	});
	
}

function initData(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, //true异步false同步
			url:GLOBAL.WEBROOT + "/configManage/initMedicalDetail.ajax",
			data:{
				ruleId:ruleId,
				moduleId:$("#moduleId").val(),
				orgId:'1001'
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var obj = $("#divStatic").children();
					$.each(data.list, function (i, bean) {
						if(i!=0){
							addRow(obj);
							obj = obj.next();
						}				
						obj.find("[name='selStaicCol']").val(bean.colName);
					});
				}else{
					alert("初始静态表列定义");
				}
			}
	});
}

function save(){
	var flag=false;
	var spCodesTemp= new Array();
	var cols="";
	$("[name='selStaicCol']").each(function(i, o){
		if($(o).val()!=null && $(o).val()!=""){
			if($.inArray($(this).val(),spCodesTemp)!=-1){
				layer.msg($(this).val()+'列重复，请重新选择', {icon: 5});
				flag=true;
				return ;
			}else{
				spCodesTemp[i]=$(this).val();
				if(0==i){
		          cols = $(this).val();
		         }else{
		          cols += (","+$(this).val());
		        }
			}
		}	
			
	});
	if(flag){
		return;
	}
//	alert(cols);
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/saveMedicalDetail.ajax",
			data:{
				ruleId:$("#ruleId").val(),
				moduleId:$("#moduleId").val(),
				colNames:cols,
				orgId:'1001'
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					layer.msg('保存成功', {icon: 1});
					saveSuccess();
				}else{
					layer.msg('保存失败', {icon: 5});
				}
			}
	});
	
}
//插入一行
function addRow(obj){
	var html = $(obj).prop("outerHTML");
	$(obj).after(html);
}
//删除一行
function delRow(obj){
	if($(obj).siblings().length==0){
		$(obj).children().val("");
		return;
	}
	$(obj).remove();
}