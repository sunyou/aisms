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
        url: GLOBAL.WEBROOT +"/account/getAccountRoleList.ajax?orgId="+$("#searchFormSe").attr("orgId")+"&accountCode="+$("#searchFormSe").attr("accountCode"),
        success: function (data) {
    	
            //加载未加入角色列表
			var notJoinRole = eval(data.NotJoinRole);
			var oldRoleSelect = $("#rolelist");
            oldRoleSelect.multiselect2side('destroy');
            oldRoleSelect.empty();
            for (var i = 0; i < notJoinRole.length; i++) {
                oldRoleSelect.append("<option value='" + notJoinRole[i].roleCode + "'>" + notJoinRole[i].roleCode+"_"+ notJoinRole[i].roleName + "</option>");
            }
            $('#rolelist').multiselect2side({
			   //search: "<img src='img/search.gif' />" //Search: 
			});
			//加载已加入角色列表
			var newRoleList = eval(data.NewRoleList);
			var side__dx = $("#searchablems2side__dx");
			side__dx.before("<div class='ms2side__header' style='width:250px'>账号已授权角色</div>");
			$("#searchablems2side__sx").before("<div class='ms2side__header' style='width:250px'>账号未授权角色</div>");
            side__dx.multiselect2side('destroy');
            side__dx.empty();
            for (var k = 0; k < newRoleList.length; k++) {
                side__dx.append("<option value='" + newRoleList[k].roleCode + "'>" + newRoleList[k].roleCode+"_"+ newRoleList[k].roleName + "</option>");
            }
            
            //加载未授权菜单列表
//			var notJoinMenu = eval(data.NotJoinMenu);
//			var oldMenuSelect = $("#menulist");
//            oldMenuSelect.multiselect2side('destroy');
//            oldMenuSelect.empty();
//            for (var n = 0; n < notJoinMenu.length; n++) {
//                oldMenuSelect.append("<option value='" + notJoinMenu[n].dirId + "'>" + notJoinMenu[n].dirId+"_"+ notJoinMenu[n].dirName + "</option>");
//            }
//            $('#menulist').multiselect2side({
//			   //search: "<img src='img/search.gif' />" //Search: 
//			});
//			//加载已授权菜单列表
//			var newMenuList = eval(data.NewMenuList);
//			var side2__dx = $("#searchable1ms2side__dx");
//			side2__dx.before("<div class='ms2side__header' style='width:250px'>角色已授权菜单</div>");
//			$("#searchable1ms2side__sx").before("<div class='ms2side__header' style='width:250px'>角色未授权菜单</div>");
//            side2__dx.multiselect2side('destroy');
//            side2__dx.empty();
//            for (var m = 0; m < jsonData.length; m++) {
//                side2__dx.append("<option value='" + newMenuList[m].dirId + "'>" + newMenuList[m].dirId+"_"+ newMenuList[m].dirName + "</option>");
//            }
            
            
        }
    });
}
 
function save() {
	var selectOption = $("#searchablems2side__dx option").map(function(){
		return $(this).val();
		}).get().join(",");
//	var menuOption = $("#searchable1ms2side__dx option").map(function(){
//		return $(this).val();
//		}).get().join(",");
	$.ajax({
        type: "POST",
        url: GLOBAL.WEBROOT +"/account/saveAccountRoleList?orgId="+$("#searchFormSe").attr("orgId")+"&accountCode="+$("#searchFormSe").attr("accountCode")+"&selectOption="+selectOption,
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

 