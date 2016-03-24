 
$(function () {
 
	selectList(); 
});

 
function reloadGrid(){
	var studyStatuss = "";
    var data = $("#searchForm").serializeObject() ;   
     
	$("#druglist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
}

//查询列表
function selectList() {	  
	var grid_selector = "#druglist";
    var pager_selector = "#druglist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/screening/queryDurgUseList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['药物类型','药物名称','规格','次剂量','剂量单位','用药途径','用药频率','用药天数','使用总量'],
        colModel: [
            {name: 'durg_type', index: 'seqId', width:50,sortable: false}, 
			{name: 'durg_name', index: 'areaId', width:50,sortable: false},           
			{name: 'spec', index: 'orgLevel', width:70,sortable: false},
			{name: 'single_doses', index: 'orgId', width:60,sortable: false},
			{name: 'dosage_unit', index: 'ruleId', width:60,sortable: false},    
			{name: 'durg_route', index: 'seqId', width:50,sortable: false}, 
			{name: 'durg_frequency', index: 'areaId', width:50,sortable: false},           
			{name: 'durg_day', index: 'orgLevel', width:70,sortable: false},
			{name: 'total_use', index: 'orgId', width:60,sortable: false}          
        ],        
        viewrecords: false,
        rowNum:8,
        rowList:[10,15,20,30],
        multiselect: false, //checkbox 显示隐藏
        multiboxonly: true, 
        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
           
            var re_records = $("#druglist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		//$("#druglist").jqGrid("addRowData",(re_records+1),{ 'seq_id':"1",'area_id':"秦都区",'org_level':"三级医院",'rule_id':"陕中附院",'rule_id':"<a>查看</a>" },"");
        		//$("#druglist").jqGrid("addRowData",(re_records+2),{ 'seq_id':"2",'area_id':"旬邑县",'org_level':"二级医院",'org_id':"旬邑县人民医院",'rule_id':"<a>查看</a>" },"");
        		$("#druglist").jqGrid("addRowData",(re_records+3),{'durg_type':"专科用药",'durg_name':"乌梅",'spec':"g",'single_doses':"10",'dosage_unit':"g",'durg_route':"煎服",'durg_frequency':"2次/每日",'durg_day':"5",'total_use':"15" },"");
        		 
        		 
        
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

 
 
//切换日期
function changeDate(type){
	if(type==1){
		$("#year").hide();
		$("#month").hide();
		$("#dateTime").show();
	}else if(type==2){
		$("#year").hide();
		$("#month").show();
		$("#dateTime").hide();		
	}else if(type==3){
		$("#year").show();
		$("#month").hide();
		$("#dateTime").hide();
	}
}

  
//浏览
function showDetail(id){
 
	layer.open({
        type: 2,
        title:"大处方筛查",
        area: ['900px', '600px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/screening/showScreeningDetail.html?id="+id
    });
}
 
 
//重置
function reset(){
	$("#qValue").val("");
	$("#studyAccnumber").val("");
	$("#startTime").val("");
	$("#endTime").val(""); 
}
 
 