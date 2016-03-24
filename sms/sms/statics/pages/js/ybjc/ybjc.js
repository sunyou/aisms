 
$(function () {
	//初始化查询进间
    
//	$("#year").select2();  
//    $("#month").select2(); 
//    $("#taskTime").select2();  
//    $("#area").select2(); 
//    $("#level").select2();  
//    $("#hospitalId").select2(); 
//    $("#ruleId").select2();   
    
    
	selectList(); 
});

 
function reloadGrid(){
	var studyStatuss = "";
    var data = $("#searchForm").serializeObject() ;   
     
	$("#ybjclist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
}

//查询列表
function selectList() {	  
	var grid_selector = "#ybjclist";
    var pager_selector = "#ybjclist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/ybjc/queryList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','派单时间','任务编码','任务来源','任务类型','对象类型','任务状态','行政区划','机构类型','机构名称','详情'],
        colModel: [
            {name: 'seq_id', index: 'seqId', width:50,sortable: false}, 
			{name: 'task_time', index: 'taskTime', width:50,sortable: false},           
			{name: 'task_no', index: 'taskNo', width:70,sortable: false},
			{name: 'source', index: 'source', width:60,sortable: false},
			{name: 'type', index: 'type', width:60,sortable: false},    
			{name: 'obj_type', index: 'objType', width:50,sortable: false},           
			{name: 'status', index: 'status', width:60,sortable: false},
			{name: 'area_id', index: 'areaId', width:60,sortable: false}, 
			{name: 'org_level', index: 'orgLevel', width:60,sortable: false},
			{name: 'org_name', index: 'orgName', width:60,sortable: false},    
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
           
            var re_records = $("#ybjclist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
//        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"1",'task_time':"2015-11-12",'task_no':"004",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
//        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"2",'task_time':"2015-11-12",'task_no':"004",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
//        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"3",'task_time':"2015-11-12",'task_no':"004",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		
        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"4",'task_time':"2015-11-12",'task_no':"004",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"5",'task_time':"2015-11-12",'task_no':"005",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"6",'task_time':"2015-11-12",'task_no':"006",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"7",'task_time':"2015-11-12",'task_no':"007",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"8",'task_time':"2015-11-12",'task_no':"008",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#ybjclist").jqGrid("addRowData",(re_records+3),{'seq_id':"9",'task_time':"2015-11-12",'task_no':"009",'source':"人工",'type':"挂床稽查",'obj_type':"医师",'status':"正在执行",'area_id':"秦都区",'org_level':"三级医院",'org_name':"陕中附院",'rule_id':"<a href='javaScript:showDetail(1)'>查看</a>" },"");

        
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
function formatDate(){
	var str = $("input[name=date1]:checked").val();
    if(str=='day'){
    	$("#taskTime").focus(WdatePicker({dateFmt:'yyyy-MM-dd'}));	
    }else if(str=='month'){
    	$("#taskTime").focus(WdatePicker({dateFmt:'yyyy-MM'}));	
    }else if(str=='year'){
    	$("#taskTime").focus(WdatePicker({dateFmt:'yyyy'}));	
    }
}
  
//浏览
function showDetail(id){
 
	layer.open({
        type: 2,
        title:"医保稽查",
        area: ['900px', '600px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/ybjc/ybjcDetail.html?id="+id
    });
}
 
 
//重置
function reset(){
  $("#year").val("");  
  $("#month").val("");  
  $("#taskTime").val("");
  $("#taskNo").val(""); 
 
  $("#area").val("-1");     
  $("#hospitalId").val("-1");  
  $("#level").val("-1");  
  
  $("#status").val("-1"); 
  $("#objType").val("-1");  
  
  $("#type").val("-1"); 
  $("#source").val("-1"); 
}
 
 