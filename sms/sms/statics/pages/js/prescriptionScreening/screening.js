 
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
     
	$("#screeninglist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
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
	var grid_selector = "#screeninglist";
    var pager_selector = "#screeninglist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/screening/queryList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','就诊时间','就诊类型','患者姓名','患者性别','患者年龄','患者身份证号','患者联系方式','医生姓名','医生身份证号','行政区划','机构类别','机构名称','违反规则'],
        colModel: [
            {name: 'seq_id', index: 'seqId', width:50,sortable: false}, 
			{name: 'visiting_time', index: 'areaId', width:50,sortable: false},           
			{name: 'visiting_type', index: 'orgLevel', width:70,sortable: false},
			{name: 'patient_name', index: 'orgId', width:60,sortable: false},
			{name: 'patient_sex', index: 'ruleId', width:60,sortable: false},    
			{name: 'patient_age', index: 'seqId', width:50,sortable: false}, 
			{name: 'patient_cer_no', index: 'areaId', width:50,sortable: false},           
			{name: 'patient_phone', index: 'orgLevel', width:70,sortable: false},
			{name: 'doctor_name', index: 'orgId', width:60,sortable: false},
			{name: 'doctor_cer_no', index: 'ruleId', width:60,sortable: false},    
			{name: 'area_id', index: 'ruleId', width:60,sortable: false}, 
			{name: 'org_level', index: 'orgId', width:60,sortable: false},
			{name: 'org_name', index: 'ruleId', width:60,sortable: false},    
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
           
            var re_records = $("#screeninglist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
        		//$("#screeninglist").jqGrid("addRowData",(re_records+1),{ 'seq_id':"1",'area_id':"秦都区",'org_level':"三级医院",'rule_id':"陕中附院",'rule_id':"<a>查看</a>" },"");
        		//$("#screeninglist").jqGrid("addRowData",(re_records+2),{ 'seq_id':"2",'area_id':"旬邑县",'org_level':"二级医院",'org_id':"旬邑县人民医院",'rule_id':"<a>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+3),{'seq_id':"3",'visiting_time':"2015-11-12",'visiting_type':"普通门诊",'patient_name':"张华华",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+4),{'seq_id':"4",'visiting_time':"2015-02-23",'visiting_type':"普通门诊",'patient_name':"王爵国",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+5),{'seq_id':"5",'visiting_time':"2015-05-06",'visiting_type':"普通门诊",'patient_name':"保天明",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+6),{'seq_id':"6",'visiting_time':"2015-04-04",'visiting_type':"普通门诊",'patient_name':"李明国",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+7),{'seq_id':"7",'visiting_time':"2015-08-12",'visiting_type':"普通门诊",'patient_name':"曹华勒",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+8),{'seq_id':"8",'visiting_time':"2015-09-12",'visiting_type':"普通门诊",'patient_name':"何以天",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#screeninglist").jqGrid("addRowData",(re_records+9),{'seq_id':"9",'visiting_time':"2015-10-12",'visiting_type':"普通门诊",'patient_name':"李国梁",'patient_sex':"男",'patient_age':"51",'patient_cer_no':"610402****001",'patient_phone':"186****5671",'doctor_name':"李政道",'doctor_cer_no':"610404****4473",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
 
        		
        		 
        
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
	$("#year").val("");  
  $("#month").val("");  
  $("#dateTime").val("");  
  $("#area").val("请选择");     
  $("#hospitalId").val("请选择");  
  $("#patientName").val("");  
  $("#level").val("请选择");     
  $("#ruleId").val("请选择"); 
  $("#hospitalId").val("请选择");  
  
  $("#patientCerNo").val(""); 
  $("#doctorName").val(""); 
  $("#doctorCerNo").val(""); 
}
 
 