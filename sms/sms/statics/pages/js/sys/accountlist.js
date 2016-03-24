 
$(function () {
	selectList();
	
});

 
function reloadGrid(){
    var data = $("#searchForm").serializeObject() ;   
	$("#accountlist").jqGrid('setGridParam', {postData: data,page:1,pageSize:10}).trigger("reloadGrid");
}
var ch_rowid=0;

//查询列表
function selectList() {	  
	var grid_selector = "#accountlist";
    var pager_selector = "#accountlist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/account/queryAccountList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','用户名','账号','状态','创建人','创建时间','所属机构'],
        colModel: [
            {name: 'accountId', index: 'accountId', width:100,sortable: false},
            {name: 'accountName', index: 'accountName', width:150,sortable: false},           
            {name: 'accountCode', index: 'accountCode', width:150,sortable: false},
            {name: 'status', index: 'status', width:100,sortable: false,formatter : function(value) {
					if ('1' == value){
						return "停用";
					}else if ('0' == value){
						return "启用";
					}
			}},
            {name: 'createStaff', index: "createStaff",width:150,  sortable: false},
            {name: 'createTime', index: "createTime",width:150,  sortable: false},
            {name: 'orgName', index: "orgName",width:150,  sortable: false}
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
	var gr = $("#accountlist").jqGrid("getGridParam","selarrrow");
	if((gr.length == 0 || gr.length>1)&& type!='add'){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}else{
		var rowData = $("#accountlist").jqGrid('getRowData',gr[0]);
	//	alert($.toJSON(rowData));
		var url ;
		var title ;
		if(type=="look"){
			title="查看账号信息";
			url="/account/getAccountDetail.html?id="+rowData.accountId+"&type="+type;
		}else if(type=="update"){
			title = "修改账号信息";
			url="/account/getAccountDetail.html?id="+rowData.accountId+"&type="+type;
		}else if(type=="roleAccount"){
			title = "账号角色分配信息";
			url="/account/getAccountRoleDetail.html?accountId="+rowData.accountId+"&type="+type+"&status="+rowData.status+"&orgName="+rowData.orgName;
		}else{
			title = "新增账号信息";
			url="/account/getAccountDetail.html?id=0&type="+type;
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
	var gr = $("#accountlist").jqGrid("getGridParam","selarrrow");
	if(gr.length==0 || gr.length>1){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}else{
		var rowData = $("#accountlist").jqGrid('getRowData',gr[0]);
		var title = "";
		if(str=="stop"){
			title = "是否停用该账号？";
		}else{
			title = "是否启用该账号？";
		}
		layer.confirm(title, {
		    btn: ['确定','取消'] //按钮
		}, function(){
			$.ajax({
	        type: "GET",
	        async: true,
	        url: GLOBAL.WEBROOT +"/account/disableEn.ajax?id="+rowData.accountId+"&type="+str,
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
 