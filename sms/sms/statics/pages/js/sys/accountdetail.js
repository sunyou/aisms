$(function () {
	$("#closeBtn").click(function(){
       closeDiv();
    });
	initDict();
	$("#status").select2();  
	$("#orgId").select2();
	
	var type = $("#medicalAccountForm").attr("dataType");
	if(type=="look"){
		com.ai.bdx.util.disableAll("medicalAccountForm");
		$("#saveBtn").hide();
	}else if(type=="update"){
		$("#createStaff").attr("readonly","true");
		$("#createTime").attr("readonly","true");
		$("#showText").text("修 改");
	}else{
		$("#createStaff").attr("readonly","true");
		$("#createTime").attr("readonly","true");
		$("#showText").text("新 增");
	}
	
	var id = $("#accountCode").val();
	$("#medicalAccountForm").validate({

		// 非空校验
		rules : {
			accountCode : {
				required : true,
				remote:GLOBAL.WEBROOT + '/account/checkAccountCode.ajax?oldAccountCode='+id
			},
			orgId:{
				isSelect:true
			},
			accountName:{
				required : true
			}
		},
		errorElement:'em',
		messages: {
			accountCode:{
        		required:'必填字段',
        		remote:'已存在'
        	}
		},
		submitHandler : save
	});

	$("#saveBtn").click(function(){
		$("#medicalAccountForm").submit();
	});
	
});

function initDict() {
    //医保机构下拉
    $.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/role/getOrgList.ajax",
        success: function (data) {
            var orgListType = eval(data.orgList);
            var orgSelect = $("#orgId");
            orgSelect.empty();
            orgSelect.append("<option value='-1'>请选择机构</option>");
            for (var i = 0; i < orgListType.length; i++) {
                orgSelect.append("<option value='" + orgListType[i].orgid + "'>" + orgListType[i].orgname + "</option>");
            }
            orgSelect.val($("#medicalAccountForm").attr("old_orgId")==""?"-1":$("#medicalAccountForm").attr("old_orgId"));
            orgSelect.select2();  
        }
    });
}

function closeDiv(){
	var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}
 
function save() {
		//提交
		var type = $("#medicalAccountForm").attr("dataType");
	    var data = $("#medicalAccountForm").serializeObject();
	    data.accountId = $("#medicalAccountForm").attr("accountId")
	    data = $.toJSON(data);
	    $.ajax({
	        type: "POST",
	        async: true,
	        url: GLOBAL.WEBROOT + "/account/saveMedicalSupAccount?type="+type,
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

 