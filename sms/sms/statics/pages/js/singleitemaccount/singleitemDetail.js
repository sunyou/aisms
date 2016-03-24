 
$(function () {
 
	selectList(); 
	
	jianyanList();
	surgeryList();
	feeList();
});

 
function reloadGrid(){
	var studyStatuss = "";
    var data = $("#searchForm").serializeObject() ;   
     
	$("#userYaolist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
}

//查询列表
function selectList() {	  
	var grid_selector = "#userYaolist";
    var pager_selector = "#userYaolist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/screening/queryDurgUseList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['药物类型','药物名称','规格','次剂量','剂量单位','用药途径','使用频率','用药天数','使用总量','开始时间','停止时间'],
        colModel: [
            {name: 'durg_type', index: 'seqId', width:50,sortable: false}, 
			{name: 'durg_name', index: 'areaId', width:50,sortable: false},           
			{name: 'spec', index: 'orgLevel', width:70,sortable: false},
			{name: 'single_doses', index: 'orgId', width:60,sortable: false},
			{name: 'dosage_unit', index: 'ruleId', width:60,sortable: false},    
			{name: 'durg_route', index: 'seqId', width:50,sortable: false}, 
			{name: 'durg_frequency', index: 'areaId', width:50,sortable: false},           
			{name: 'durg_day', index: 'orgLevel', width:70,sortable: false},
			{name: 'total_use', index: 'orgId', width:60,sortable: false},
			{name: 'start_date', index: 'start_date', width:60,sortable: false},
			{name: 'end_date', index: 'end_date', width:60,sortable: false}
        ],        
        viewrecords: false,
        rowNum:8,
        rowList:[10,15,20,30],
        multiselect: false, //checkbox 显示隐藏
        multiboxonly: true, 
//        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
           
            var re_records = $("#userYaolist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		//$("#druglist").jqGrid("addRowData",(re_records+1),{ 'seq_id':"1",'area_id':"秦都区",'org_level':"三级医院",'rule_id':"陕中附院",'rule_id':"<a>查看</a>" },"");
        		//$("#druglist").jqGrid("addRowData",(re_records+2),{ 'seq_id':"2",'area_id':"旬邑县",'org_level':"二级医院",'org_id':"旬邑县人民医院",'rule_id':"<a>查看</a>" },"");
        		$("#userYaolist").jqGrid("addRowData",(re_records+3),{'durg_type':"专科用药",'durg_name':"乌梅",'spec':"g",'single_doses':"10",'dosage_unit':"g",'durg_route':"煎服",'durg_frequency':"2次/每日",'durg_day':"5",'total_use':"15",'start_date':'2014-10-23','end_date':'2014-12-12' },"");
        		 
        		 
        
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

function jianyanList(){
	var grid_selector = "#jianyanlist";
    var pager_selector = "#jianyanlist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/singleitemaccount/queryCheckList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['项目名称','报告日期','报告医生'],
        colModel: [
            {name: 'projectName', index: 'projectName', width:80,sortable: false}, 
			{name: 'reportDate', index: 'reportDate', width:60,sortable: false},           
			{name: 'reportDoctor', index: 'reportDoctor', width:60,sortable: false}
        ],        
        viewrecords: false,
        rowNum:8,
        rowList:[10,15,20,30],
        multiselect: false, //checkbox 显示隐藏
        multiboxonly: true, 
//        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
           
            var re_records = $("#jianyanlist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		$("#jianyanlist").jqGrid("addRowData",(re_records+1),{'projectName':"****",'reportDate':"2014-12-23",'reportDoctor':"林振宇"},"");
        		$("#jianyanlist").jqGrid("addRowData",(re_records+2),{'projectName':"****",'reportDate':"2014-12-30",'reportDoctor':"张卫东"},"");
        		 
        		 
        
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

//手术信息
function surgeryList(){
	var grid_selector = "#shoushulist";
    var pager_selector = "#shoushulist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/singleitemaccount/querySurgeryList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['手术名称','手术日期','手术级别','手术医生','第一助手医生','第二助手医生','切口愈合等级','麻醉方法','麻醉医师','备注'],
        colModel: [
            {name: 'surgeryName', index: 'surgeryName', width:80,sortable: false}, 
			{name: 'surgeryDate', index: 'surgeryDate', width:60,sortable: false},           
			{name: 'surgeryLevel', index: 'surgeryLevel', width:60,sortable: false},
			{name: 'surgeryDoctor', index: 'surgeryDoctor', width:60,sortable: false},
			{name: 'firstHelpDoctor', index: 'firstHelpDoctor', width:60,sortable: false},
			{name: 'secondHelpDoctor', index: 'secondHelpDoctor', width:60,sortable: false},
			{name: 'healingLevel', index: 'healingLevel', width:60,sortable: false},
			{name: 'anesthesiaWay', index: 'anesthesiaWay', width:60,sortable: false},
			{name: 'anesthesiaPerson', index: 'anesthesiaPerson', width:60,sortable: false},
			{name: 'remark', index: 'remark', width:60,sortable: false}
        ],        
        viewrecords: false,
        rowNum:8,
        rowList:[10,15,20,30],
        multiselect: false, //checkbox 显示隐藏
        multiboxonly: true, 
//        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
           
            var re_records = $("#shoushulist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		$("#shoushulist").jqGrid("addRowData",(re_records+1),{'surgeryName':"****",'surgeryDate':"2014-12-23",'surgeryLevel':"3",'surgeryDoctor':'林振宇',
        			'firstHelpDoctor':'***','secondHelpDoctor':'***','healingLevel':'2','anesthesiaWay':'半身麻醉','anesthesiaPerson':'刘三山','remark':'***'},"");
        		 
        		 
        
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

//费用信息
function feeList(){
	var grid_selector = "#feiyonglist";
    var pager_selector = "#feiyonglist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/singleitemaccount/queryFeeInfoList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['类别','费用名称','报告日期','报告医生'],
        colModel: [
            {name: 'feeCategory', index: 'feeCategory', width:80,sortable: false}, 
			{name: 'feeName', index: 'feeName', width:60,sortable: false},           
			{name: 'reportDate', index: 'reportDate', width:60,sortable: false},
			{name: 'reportDoctor', index: 'reportDoctor', width:60,sortable: false}
        ],        
        viewrecords: false,
        rowNum:8,
        rowList:[10,15,20,30],
        multiselect: false, //checkbox 显示隐藏
        multiboxonly: true, 
//        pager: pager_selector,
        altRows: true,
        loadComplete: function () {
            com.ai.bdx.util.updatePagerIcons(this);
           
            var re_records = $("#feiyonglist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		$("#feiyonglist").jqGrid("addRowData",(re_records+1),{'feeCategory':"****",'feeName':"**手术",'reportDate':'2014-11-21','reportDoctor':"林振宇"},"");
        		 
        		 
        
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
 
 