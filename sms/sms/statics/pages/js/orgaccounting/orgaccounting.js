 
$(function () {
	//初始化查询进间
    
//	$("#year").select2();  
//    $("#month").select2(); 
//    $("#dateTime").select2();  
//    $("#area").select2(); 
//    $("#level").select2();  
//    $("#hospitalId").select2(); 
//    $("#ruleId").select2();   
    
    
	selectList();
	
});

 
function reloadGrid(){
	var studyStatuss = "";
    var data = $("#searchForm").serializeObject() ;   
     
	$("#orgaccountlist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
}

//查询列表
function selectList() {	  
	var grid_selector = "#orgaccountlist";
    var pager_selector = "#orgaccountlist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/orgaccounting/queryOrgaccountList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','行政区划','机构类别','机构名称','违反规则'],
        colModel: [
            {name: 'seqId', index: 'seqId', width:50,sortable: false},
            {name: 'areaId', index: 'areaId', width:50,sortable: false},           
            {name: 'orgLevel', index: 'orgLevel', width:70,sortable: false},
            {name: 'orgId', index: 'orgId', width:60,sortable: false},
            {name: 'ruleId', index: "ruleId",width:50,  sortable: false}
        ],        
        viewrecords: false,
        rowNum:10,
        rowList:[10,15,20,30],
        multiselect: false, //checkbox 显示隐藏
        multiboxonly: true, 
        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
           
            var re_records = $("#orgaccountlist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		$("#orgaccountlist").jqGrid("addRowData",(re_records+1),{ 'seqId':"1",'areaId':"礼泉县",'orgLevel':"三级医院",'orgId':"215医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#orgaccountlist").jqGrid("addRowData",(re_records+2),{ 'seqId':"2",'areaId':"秦都区",'orgLevel':"三级医院",'orgId':"215医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
				$("#orgaccountlist").jqGrid("addRowData",(re_records+3),{ 'seqId':"3",'areaId':"渭城区",'orgLevel':"三级医院",'orgId':"215医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#orgaccountlist").jqGrid("addRowData",(re_records+4),{ 'seqId':"4",'areaId':"礼泉县",'orgLevel':"二级医院",'orgId':"礼泉县人民医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#orgaccountlist").jqGrid("addRowData",(re_records+5),{ 'seqId':"5",'areaId':"乾县",'orgLevel':"二级医院",'orgId':"乾县人民医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#orgaccountlist").jqGrid("addRowData",(re_records+6),{ 'seqId':"6",'areaId':"兴平市",'orgLevel':"二级医院",'orgId':"兴平市人民医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#orgaccountlist").jqGrid("addRowData",(re_records+7),{ 'seqId':"7",'areaId':"武功县",'orgLevel':"二级医院",'orgId':"武功县人民医院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        
        	}
            
        },
        onSelectAll: function (aRowids, status) {
        },
        onSelectRow: function (rowid, status) {
        	ch_rowid = rowid;
        },
        autowidth: true
    });
}
 
//浏览
function showDetail(id,type){
 
	layer.open({
        type: 2,
        title:"违规查看",
        area: ['900px', '600px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/orgaccounting/showOrgaccountDetail.html?id="+id
    });
}

function formatDate(){
	var str = $("input[name=date1]:checked").val();
    if(str=='day'){
    	$("#dateTime").focus(WdatePicker({dateFmt:'yyyy-MM-dd'}));	
    }else if(str=='month'){
    	$("#dateTime").focus(WdatePicker({dateFmt:'yyyy-MM'}));	
    }else if(str=='year'){
    	$("#dateTime").focus(WdatePicker({dateFmt:'yyyy'}));	
    }
}
  
//浏览
function showGrid(){

	if(ch_rowid == null || ch_rowid == ""){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}
	var rowData = $("#anlist").jqGrid('getRowData',ch_rowid);
	//alert(rowData.studyinfoId);
	layer.open({
        type: 2,
        title:"检查详情",
        area: ['800px', '500px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/workList/getWorkListDetail.html?studyinfoId="+rowData.studyinfoId
    });
}
 
 