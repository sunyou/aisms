var menus ;
var rootOrgId;
$(function () {
	$("#userinfo").html('<small>Welcome,</small>'+ user.operatorName);
	
	$.ajax({
        type: "POST",
        async: false,
        url:GLOBAL.WEBROOT +  '/sms/getMenus.ajax',
        dataType:'json',
        success:function(data){
//                var menus = eval($("#menus").val());
            	menus = eval(data.menus);
            	if (menus) {
		        var parentId;
		        var topId;
		        //find header topId;
		        for (var i = 0; i < menus.length; i++) {
		            parentId = menus[i].parentMenuId;
		            if (parentId == '0') {
		                topId = menus[i].menuId;
		                break;
		            }
		        }
		        var divMenuHeader = $("#menuHeader");
		        var j = 0;
		        for (var i = 0; i < menus.length; i++) {
		            parentId = menus[i].parentMenuId;
		            if (parentId == topId) {
		                divMenuHeader.append('<div class="nav-item dropdown"><ul><li><div class="nav01" id="pmenuId_'+menus[i].menuId+'"><a href="javascript:void(0)" onclick="queryMenuByParent('+parentId+','+menus[i].menuId+')">' + menus[i].menuName + '</a></div></li></ul></div>');
		                if (j == 0) {
		                    loadMenuTree(menus[i].menuId);
		                    $("#pmenuId_"+menus[i].menuId).attr("class","nav02"); 
		                    j++;
		                }
		            }
		        }
		    }
		    var target = $("#menuTree").find("a")[0].target;
			if(target=="view_frame"){
				$("#menuTree").find("a")[0].click();
			}else{
				$("#menuTree").find("a")[1].click();
			}
        }
    });

	$.ajax({
		type: "POST",
		async: false,
		url:GLOBAL.WEBROOT +  '/sms/getRootOrgId.ajax',
		dataType:'json',
		success:function(data){
			rootOrgId = data;
		}
	});
});


function loadMenuTree(topId){
    var menuTree = $("#menuTree");
    for(var i=0;i<menus.length;i++){
        //直接子节点
        if(topId == menus[i].parentMenuId) {
            if (menus[i].menuType == 1) {
                menuTree.append("<dl><h5><a href='"+menus[i].menuUrl+"' target='view_frame'><i class='fM-l-icon2'>" + menus[i].menuName + "</i></a></h5><dl>");
            } else {
                menuTree.append("<dl id='dl" + menus[i].menuId + "'><h5><a href='javascript:void(0);' onclick='changeMenu("+menus[i].menuId+")'><i class='fM-l-icon2'>" + menus[i].menuName + "</i></a></h5><dl>");
            }
        }
    }
    
    var dl
    for(var i=0;i<menus.length;i++){
        var menuId = menus[i].parentMenuId;
        dl = $("#dl"+menuId);
        if(dl){
            dl.append('<dt><a href="'+ menus[i].menuUrl +'" target="view_frame">'+menus[i].menuName+'</a></dt>');
        }
    }
}

function changeMenu(id){
	var dts = $("#dl"+id).find("dt");
	var cls = $("#dl"+id).attr("class");
	if(cls=='hideDiv'){
		if(dts&&dts.length>0){
			$("#dl"+id).removeClass("hideDiv");
			$("#dl"+id).addClass("showDiv");
			$("#dl"+id).find("i").removeClass();
			$("#dl"+id).find("i").addClass("fM-l-icon2");
			for(var i=0;i<dts.length;i++){
				$(dts[i]).show();		
			}
		}
	}else{
		if(dts&&dts.length>0){
			$("#dl"+id).removeClass("showDiv");
			$("#dl"+id).addClass("hideDiv");
			$("#dl"+id).find("i").removeClass();
			$("#dl"+id).find("i").addClass("showicon2");
			for(var i=0;i<dts.length;i++){
				$(dts[i]).hide();		
			}
		}
	}
	
}

function openMenu(url,menuId,name,isClose){
    WEB.addTab({title: name, 'url': url,closable:isClose});
}

function queryMenuByParent(parentMenuId,menuId){
		//TAB.closeAll();
		var o_id = "pmenuId_"+menuId;
		var menus = $(".nav-item").find("div"); 
		if(menus&&menus.length>0){
			for(var i=0;i<menus.length;i++){
				var temp = $(menus[i]).attr("id"); 
				if(o_id==temp){
					$(menus[i]).attr("class","nav02");
					$("#menuTree").html('');
					loadMenuTree(menuId);
					var target = $("#menuTree").find("a")[0].target;
					if(target=="view_frame"){
						$("#menuTree").find("a")[0].click();
					}else{
						$("#menuTree").find("a")[1].click();
					}
				}else{
					$(menus[i]).attr("class","nav01"); 
				}
			} 
		}
}

function switchBarl(){
	 var imgsrc=document.all("makeleft").src;
	 if (imgsrc.indexOf("fM-left.png")>1){  
		 document.all("makeleft").src=GLOBAL.WEBROOT+"/sms/statics/pages/css/index/images/fM-right.png";  
		 document.all("makeleft").title="隐藏左边的菜单";  
		 $("#left_content").removeClass();
		 $("#left_content").addClass("fl all_content");
//		 $("#left_scroll").removeClass();
//		 $("#left_scroll").addClass("fl l_left");
		 $("#left_scroll").css("left",0);
		 $("#menuTree").hide(); 
		 
	 }else{  
		 document.all("makeleft").src=GLOBAL.WEBROOT+"/sms/statics/pages/css/index/images/fM-left.png";  
		 document.all("makeleft").title="显示左边的菜单";  
		 $("#left_content").removeClass();
		 $("#left_content").addClass("fl right");
		 $("#left_scroll").css("left",240);
//		 $("#left_scroll").addClass("fl l_close");
		 $("#menuTree").show(); 
	 }
}
