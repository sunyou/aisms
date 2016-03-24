$(function () {
	$("#closeBtn").click(function(){
       closeDiv();
    });
	
	//加载省份地市区县
	getProvinceList();
	$("#provinceCode").select2();  
	$("#cityCode").select2();  
	$("#countyCode").select2();
	$("#status").select2();  
	
	var type = $("#medicalOrgForm").attr("dataType");
	if(type=="look"){
		com.ai.bdx.util.disableAll("medicalOrgForm");
		$("#saveBtn").hide();
	}else if(type=="update"){
		$("#orgId").attr("readonly","true");
		$("#showText").text("修 改");
	}else{
//		$("#locId").attr("disabled","disabled");
//		$("#locId").val("系统自动生成");
		$("#showText").text("新 增");
	}
	
	var id = $("#orgId").val();
	$("#medicalOrgForm").validate({

		// 非空校验
		rules : {
			orgId : {
				required : true,
				remote:GLOBAL.WEBROOT + '/org/checkOrgId.ajax?oldOrgId='+id
			},
			provinceCode:{
				isSelect:true
			},
			orgName:{
				required : true
			}
		},
		errorElement:'em',
		messages: {
			orgId:{
        		required:'必填字段',
        		remote:'已存在'
        	}
		},
		submitHandler : save
	});

	$("#saveBtn").click(function(){
		$("#medicalOrgForm").submit();
	});
	
});

function closeDiv(){
	var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

function getProvinceList(){
	var provinceCode = $("#medicalOrgForm").attr("old_provinceCode")==""?"-1":$("#medicalOrgForm").attr("old_provinceCode");
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
            	if(provinceCode==provinceList[i].code){
            		provinceSelect.append("<option value='" + provinceList[i].code + "' selected=='selected'>" + provinceList[i].value + "</option>");
            	}else{
            		provinceSelect.append("<option value='" + provinceList[i].code + "'>" + provinceList[i].value + "</option>");	
            	}
            }
            provinceSelect.select2();
            getCityList(provinceSelect);
        }
    });
}

function getCityList(args){
	var cityCode=  $("#medicalOrgForm").attr("old_cityCode")==""?"-1":$("#medicalOrgForm").attr("old_cityCode");
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
	               if(cityCode==cityList[i].code){
            			cityCodeSelect.append("<option value='" + cityList[i].code + "' selected=='selected'>" + cityList[i].value + "</option>");
	            	}else{
	            		cityCodeSelect.append("<option value='" + cityList[i].code + "'>" + cityList[i].value + "</option>");
	            	}
	            }
	            cityCodeSelect.select2();
	            getCountyList(cityCodeSelect);
	        }
	    });
	
}

function getCountyList(args){
	var countyCode=  $("#medicalOrgForm").attr("old_countyCode")==""?"-1":$("#medicalOrgForm").attr("old_countyCode");
	//区县
		$.ajax({
	        type: "POST",
	        url: GLOBAL.WEBROOT +"/org/getCounty.ajax?lastCode="+$(args).val(),
	        success: function (data) {
	            var countyList = eval(data.CountyList);
	            var countySelect = $("#countyCode");
	            countySelect.empty();
	            countySelect.append("<option value='-1'>请选择</option>");
	            for (var i = 0; i < countyList.length; i++) {
	            	if(countyCode==countyList[i].code){
            			countySelect.append("<option value='" + countyList[i].code + "' selected=='selected'>" + countyList[i].value + "</option>");
	            	}else{
	            		countySelect.append("<option value='" + countyList[i].code + "'>" + countyList[i].value + "</option>");
	            	}
	            }
	            countySelect.select2();
	        }
	    });
}
 
function save() {
		//提交
		var type = $("#medicalOrgForm").attr("dataType");
	    var data = $("#medicalOrgForm").serializeObject();
	    data = $.toJSON(data);
	    $.ajax({
	        type: "POST",
	        async: true,
	        url: GLOBAL.WEBROOT + "/org/saveMedicalSupOrg?type="+type,
	        dataType: 'json',
	        contentType: 'application/json',
	        data: data,
	        success: function (data) {
	            if (data.ERRCODE == "0") {
	            	layer.msg('操作成功', {icon: 1});
	                parent.reloadGrid();
	                setTimeout(closeDiv,1500);
	            }
	            else {
	                layer.msg('新增失败', {icon: 1});
	            }
	        }
	    });
}
 