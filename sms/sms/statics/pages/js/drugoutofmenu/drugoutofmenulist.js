 
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
	selectLisHispitalt();
});

 
function reloadGrid(){
	var studyStatuss = "";
    var data = $("#searchForm").serializeObject() ;   
     
	$("#anlist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
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


//查询列表
function selectList() {	  
	var grid_selector = "#anlist";
    var pager_selector = "#anlist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/antibacterials/queryAnList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','行政区划','机构类别','机构名称','违反规则'],
        colModel: [
            {name: 'seq_id', index: 'seqId', width:50,sortable: false}, 
            {name: 'area_id', index: 'areaId', width:50,sortable: false},           
            {name: 'org_level', index: 'orgLevel', width:70,sortable: false},
            {name: 'org_id', index: 'orgId', width:60,sortable: false},
            {name: 'rule_id', index: 'ruleId', width:60,sortable: false}            
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
           
            var re_records = $("#anlist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		//$("#anlist").jqGrid("addRowData",(re_records+1),{ 'seq_id':"1",'area_id':"秦都区",'org_level':"三级医院",'rule_id':"陕中附院",'rule_id':"<a>查看</a>" },"");
        		//$("#anlist").jqGrid("addRowData",(re_records+2),{ 'seq_id':"2",'area_id':"旬邑县",'org_level':"二级医院",'org_id':"旬邑县人民医院",'rule_id':"<a>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+3),{ 'seq_id':"3",'area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+4),{ 'seq_id':"5",'area_id':"礼泉县",'org_level':"二级医院",'org_id':"礼泉县人民医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+5),{ 'seq_id':"6",'area_id':"乾县",'org_level':"二级医院",'org_id':"乾县人民医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+6),{ 'seq_id':"7",'area_id':"兴平市",'org_level':"二级医院",'org_id':"兴平市人民医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+7),{ 'seq_id':"8",'area_id':"武功县",'org_level':"二级医院",'org_id':"武功县人民医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");

        
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

function reloadGridHispital(){
	var studyStatuss = "";
    var data = $("#searchForm2").serializeObject() ;   
     
	$("#anlist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
}

//查询列表
function selectLisHispitalt() {	  
	var grid_selector = "#anlistHispital";
    var pager_selector = "#anlistHispital_pager";
    var data = $("#searchForm2").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/antibacterials/queryAnHospitalList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','行政区划','机构类别','机构名称','科室姓名','医生姓名','医生身份证号','违反规则'],
        colModel: [
            {name: 'seq_id', index: 'seqId', width:50,sortable: false}, 
            {name: 'area_id', index: 'areaId', width:50,sortable: false},           
            {name: 'org_level', index: 'orgLevel', width:70,sortable: false},
            {name: 'org_id', index: 'orgId', width:60,sortable: false},
            {name: 'office_id', index: 'office_id', width:50,sortable: false},           
            {name: 'doctor_name', index: 'doctor_name', width:70,sortable: false},
            {name: 'doctor_cerno', index: 'doctor_cno', width:60,sortable: false},
            {name: 'rule_id', index: 'ruleId', width:60,sortable: false}            
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
           
            var re_records = $("#anlistHispital").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		//$("#anlist").jqGrid("addRowData",(re_records+1),{ 'seq_id':"1",'area_id':"秦都区",'org_level':"三级医院",'rule_id':"陕中附院",'rule_id':"<a>查看</a>" },"");
        		//$("#anlist").jqGrid("addRowData",(re_records+2),{ 'seq_id':"2",'area_id':"旬邑县",'org_level':"二级医院",'org_id':"旬邑县人民医院",'rule_id':"<a>查看</a>" },"");
        		$("#anlistHispital").jqGrid("addRowData",(re_records+3),{ 'seq_id':"3",'area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'office_id':"内科",'doctor_name':"何明月",'doctor_cerno':"610402****1198",'rule_id':"<a href='javaScript:showDetail2(1)'>查看</a>" },"");
        		$("#anlistHispital").jqGrid("addRowData",(re_records+4),{ 'seq_id':"5",'area_id':"礼泉县",'org_level':"二级医院",'org_id':"礼泉县人民医院",'office_id':"内科",'doctor_name':"何明月",'doctor_cerno':"610402****1198",'rule_id':"<a href='javaScript:showDetail2(1)'>查看</a>" },"");
        		$("#anlistHispital").jqGrid("addRowData",(re_records+5),{ 'seq_id':"6",'area_id':"乾县",'org_level':"二级医院",'org_id':"乾县人民医院",'office_id':"内科",'doctor_name':"何明月",'doctor_cerno':"610402****1198",'rule_id':"<a href='javaScript:showDetail2(1)'>查看</a>" },"");
        		$("#anlistHispital").jqGrid("addRowData",(re_records+6),{ 'seq_id':"7",'area_id':"兴平市",'org_level':"二级医院",'org_id':"兴平市人民医院",'office_id':"内科",'doctor_name':"何明月",'doctor_cerno':"610402****1198",'rule_id':"<a href='javaScript:showDetail2(1)'>查看</a>" },"");
        		$("#anlistHispital").jqGrid("addRowData",(re_records+7),{ 'seq_id':"8",'area_id':"武功县",'org_level':"二级医院",'org_id':"武功县人民医院",'office_id':"内科",'doctor_name':"何明月",'doctor_cerno':"610402****1198",'rule_id':"<a href='javaScript:showDetail2(1)'>查看</a>" },"");


        
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
        title:"检查详情",
        area: ['900px', '600px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/antibacterials/showAntibacterialsDetail.html?id="+id
    });
}

//浏览
function showDetail2(id){
 
	layer.open({
        type: 2,
        title:"检查详情",
        area: ['900px', '600px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/antibacterials/showAntibacterialsHospitalDetail.html?id="+id
    });
}
 
//重置
function reset(){
	$("#qValue").val("");
	$("#studyAccnumber").val("");
	$("#startTime").val("");
	$("#endTime").val(""); 
}
 
 