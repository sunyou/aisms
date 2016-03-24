$(function () {
	$("#closeBtn").click(function(){
       closeDiv();
    });
	selectDataset();
	
	$("#saveBtn").click(function(){
		save();
	});
});


function closeDiv(){
	var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}

//角色用户授权
function selectDataset(){
	
    $.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/role/getRoleList.ajax?orgId="+$("#searchFormSe").attr("orgId")+"&roleCode="+$("#searchFormSe").attr("roleCode"),
        success: function (data) {
    	
            //加载未加入用户列表
			var notJoinAccount = eval(data.NotJoinAccount);
			var oldAccountSelect = $("#accountlist");
            oldAccountSelect.multiselect2side('destroy');
            oldAccountSelect.empty();
            for (var i = 0; i < notJoinAccount.length; i++) {
                oldAccountSelect.append("<option value='" + notJoinAccount[i].accountCode + "'>" + notJoinAccount[i].accountCode+"_"+ notJoinAccount[i].accountName + "</option>");
            }
            $('#accountlist').multiselect2side({
			   //search: "<img src='img/search.gif' />" //Search: 
			});
			//加载已加入用户列表
			var jsonData = eval(data.NewAccountList);
			var side__dx = $("#searchablems2side__dx");
			side__dx.before("<div class='ms2side__header' style='width:250px'>角色已授权用户</div>");
			$("#searchablems2side__sx").before("<div class='ms2side__header' style='width:250px'>角色未授权用户</div>");
            side__dx.multiselect2side('destroy');
            side__dx.empty();
            for (var k = 0; k < jsonData.length; k++) {
                side__dx.append("<option value='" + jsonData[k].accountCode + "'>" + jsonData[k].accountCode+"_"+ jsonData[k].accountName + "</option>");
            }
            
            //加载未授权菜单列表
			var notJoinMenu = eval(data.NotJoinMenu);
			var oldMenuSelect = $("#menulist");
            oldMenuSelect.multiselect2side('destroy');
            oldMenuSelect.empty();
            for (var n = 0; n < notJoinMenu.length; n++) {
                oldMenuSelect.append("<option value='" + notJoinMenu[n].dirId + "'>" + notJoinMenu[n].dirId+"_"+ notJoinMenu[n].dirName + "</option>");
            }
            $('#menulist').multiselect2side({
			   //search: "<img src='img/search.gif' />" //Search: 
			});
			//加载已授权菜单列表
			var newMenuList = eval(data.NewMenuList);
			var side2__dx = $("#searchable1ms2side__dx");
			side2__dx.before("<div class='ms2side__header' style='width:250px'>角色已授权菜单</div>");
			$("#searchable1ms2side__sx").before("<div class='ms2side__header' style='width:250px'>角色未授权菜单</div>");
            side2__dx.multiselect2side('destroy');
            side2__dx.empty();
            for (var m = 0; m <= newMenuList.length; m++) {
                side2__dx.append("<option value='" + newMenuList[m].dirId + "'>" + newMenuList[m].dirId+"_"+ newMenuList[m].dirName + "</option>");
            }
            
            
        }
    });
}
 
function save() {
	var selectOption = $("#searchablems2side__dx option").map(function(){
		return $(this).val();
		}).get().join(",");
	var menuOption = $("#searchable1ms2side__dx option").map(function(){
		return $(this).val();
		}).get().join(",");
	$.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/role/saveAccountRole?orgId="+$("#searchFormSe").attr("orgId")+"&roleCode="+$("#searchFormSe").attr("roleCode")+"&selectOption="+selectOption+"&menuOption="+menuOption,
		dataType: 'json',
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

 