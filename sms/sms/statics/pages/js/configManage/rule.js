$(function () {
	//初始规则基本信息
	initRule();
	//绑定字段列下拉框
	bindSel();
	//初始数据日期定义
	initDate();
	//初始数据过滤定义
	initWhere();
	//初始数据分组定义
	initGroupby();
	//初始数据指标定义
	initHaving();
	
	//保存
	$("#btnSave").click(function(){
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
					$("#ruleName").val(data.ruleName);
					$("#status").val(data.status);
					$("#remark").val(data.remark);
					$("#createTime").val(data.createTimeStr);
					$("#createStaffName").val(data.createStaffName);
					$("#selFreq").val(data.ruleExecFreq);
				}else{
					alert("获取规则失败");
				}
			}
	});
}
//初始数据日期定义
function initDate(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, //true异步false同步
			url:GLOBAL.WEBROOT + "/configManage/getDateList.ajax",
			data:{
				ruleId:ruleId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var obj = $("#divDate").children();
					$.each(data.list, function (i, bean) {
						if(i!=0){
							addRow(obj);
							obj = obj.next();
						}				
						obj.find("[name='selDateCol']").val(bean.colName);
					});
				}else{
					alert("初始数据日期定义");
				}
			}
	});
}
//初始数据过滤定义
function initWhere(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, //true异步false同步
			url:GLOBAL.WEBROOT + "/configManage/getWhereList.ajax",
			data:{
				ruleId:ruleId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var obj = $("#divWhere").children();
					$.each(data.list, function (i, bean) {
						if(i!=0){
							addRow(obj);
							obj = obj.next();
						}				
						obj.find("[name='selWhereCol']").val(bean.colName);
						obj.find("[name='txtWhereCompare']").val(bean.colCompareType);
						obj.find("[name='txtwhereVlue']").val(bean.colCompareValue);
					});
				}else{
					alert("初始数据过滤定义");
				}
			}
	});
}
//初始数据分组定义
function initGroupby(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, //true异步false同步
			url:GLOBAL.WEBROOT + "/configManage/getGroupbyList.ajax",
			data:{
				ruleId:ruleId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var obj = $("#divGroupby").children();
					$.each(data.list, function (i, bean) {
						if(i!=0){
							addRow(obj);
							obj = obj.next();
						}				
						obj.find("[name='selGroupbyCol']").val(bean.colName);
					});
				}else{
					alert("初始数据过滤定义");
				}
			}
	});
}
//初始数据指标定义
function initHaving(){
	var ruleId = $("#ruleId").val();
	if(ruleId=="" || ruleId==0){
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, //true异步false同步
			url:GLOBAL.WEBROOT + "/configManage/getHavingList.ajax",
			data:{
				ruleId:ruleId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var obj = $("#divHaving").children();
					$.each(data.list, function (i, bean) {
						if(i!=0){
							addRow(obj);
							obj = obj.next();
						}				
						obj.find("[name='selHavingCol']").val(bean.colName);
						obj.find("[name='txtHavingCompare']").val(bean.colCompareType);
						obj.find("[name='txtHavingValue']").val(bean.colCompareValue);
					});
				}else{
					alert("初始数据过滤定义");
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
//绑定字段列下拉框
function bindSel(){
	var dirId = $("#dirId").val();
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/getDirdetailList.ajax",
			data:{
				dirId:dirId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var html="";
					$.each(data.list, function (i, bean) {
						html+="<option value='"+bean.colName+"' tabName='"+bean.tabName+"'>"+bean.colName+"</option>";
					});
					$("[name='selDateCol']").html(html);
					$("[name='selWhereCol']").html(html);
					$("[name='selGroupbyCol']").html(html);
					$("[name='selHavingCol']").html(html);
					$("[name='selDateCol']").val("");
					$("[name='selWhereCol']").val("");
					$("[name='selGroupbyCol']").val("");
					$("[name='selHavingCol']").val("");
				}else{
					alert("绑定字段列下拉框");
				}
			}
	});
}
//保存
function save(){
	//数据数据日期定义
	var dateList = new Array();
	$("[name='selDateCol']").each(function(i, o){
		if($(o).val()!=null && $(o).val()!=""){
			var bean = new Object();
		    bean.ruleId = $("#ruelId").val();
		    bean.colName= $(o).val();
		    bean.tabName= $(o).children("option:selected").attr("tabName");
		    bean.orderNo = i;
		    dateList[i] = bean;
		}		
	});
	if(dateList.length==0){
		alert("请选择数据日期定义");
		return;
	}
	//数据过滤定义
	var whereList = new Array();
	$("[name='selWhereCol']").each(function(i, o){
		if($(o).val()!=null && $(o).val()!=""){
			var bean = new Object();
		    bean.ruleId = $("#ruelId").val();
		    bean.colName= $(o).val();
		    bean.tabName= $(o).children("option:selected").attr("tabName");
		    bean.colCompareType= $(o).siblings("[name='txtWhereCompare']").val();
		    bean.colCompareValue= $(o).siblings("[name='txtwhereVlue']").val();
		    bean.orderNo = i;
		    whereList[i] = bean;
		}		
	});
	//数据分组定义
	var groupbyList = new Array();
	$("[name='selGroupbyCol']").each(function(i, o){
		if($(o).val()!=null && $(o).val()!=""){
			var bean = new Object();
		    bean.ruleId = $("#ruelId").val();
		    bean.colName= $(o).val();
		    bean.tabName= $(o).children("option:selected").attr("tabName");
		    bean.orderNo = i;
		    groupbyList[i] = bean;
		}		
	});
	//数据指标信息定义
	var havingList = new Array();
	$("[name='selHavingCol']").each(function(i, o){
		if($(o).val()!=null && $(o).val()!=""){
			var bean = new Object();
		    bean.ruleId = $("#ruelId").val();
		    bean.colName= $(o).val();
		    bean.tabName= $(o).children("option:selected").attr("tabName");
		    bean.colCompareType= $(o).siblings("[name='txtHavingCompare']").val();
		    bean.colCompareValue= $(o).siblings("[name='txtHavingValue']").val();
		   // alert(bean.colCompareValue);
		    bean.orderNo = i;
		    havingList[i] = bean;
		}		
	});
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/saveRule.ajax",
			data:{
				ruleId:$("#ruleId").val(),
				dirId:$("#dirId").val(),
				ruleName:$("#ruleName").val(),
				ruleExecFreq:$("#selFreq").val(),
				status:$("#status").val(),
				remark:$("#remark").val(),
				dateListJson:$.toJSON(dateList),
				whereListJson:$.toJSON(whereList),
				groupbyListJson:$.toJSON(groupbyList),
				havingListJson:$.toJSON(havingList)
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