 
$(function () {
	selectList();
	
});
 
function reloadGrid(){
    var data = $("#searchForm").serializeObject() ;   
	$("#rolelist").jqGrid('setGridParam', {postData: data,page:1,pageSize:10}).trigger("reloadGrid");
}
var ch_rowid=0;

//查询列表
function selectList() {	  
	var grid_selector = "#rolelist";
    var pager_selector = "#rolelist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/role/queryRoleList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['角色编码','角色名称','角色描述','状态','所属机构','创建人','创建时间'],
        colModel: [
            {name: 'roleCode', index: 'roleCode', width:100,sortable: false},
            {name: 'roleName', index: 'roleName', width:150,sortable: false},   
             {name: 'roleDescribe', index: "roleDescribe",width:150,  sortable: false},
            {name: 'status', index: 'status', width:100,sortable: false,formatter : function(value) {
					if ('1' == value){
						return "停用";
					}else if ('0' == value){
						return "启用";
					}						
				}},
            {name: 'orgName', index: "orgName",width:150,  sortable: false},
            {name: 'createStaff', index: "createStaff",width:150,  sortable: false},
            {name: 'createTime', index: "createTime",width:150,  sortable: false}
        ],        
        viewrecords: false,
        rowNum:10,
        rowList:[10,15,20,30],
        multiselect: true, //checkbox 显示隐藏
        multiboxonly: true, 
        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
        },
        onSelectAll: function (aRowids, status) {
        },
        onSelectRow: function (rowid, status) {
        	ch_rowid = rowid;
        },
        autowidth: true
    });
}
  
//操作
function view(id,type){
	var gr = $("#rolelist").jqGrid("getGridParam","selarrrow");
	if((gr.length == 0 || gr.length>1)&& type!='add'){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}else{
		var rowData = $("#rolelist").jqGrid('getRowData',gr[0]);
	//	alert($.toJSON(rowData));
		var url ;
		var title ;
		if(type=="look"){
			title="查看角色信息";
			url="/role/getRoleDetail.html?roleCode="+rowData.roleCode+"&type="+type;
			//所有控件不可用
		}else if(type=="update"){
			title = "修改角色信息";
			url="/role/getRoleDetail.html?roleCode="+rowData.roleCode+"&type="+type;
		}else if(type=="roleStaff"){
			title = "角色用户菜单授权信息";
			url="/role/getRoleStaffDetail.html?roleCode="+rowData.roleCode+"&type="+type+"&status="+rowData.status+"&orgName="+rowData.orgName;
		}else{
			title = "新增角色信息";
			url="/role/getRoleDetail.html?roleCode=&type="+type;
		}
	    var index = layer.open({
	        type: 2,
	        title:title,
	        area: ['800px', '360px'],
	        fix: false, //不固定
	        maxmin: true,
	        content: GLOBAL.WEBROOT + url
	    });
    }
}

function disableEn(str){
	var gr = $("#rolelist").jqGrid("getGridParam","selarrrow");
	if(gr.length==0 || gr.length>1){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}else{
		var rowData = $("#rolelist").jqGrid('getRowData',gr[0]);
		var title = "";
		if(str=="stop"){
			title = "是否停用该角色？";
		}else if(str=="start"){
			title = "是否启用该角色？";
		}else{
			title = "是否删除该角色？";
		}
		layer.confirm(title, {
		    btn: ['确定','取消'] //按钮
		}, function(){
			$.ajax({
	        type: "GET",
	        async: true,
	        url: GLOBAL.WEBROOT +"/role/disableEn.ajax?roleCode="+rowData.roleCode+"&type="+str,
	        dataType: 'json',
	        success: function (data) {
				if (data.ERRCODE == "0") {
	                layer.msg('操作成功', {icon: 1});
	                reloadGrid();
	            }
	            else {
	                layer.msg('操作失败', {icon: 1});
	            }
	        }
	   		});
		}, function(){
		    //layer.msg('奇葩么么哒', {icon:2});
		});
	}
}
 