$(function () {
	//初始化菜单
   	 initMeun();
   
//   changeIndexPageList('prescriptiondps/init.html',this,'合理用药监管|超量用药|处方分解');
});



function changeIndex(arg,dirId,dirName,dirType){
	
	if(dirType=="1"){
		changeIndexPageList('configManage/basePage.html?dirId='+dirId,arg,dirName+"|"+dirName);	
	}

}

function initMeun(){
	var menuList = eval($("#menus").val());
	var htmlMenu = "";
	var twoHtml = "";
	var threeHtml = "";
	var endHtml="";
	var flag = "0";
	for(var i=0;i<menuList.length;i++){
		if(menuList[i].menuLevel==1){
			htmlMenu="";
			htmlMenu+="<li onmouseover=\"displaySubMenu(this)\" onmouseout=\"hideSubMenu(this)\">";
			htmlMenu+="<a href='javaScript:void(0)' onclick=\"changeIndex(this,'"+menuList[i].dirId+"','"+menuList[i].dirName+"','"+menuList[i].dirType+"')\">"+menuList[i].dirName+"</a>";
			$("#navigation").append(htmlMenu+"<ul id='fristMenu_"+menuList[i].dirId+"'></ul></li>");
		}
		if(menuList[i].menuLevel==2){
				twoHtml=""
				twoHtml+="<li onmouseover=\"displaySubMenu(this)\" onmouseout=\"hideSubMenu(this)\" class=\"two\">";
				twoHtml+="<a href='javaScript:void(0);' onclick=\"changeIndex(this,'"+menuList[i].dirId+"','"+menuList[i].dirName+"','"+menuList[i].dirType+"')\">"+menuList[i].dirName+"</a>";
				$("#fristMenu_"+menuList[i].parentId).append(twoHtml+"<ul id='threeMenu_"+menuList[i].dirId+"'></ul></li>");
		}
		if(menuList[i].menuLevel==3){
				threeHtml=""
				threeHtml+="<li onmouseover=\"displaySubMenu(this)\" onmouseout=\"hideSubMenu(this)\" class=\"three\">";
				threeHtml+="<a href='javaScript:void(0);' onclick=\"changeIndex(this,'"+menuList[i].dirId+"','"+menuList[i].dirName+"','"+menuList[i].dirType+"')\">"+menuList[i].dirName+"</a>";
				threeHtml+="</li>";
				$("#threeMenu_"+menuList[i].parentId).append(threeHtml);
		}
		
		if(menuList[i].menuType=="0"){
			flag = "1";
		}
	}
	if(flag=='1'){
		endHtml+="<li onmouseover=\"displaySubMenu(this)\" onmouseout=\"hideSubMenu(this)\"><a href='javaScript:void(0)' onclick='changeIndexPageList(\"configManage/configManage.html\",this,\"配置管理\")'>配置管理</a></li>";
		endHtml+="<li onmouseover=\"displaySubMenu(this)\" onmouseout=\"hideSubMenu(this)\"><a href='javaScript:void(0)' onclick='changeIndexPageList(\"org/init.html\",this,\"系统管理|医保机构管理\")'>系统管理</a>";
	    endHtml+="<ul class='three'>";
	    endHtml+="<li class='current'><a href='javaScript:void(0);' id='showIndex' onclick='changeIndexPageList(\"org/init.html\",this,\"系统管理|医保机构管理\")'>医保机构管理</a></li>";
	    endHtml+="<li class='current'><a href='javaScript:void(0);' onclick='changeIndexPageList(\"role/init.html\",this,\"系统管理|角色管理\")'>角色管理</a></li>";
	    endHtml+="<li class='current'><a href='javaScript:void(0);' onclick='changeIndexPageList(\"account/init.html\",this,\"系统管理|账号管理\")'>账号管理</a></li>";
	    endHtml+="<!-- <li class='current'><a href='javaScript:void(0);' onclick='changeIndexPageList('',this,'系统管理|基础信息管理')'>基础信息管理</a></li>-->";
	    endHtml+="</ul>";           
	    endHtml+="</li>";
	}
	$("#navigation").append(endHtml);
}

//解决ie下不支持placeholder（占位符）问题
function placeholder(){
	var doc=document,inputs=doc.getElementsByTagName('input'),supportPlaceholder='placeholder'in doc.createElement('input'),placeholder=function(input){var text=input.getAttribute('placeholder'),defaultValue=input.defaultValue;
    if(defaultValue==''){
        input.value=text}
        input.onfocus=function(){
            if(input.value===text){this.value=''}};
            input.onblur=function(){if(input.value===''){this.value=text}}};
            if(!supportPlaceholder){
                for(var i=0,len=inputs.length;i<len;i++){var input=inputs[i],text=input.getAttribute('placeholder');
                if(input.type==='text'&&text){placeholder(input)}}}
}
//更新导行栏
function changeNavigationBar(obj){
	
}

//页面切换
function changeIndexPageList(url,obj,homeIcon){	
	 //设置导航栏
	$("#home-icon").html("");
	 var icons = homeIcon.split("|");
	 var iconHtml = "<i class='home-icon' ></i>您现在的位置是：<a href='javaScript:void(0);' id='home-icon'>首页</a>";
	 for (i=0;i<icons.length ;i++ ){  
		 iconHtml+= " > <a href='javaScript:void(0);'>"+icons[i]+"</a>";
	 }
	 $("#home-icon").html(iconHtml);
	 //如果是当前，则直接退出
	 if($(obj).attr("class") == 'current') return false;
	 	
	 if(url!=''){
	 	$("#otherIndexInfo").show();
	 	$("#indexInfo").hide();
	 	//url = url + "?idCardNo="+idCardNo + "&patientId="+ patientId + "&_t="+(new Date()).getTime();
		$("#infoIframe").attr("src",url);
	 }else{
	 	window.top.location = GLOBAL.WEBROOT + "/manage.html";
	 }
	 //选中自己，剔除其它选中
	 $.each($("#navigation li a"),function(i,obj){
		 $(obj).removeClass("current");		 
	 });
	 $(obj).attr("class","current"); 
}
 