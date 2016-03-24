 
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
        url: GLOBAL.WEBROOT+"/drugreuse/queryAnList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',       
        postData :data,
        colNames: ['序号','时间','患者姓名','患者性别','患者年龄','患者身份证号码','患者电话号码','医生姓名','医生身份证号','行政区划','机构类别','机构名称','违反规则'],
        colModel: [
            {name: 'seq_id', index: 'seqId', width:50,sortable: false}, 
            {name: 'create_date', index: 'createDate', width:50,sortable: false}, 
            {name: 'patient_name', index: 'patientName', width:50,sortable: false}, 
            {name: 'patient_sex', index: 'patientSex', width:50,sortable: false}, 
            {name: 'patient_age', index: 'patientAge', width:50,sortable: false}, 
            {name: 'patient_no', index: 'patientNo', width:100,sortable: false}, 
            {name: 'patient_phone', index: 'patientPhone', width:80,sortable: false}, 
            {name: 'doc_name', index: 'docName', width:50,sortable: false}, 
            {name: 'doc_no', index: 'docNo', width:100,sortable: false}, 
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
        		$("#anlist").jqGrid("addRowData",(re_records+3),{ 'seq_id':"3",'create_date':'2015-10-11','patient_name':'张三','patient_sex':'男','patient_age':'18','patient_no':'610321199110021834','patient_phone':'18511513969','doc_name':'王五','doc_no':'610321199210009888765','area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+4),{ 'seq_id':"5",'create_date':'2015-10-11','patient_name':'张三','patient_sex':'男','patient_age':'18','patient_no':'610321199110021834','patient_phone':'18511513969','doc_name':'王五','doc_no':'610321199210009888765','area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+5),{ 'seq_id':"6",'create_date':'2015-10-11','patient_name':'张三','patient_sex':'男','patient_age':'18','patient_no':'610321199110021834','patient_phone':'18511513969','doc_name':'王五','doc_no':'610321199210009888765','area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+6),{ 'seq_id':"7",'create_date':'2015-10-11','patient_name':'张三','patient_sex':'男','patient_age':'18','patient_no':'610321199110021834','patient_phone':'18511513969','doc_name':'王五','doc_no':'610321199210009888765','area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#anlist").jqGrid("addRowData",(re_records+7),{ 'seq_id':"8",'create_date':'2015-10-11','patient_name':'张三','patient_sex':'男','patient_age':'18','patient_no':'610321199110021834','patient_phone':'18511513969','doc_name':'王五','doc_no':'610321199210009888765','area_id':"渭城区",'org_level':"三级医院",'org_id':"215医院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        
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
function showDetail(id){

	layer.open({
      type: 2,
      title:"检查详情",
      area: ['900px', '600px'],
      fix: false, //不固定
      maxmin: true,
      content: GLOBAL.WEBROOT + "/drugreuse/view.html?type=''&id="+id
  });
}


 
//重置
function reset(){
	$("#qValue").val("");
	$("#studyAccnumber").val("");
	$("#startTime").val("");
	$("#endTime").val(""); 
}
 
 