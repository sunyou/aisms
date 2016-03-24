$(function () {
	//初始查询条件
	initQuery();
	//初始列表
	initGrid();
	//绑定下拉框
	$("select[name='txtWhere']").each(function(i,o){
		bindSelect(o);
	});
});
//初始查询条件
function initQuery(){
	var dirId = $("#dirId").val();
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/getDirdetailList.ajax",
			data:{
				dirId:dirId,
				isSelect:"1"
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					var minColNum = data.list.length%4;//最小列数
					var addColNum = 0;//需要增加的列数
					if(minColNum>0 && minColNum<4){
						addColNum = 4-minColNum;
					}
					var html = "";
					$.each(data.list, function (i, bean) {
						if(i%4==0){
							html+="<tr>";
						}
	                    html+="<td>"+bean.colChnName+"：</td>";
	                    html+="<td>"
	                    if(bean.whereInputType==0){
	                    	html+="<input type='text' name='txtWhere' colName='"+bean.colName+"' compareChar='"+bean.compareChar+"'/>";
	                    }else{
	                    	html +="<select name='txtWhere' colName='"+bean.colName+"' compareChar='"+bean.compareChar+"' dictType='"+bean.selectType+"'></select>";
	                    }
	                    html+="</td>";
	                    if((i!=0 && i%3==0) || i==data.list.length-1){
							html+="</tr>";
						}
					});
					var obj = $("#tableQuery").find("tr");
					obj.before(html);
					if(addColNum>0){
						var addColHtml = "";
						for(var i=0;i<addColNum;i++){
							addColHtml+="<td></td><td></td>";
						}
						obj.prev("tr").append(addColHtml);
					}
				}else{
					alert("初始查询条件失败");
				}
			}
	});
}
//绑定下拉框
function bindSelect(obj){
	var dictType = $(obj).attr("dictType");
	$.ajax({
		type:"POST", 
		async:true, 
		url:GLOBAL.WEBROOT + "/configManage/getDictList.ajax",
		data:{
			dictType:dictType
		},
		success:function (data) {
			if (data.ERRCODE == "0") {
				var html = "<option value=''>--请选择--</option>";
				$.each(data.list, function (i, bean) {
					html +="<option value='"+bean.code+"'>"+bean.value+"</option>";
				});
				$(obj).html(html);
			}else{
				alert("获取字典失败");
			}
		}
	});
}
//初始列表
function initGrid() {
	var dirId = $("#dirId").val();
	var colNames = [];
	var colModel = new Array();
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/getDirdetailList.ajax",
			data:{
				dirId:dirId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					$.each(data.list, function (i, bean) {
						colNames[i]=bean.colChnName;
						
						var col = new Object();
						col.name=bean.colName.toLowerCase();
						col.index=bean.colName;
						col.sortable=false;
						col.fixed=false;
						col.width=100;
						col.align="center";
						colModel[i]=col;
					});
				}else{
					alert("初始列表失败");
				}
			}
	});
	
	var grid_selector = "#tableList";
    var pager_selector = "#divPager";
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT + "/configManage/getPublicListJqgrid.ajax",
        mtype : "post",
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :{
				dirId:dirId,
				wheres:getWheres()
			},
        colNames: colNames,
        colModel: colModel,
        viewrecords: false,
        rowNum:10,
        rowList:[10,15,20,30],
        multiselect: false,
        multiboxonly: true,
        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
        },
        autowidth: true
    }).jqGrid("navGrid",pager_selector,{refresh: true});
}
//查询
function reloadGrid(){
	$("#tableList").jqGrid('setGridParam', {postData: {wheres:getWheres()},page:1,pageSize:10}).trigger("reloadGrid");
}
//获取where条件参数
function getWheres(){
	var wheres = "";
	$("[name='txtWhere']").each(function(i, o){
		if($(o).val()!=null && $(o).val()!=""){
			wheres+=" and "+$(o).attr("colName")+$(o).attr("compareChar")+$(o).val();
		}		
	});
	return wheres;
}
//重置
function reset(){
	$("[name='txtWhere']").val("");
}