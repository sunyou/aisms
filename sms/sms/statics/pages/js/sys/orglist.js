 
$(function () {
	//加载省份地市区县
	getProvinceList();
	$("#provinceCode").select2();  
	$("#cityCode").select2();  
	$("#countyCode").select2();  
	selectList();
	
});

function getProvinceList(){
	//省份
    $.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/org/getProvince.ajax",
        success: function (data) {
            var provinceList = eval(data.ProvinceList);
            var provinceSelect = $("#provinceCode");
            provinceSelect.empty();
            provinceSelect.append("<option value='-1'>请选择</option>");
            for (var i = 0; i < provinceList.length; i++) {
                provinceSelect.append("<option value='" + provinceList[i].code + "'>" + provinceList[i].value + "</option>");
            }
            provinceSelect.select2();
        }
    });
}

function getCityList(args){
	//城市
	$.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/org/getCity.ajax?lastCode="+$(args).val(),
        success: function (data) {
            var cityList = eval(data.CityList);
            var cityCodeSelect = $("#cityCode");
            cityCodeSelect.empty();
            cityCodeSelect.append("<option value='-1'>请选择</option>");
            for (var i = 0; i < cityList.length; i++) {
                cityCodeSelect.append("<option value='" + cityList[i].code + "'>" + cityList[i].value + "</option>");
            }
            cityCodeSelect.select2();
        }
    });
}

function getCountyList(args){
	//城市
	$.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/org/getCounty.ajax?lastCode="+$(args).val(),
        success: function (data) {
            var countyList = eval(data.CountyList);
            var countySelect = $("#countyCode");
            countySelect.empty();
            countySelect.append("<option value='-1'>请选择</option>");
            for (var i = 0; i < countyList.length; i++) {
                countySelect.append("<option value='" + countyList[i].code + "'>" + countyList[i].value + "</option>");
            }
            countySelect.select2();
        }
    });
}
 
function reloadGrid(){
    var data = $("#searchForm").serializeObject() ;   
	$("#orglist").jqGrid('setGridParam', {postData: data,page:1,pageSize:10}).trigger("reloadGrid");
}
var ch_rowid=0;

//查询列表
function selectList() {	  
	var grid_selector = "#orglist";
    var pager_selector = "#orglist_pager";
    var data = $("#searchForm").serializeObject();  
	$(grid_selector).jqGrid({
        url: GLOBAL.WEBROOT+"/org/queryOrgList.ajax",
        mtype : "post",  
        async: true,
        datatype: "json",
        height: '100%',
        width : '100%',
        postData :data,
        colNames: ['机构编码','机构名称','所在地区','状态','负责人','联系人','联系人方式'],
        colModel: [
            {name: 'orgId', index: 'orgId', width:100,sortable: false},
            {name: 'orgName', index: 'orgName', width:150,sortable: false},           
            {name: 'area', index: 'area', width:170,sortable: false},
            {name: 'status', index: 'status', width:100,sortable: false,formatter : function(value) {
					if ('1' == value){
						return "停用";
					}else if ('0' == value){
						return "启用";
					}						
				}},
            {name: 'director', index: "director",width:150,  sortable: false},
            {name: 'contacts', index: "contacts",width:150,  sortable: false},
            {name: 'contactsPhone', index: "contactsPhone",width:150,  sortable: false}
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
	var gr = $("#orglist").jqGrid("getGridParam","selarrrow");
	if((gr.length == 0 || gr.length>1)&& type!='add'){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}else{
		var rowData = $("#orglist").jqGrid('getRowData',gr[0]);
	//	alert($.toJSON(rowData));
		var url ;
		var title ;
		if(type=="look"){
			title="查看医保机构信息";
			url="/org/getOrgDetail.html?id="+rowData.orgId+"&type="+type;
			//所有控件不可用
		}else if(type=="update"){
			title = "修改医保机构信息";
			url="/org/getOrgDetail.html?id="+rowData.orgId+"&type="+type;
		}else{
			title = "新增医保机构信息";
			url="/org/getOrgDetail.html?id=&type="+type;
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
	var gr = $("#orglist").jqGrid("getGridParam","selarrrow");
	if(gr.length==0 || gr.length>1){
		layer.alert('请选择一条记录进行操作！', {icon: 5,shadeClose: true});
		return;
	}else{
		var rowData = $("#orglist").jqGrid('getRowData',gr[0]);
		var title = "";
		if(str=="stop"){
			title = "是否停用该机构？";
		}else{
			title = "是否启用该机构？";
		}
		layer.confirm(title, {
		    btn: ['确定','取消'] //按钮
		}, function(){
			$.ajax({
	        type: "GET",
	        async: true,
	        url: GLOBAL.WEBROOT +"/org/disableEn.ajax?id="+rowData.orgId+"&type="+str,
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
 
 