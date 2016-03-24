$(function () {
	//初始目录基本信息
	initDir();
	//绑定业务表名下拉框
	bindSelTable($("#selYwbm"),"0");
	onChangeSelYwbm();
	//初始目录详细信息
	initDirdetail();
	
	//业务表名下拉改变事件
	$("#selYwbm").change(function(){
		onChangeSelYwbm();
	});
	//保存
	$("#btnSave").click(function(){
		save();
	});
	//关闭
	$("#btnClose").click(function(){
		closeLayer();
	});
});
//初始目录基本信息
function initDir(){
	var dirId = $("#dirId").val();
	$.ajax({
			type:"POST", 
			async:true, 
			url:GLOBAL.WEBROOT + "/configManage/getDir.ajax",
			data:{
				dirId:dirId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					$("#dirId").val(data.dirId);
					$("#dirName").val(data.dirName);
					$("#dirStatus").val(data.dirStatusStr);
					$("#remark").val(data.remark);
					$("#createTime").val(data.createTimeStr);
					$("#createStaffName").val(data.createStaffName);
				}else{
					alert("获取目录失败");
				}
			}
	});
}
//初始目录详细信息
function initDirdetail(){
	var dirId = $("#dirId").val();
	$.ajax({
			type:"POST", 
			async:true, 
			url:GLOBAL.WEBROOT + "/configManage/getDirdetailList.ajax",
			data:{
				dirId:dirId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var obj = $("#divRow");
					$.each(data.list, function (i, bean) {
						if(i!=0){
							addRow(obj);
							obj = obj.next();
						}				
						if(obj.children("[name='selTable']").val()!=bean.tabName){
							obj.children("[name='selTable']").val(bean.tabName);
							bindSelCol(obj.children("[name='selCol']"),bean.tabName);
						}
						obj.children("[name='selCol']").val(bean.colName);
						obj.children("[name='selOrder']").val(bean.isOrder);
						obj.children("[name='selSelect']").val(bean.isSelect);
						obj.children("[name='txtCompare']").val(bean.compareChar);
					});
				}else{
					alert("获取目录详细信息失败");
				}
			}
	});
}
//绑定业务表名下拉框
function bindSelTable(obj,tableType){
	$.ajax({
		type:"POST", 
		async:false, 
		url:GLOBAL.WEBROOT + "/configManage/getMedicalTableList.ajax",
		data:{
			tableType:tableType//表类型（0 业务表 1字典表）
		},
		success:function (data) {
			if (data.ERRCODE == "0") {
				var html = "";
				if(tableType=="1"){
					html += $("#selYwbm").find("option:selected").prop("outerHTML");
				}
				$.each(data.list, function (i, bean) {
					html += "<option value='"+bean.tableEnname+"'>"+bean.tableChname+"("+bean.tableEnname+")</option>";
				});
				$(obj).html(html);
				if(tableType=="1"){
					bindSelCol($("[name=selCol]"),$("[name=selTable]").val())
				}
			}
		}
	});
}
//绑定列下拉框
function bindSelCol(obj,tableName){
	$.ajax({
		type:"POST", 
		async:false, 
		url:GLOBAL.WEBROOT + "/configManage/getMedicalColConfigList.ajax",
		data:{
			tabName:tableName
		},
		success:function (data) {
			if (data.ERRCODE == "0") {
				var html = "";
				$.each(data.list, function (i, bean) {
					html += "<option value='"+bean.colName+"'>"+bean.colChnName+"("+bean.colName+")</option>";
				});
				$(obj).html(html);
			}
		}
	});
}
//业务表名下拉改变事件
function onChangeSelYwbm(){
	bindSelTable($("[name='selTable']"),"1");
}
var rowCount = 1;
//插入一行
function addRow(obj){
	var html = $(obj).prop("outerHTML");
	$(obj).after(html);
	rowCount ++;
}
//删除一行
function delRow(obj){
	if(rowCount==1){
		alert("至少保留一行");
		return;
	}
	$(obj).remove();
	rowCount --;
}
//保存
function save(){
	var list = new Array();
	$("[name='selTable']").each(function(i, o){
		var dirDetail = new Object();
	    dirDetail.tabName = $(o).val();
	    dirDetail.dirId = $("#dirId").val();
	    dirDetail.colName= $(o).siblings("[name='selCol']").val();
	    dirDetail.isOrder= $(o).siblings("[name='selOrder']").val();
	    dirDetail.isSelect= $(o).siblings("[name='selSelect']").val();
	    dirDetail.compareChar= $(o).siblings("[name='txtCompare']").val();
	    list[i] = dirDetail;
	});
	var dirDetailListJson = $.toJSON(list);
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/saveDirDetail.ajax",
			data:{
				dirDetailListJson:dirDetailListJson
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
    closeLayer();
}
function closeLayer(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}