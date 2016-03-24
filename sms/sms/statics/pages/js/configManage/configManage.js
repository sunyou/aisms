$(function () {
	//绑定树
	bindTree();
	//清空目录数据
	clearDir()
	//加载目录列表
	getRuleList();
	//展示管理
	$("#btnShowDir").click(function(){
		showDir();
	});
	//新增目录
	$("#btnAddDir").click(function(){
		addDir();
	});
	//修改
	$("#btnModifyDir").click(function(){
		modifyDir();
	});
	//删除目录
	$("#btnDelDir").click(function(){
		delDir();
	});
	//修改规则
	$("#btnViewRule").click(function(){
		modifyRule();
	});
	//新增规则
	$("#btnAddRule").click(function(){
		addRule();
	});
	//修改规则
	$("#btnModifyRule").click(function(){
		modifyRule();
	});
	//删除规则
	$("#btnDelRule").click(function(){
		delRule();
	});
	//启用规则
	$("#btnEnableRule").click(function(){
		enableRule("0");
	});
	//停用规则
	$("#btnDisableRule").click(function(){
		enableRule("1");
	});
	//违规详情配置
	$("#btnIllegalRule").click(function(){
		illegalRule();
	});
	//节点选中时触发
	$('#tree1').on('opened', function (evt, data) {
		selDir(data.dirId);
	});
	$('#tree1').on('closed', function (evt, data) {
		selDir(data.dirId);
	});
    $('#tree1').on('selected', function (evt, data) {
    	selDir(data.info[0].dirId);
	});
    //右键菜单
    $("#tree1").bind("contextmenu", function(e){
    	$('tree1').trigger('mousedown', ['left']);
        $("#divMenu").css({"left":e.pageX,"top":e.pageY})
    	$("#divMenu").show();
        return false;
    });
    $(document).click(function(){
    	$("#divMenu").hide();
    }); 
});
//绑定树
function bindTree(){
	$("#tree1").html("");
	var remoteDateSource  = function(options, callback) {
		var self = this;
		var $data = {};
	
		if(!("name" in options) && !("type" in options)){
			//根节点
			$data = {'阳光医药监管' : {dirId:0,name: '阳光医药监管', type: 'folder', 'icon-class':'red'}};
			callback({ data: $data });
			return;
		}
		else if("type" in options && options.type == "folder") {
				$.ajax({
					type:"POST", 
					async:false, 
					url:GLOBAL.WEBROOT + "/configManage/getDirList.ajax",
					data:{
						parentId:options.dirId,
						menuType:"1"
					},
					success:function (data) {
						if (data.ERRCODE == "0") {
							$.each(data.dirList, function (i, bean) {
								var obj = new Object();
								obj.dirId = bean.dirId;
								if(bean.dirType=="0"){
									//目录
									obj.name = bean.dirName;
									obj.type = "folder";
									obj["icon-class"] = "pink";
								}else{
									//节点
									obj.name = "<i class='icon-file-text blue'></i>" + bean.dirName;
									obj.type = "item";
								}
								$data[i] = obj;
							});
						}
					}
				});
		}
		if($data != null)
			setTimeout(function(){callback({ data: $data });} , parseInt(Math.random() * 500) + 200);
	};
	$('#tree1').ace_tree({
			dataSource: {data: remoteDateSource} ,
			loadingHTML:'<div class="tree-loading"><i class="icon-refresh icon-spin blue"></i></div>',
			'open-icon' : 'icon-folder-open',
			'close-icon' : 'icon-folder-close',
			'selectable' : true,
			'selected-icon' : null,
			'unselected-icon' : null
		});
}
//新增目录
function addDir(){
	layer.open({
        type: 2,
        title:"新增目录",
        area: ['600px', '180px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/configManage/addDir.html?parentId="+$("#dirId").val()
    });
}
//修改目录
function modifyDir(){
	layer.open({
        type: 2,
        title:"修改目录",
        area: ['600px', '180px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/configManage/addDir.html?dirId="+$("#dirId").val()
    });
}
//清空目录数据
function clearDir(){
	$("#dirId").val("0");
	$("#parentId").val("0");
	$("#dirName").val("");
	$("[name='dirStatus'][value='0']").attr("checked","checked");
	$("#remark").val("");
	$("#createTime").val("");
	$("#createStaffName").val("");
	reloadGrid();
}
//选中目录
function selDir(dirId){
	if(dirId=="" || dirId=="0"){
		clearDir();
		return;
	}
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
					$("#parentId").val(data.parentId);
					$("#dirName").val(data.dirName);
					$("[name='dirStatus'][value='"+data.dirStatus+"']").attr("checked","checked");
					$("#remark").val(data.remark);
					$("#createTime").val(data.createTimeStr);
					$("#createStaffName").val(data.createStaffName);
					reloadGrid();
				}else{
					alert("获取目录失败");
				}
			}
	});
}
//删除目录
function delDir(){
	var dirId = $("#dirId").val();
	if(dirId=="" || dirId=="0"){
		alert("请选择要删除的目录'");
		return;
	}
	if(!confirm("确定要删除"+$("#dirName").val()+"吗?")){
		return;
    }
	$.ajax({
			type:"POST", 
			async:true, 
			url:GLOBAL.WEBROOT + "/configManage/saveDir.ajax",
			data:{
				dirId:dirId,
				dataStatus:"1"
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					alert("删除成功");
					location.reload();
				}else{
					alert("删除失败");
				}
			}
	});
}
//违规详情配置
function illegalRule(){
	var dirId = $("#dirId").val();
	var selRowId = $("#tableRule").jqGrid("getGridParam","selrow");
	var ruleId = $("#tableRule").jqGrid("getCell",selRowId,"ruleId");
	if(ruleId=="" || ruleId=="0" || ruleId==undefined){
		alert("请选择规则");
		return;
	}
	var index = layer.open({
        type: 2,
        title:"违规详情配置",
        area: ['800px', '300px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/configManage/illegalDetail.html?dirId="+dirId+"&ruleId="+ruleId
    });
	layer.full(index);
}

//展示管理
function showDir() {
	var dirId = $("#dirId").val();
	if(dirId=="" || dirId=="0"){
		alert("请选择要展示管理的节点");
		return;
	}
    layer.open({
        type: 2,
        title:"类别展示管理",
        area: ['783px', '500px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/configManage/dirDetail.html?dirId="+dirId
    });
}
//查询列表
function getRuleList() {
	var grid_selector = "#tableRule";
    var pager_selector = "#divRule_pager";
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT + "/configManage/getRuleListJqgrid.ajax",
        mtype : "post",
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :{
				dirIdChild:$("#dirId").val()
			},
        colNames: ['ruleId','规则名称', '规则描述','状态', '建立人', '建立时间'],
        colModel: [
        	{name: 'ruleId', index: 'ruleId', sortable: false,fixed:false,width:130,align:'center',hidden:true},
            {name: 'ruleName', index: 'ruleName', sortable: false,fixed:false,width:130,align:'center'},
            {name: 'remark', index: 'remak', sortable: false,resizable:true,fixed:false,width:80,align:'center'},
            {name: 'statusStr', index: 'statusStr',  sortable: false,align:'center',resizable:true,fixed:false,width:150},
            {name: 'createStaffName', index: 'createStaffName', sortable: false,width:100},
            {name: 'createTimeStr', index: "createTimeStr", sortable: false,align:'left',width:100}
        ],
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
function reloadGrid(){
	$("#tableRule").jqGrid('setGridParam', {postData: {dirIdChild:$("#dirId").val()},page:1,pageSize:10}).trigger("reloadGrid");
}
//新增规则
function addRule(dirId) {
	var dirId = $("#dirId").val();
	if(dirId=="" || dirId=="0"){
		alert("请选择目录");
		return;
	}
    layer.open({
        type: 2,
        title:"规则管理",
        area: ['783px', '500px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/configManage/rule.html?dirId="+dirId
    });
}
//修改规则
function modifyRule() {
	var dirId = $("#dirId").val();
	var selRowId = $("#tableRule").jqGrid("getGridParam","selrow");
	var ruleId = $("#tableRule").jqGrid("getCell",selRowId,"ruleId");
	if(ruleId=="" || ruleId=="0" || ruleId==undefined){
		alert("请选择规则");
		return;
	}
    layer.open({
        type: 2,
        title:"规则管理",
        area: ['783px', '500px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/configManage/rule.html?dirId="+dirId+"&ruleId="+ruleId
    });
}
//删除规则
function delRule(){
	var dirId = $("#dirId").val();
	var selRowId = $("#tableRule").jqGrid("getGridParam","selrow");
	var ruleId = $("#tableRule").jqGrid("getCell",selRowId,"ruleId");
	if(ruleId=="" || ruleId=="0" || ruleId==undefined){
		alert("请选择规则");
		return;
	}
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/saveRule.ajax",
			data:{
				ruleId:ruleId,
				dataStatus:1//删除状态（0 正常 1 删除）
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					reloadGrid();
					alert("删除成功");
				}else{
					alert("删除失败");
				}
			}
	});
}
//启用停用规则
function enableRule(status){
	var dirId = $("#dirId").val();
	var selRowId = $("#tableRule").jqGrid("getGridParam","selrow");
	var ruleId = $("#tableRule").jqGrid("getCell",selRowId,"ruleId");
	if(ruleId=="" || ruleId=="0" || ruleId==undefined){
		alert("请选择规则");
		return;
	}
	var msg = "启用";
	if(status=="1"){
		msg="停用";
	}
	$.ajax({
			type:"POST", 
			async:false, 
			url:GLOBAL.WEBROOT + "/configManage/saveRule.ajax",
			data:{
				ruleId:ruleId,
				status:status//状态（0启用 1 停用）
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					reloadGrid();
					alert(msg+"成功");
				}else{
					alert(msg+"失败");
				}
			}
	});
}