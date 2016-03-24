$(function () {
	//初始化界面
	initDir();
	//保存目录
	$("#btnSaveDir").click(function(){
		saveDir();
	});
});
//初始化界面
function initDir(){
	var dirId = $("#dirId").val();
	if(dirId=="" || dirId=="0"){
		$("#btnShowDir").remove();
		return;
	}
	$.ajax({
			type:"POST", 
			async:true, 
			url:GLOBAL.WEBROOT + "/configManage/getDir.ajax",
			data:{
				dirId:dirId
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					$("#dirId").val(data.dirId);
					$("#parentId").val(data.parentId);
					$("#dirName").val(data.dirName);
					$("[name='dirType'][value='"+data.dirType+"']").attr("checked","checked");
					$("[name='dirStatus'][value='"+data.dirStatus+"']").attr("checked","checked");
					$("#remark").val(data.remark);
					reloadGrid();
				}else{
					alert("获取目录失败");
				}
			}
	});
}
//保存目录
function saveDir(){
	if($("#dirName").val()==""){
		alert("目录名称不能为空");
		return;
	}
	if($("#dirId").val()==""){
		$("#dirId").val("0");
	}
	if($("#parentId").val()==""){
		$("#parentId").val("0");
	}
	$.ajax({
			type:"POST", 
			async:true, 
			url:GLOBAL.WEBROOT + "/configManage/saveDir.ajax",
			data:{
				dirName:$("#dirName").val(),
				dirType:$("[name='dirType']:checked").val(),
				dirStatus:$("[name='dirStatus']:checked").val(),
				menuType:"1",
				remark:$("#remark").val(),
				dirId:$("#dirId").val(),
				parentId:$("#parentId").val()
			},
			success:function (data) {
				if (data.ERRCODE == "0") {
					alert("保存成功");
					saveSuccess();
				}else{
					alert("保存失败");
				}
			}
	});
}
function saveSuccess(){
//    parent.bindTree();
	parent.location.reload();
    closeLayer();
}
function closeLayer(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}