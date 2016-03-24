 
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
     
	$("#singleitemlist").jqGrid('setGridParam', {postData: data,page:1,pageSize:8}).trigger("reloadGrid");
}

//查询列表
function selectList() {	  
	var grid_selector = "#singleitemlist";
    var pager_selector = "#singleitemlist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/singleitemaccount/querySingleitemList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['序号','出院时间','患者姓名','患者性别','患者年龄','患者身份证号','患者联系方式','医生姓名','医生身份证号','行政区划','机构类别','机构名称','违反规则'],
        colModel: [
            {name: 'seqId', index: 'seqId', width:50,sortable: false},
            {name: 'presptdpsDate', index: 'presptdpsDate', width:50,sortable: false},
            {name: 'patientName', index: 'seqId', width:50,sortable: false},
            {name: 'patientSex', index: 'patientSex', width:50,sortable: false},
            {name: 'patientAge', index: 'patientAge', width:50,sortable: false},
            {name: 'patientCardId', index: 'patientCardId', width:80,sortable: false},
            {name: 'patientContact', index: 'patientContact', width:60,sortable: false},
            {name: 'doctorName', index: 'doctorName', width:50,sortable: false},
            {name: 'doctorCardId', index: 'doctorCardId', width:80,sortable: false},
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
           
            var re_records = $("#singleitemlist").getGridParam('records');
            
        	if(re_records < 10 )
        	{ 
				$("#singleitemlist").jqGrid("addRowData",(re_records+1),{ 'seqId':"1",'presptdpsDate':'2015-11-09','patientName':'李少红','patientSex':'女','patientAge':'23','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'杨振宁','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+2),{ 'seqId':"2",'presptdpsDate':'2015-11-09','patientName':'李大明','patientSex':'男','patientAge':'49','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'卢山峰','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+3),{ 'seqId':"3",'presptdpsDate':'2015-11-09','patientName':'王爵国','patientSex':'男','patientAge':'51','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'李政道','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+4),{ 'seqId':"4",'presptdpsDate':'2015-11-09','patientName':'保天明','patientSex':'男','patientAge':'23','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'杨振宁','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+5),{ 'seqId':"5",'presptdpsDate':'2015-11-09','patientName':'李明国','patientSex':'男','patientAge':'48','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'卢山峰','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+6),{ 'seqId':"6",'presptdpsDate':'2015-11-09','patientName':'曹华勒','patientSex':'男','patientAge':'28','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'李政道','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+7),{ 'seqId':"7",'presptdpsDate':'2015-11-09','patientName':'何以天','patientSex':'女','patientAge':'23','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'李政道','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+8),{ 'seqId':"8",'presptdpsDate':'2015-11-09','patientName':'李国梁','patientSex':'男','patientAge':'39','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'卢山峰','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+9),{ 'seqId':"9",'presptdpsDate':'2015-11-09','patientName':'张华华','patientSex':'女','patientAge':'23','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'李政道','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        		$("#singleitemlist").jqGrid("addRowData",(re_records+10),{ 'seqId':"10",'presptdpsDate':'2015-11-09','patientName':'李四','patientSex':'男','patientAge':'23','patientCardId':'610241199212118423','patientContact':'18692374334','doctorName':'卢山峰','doctorCardId':'610241199212118423','areaId':"秦都区",'orgLevel':"三级医院",'orgId':"陕中附院",'ruleId':"<a href='javaScript:showDetail(1)'>查看</a>" },"");
        
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
        title:"单次分项占比异常违规查看",
        area: ['900px', '600px'],
        fix: false, //不固定
        maxmin: true,
        content: GLOBAL.WEBROOT + "/singleitemaccount/showSingleDetail.html?id="+id
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
 
 