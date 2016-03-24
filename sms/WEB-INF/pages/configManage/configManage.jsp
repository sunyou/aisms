<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>配置管理</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/sms/statics/pages/css/configManage/default.css" rel="stylesheet" type="text/css"/> 
    <link href="${ctx}/sms/statics/pages/css/configManage/content.css" rel="stylesheet" type="text/css"/> 
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/configManage.js?date=<%=new java.util.Date() %>"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/js/fuelux/fuelux.tree.min.js"></script>
        <style>
    	.current{
    		color:red;
    	}
    </style>
</head>
<body>
<input type="hidden" id="dirId" />
<input type="hidden" id="parentId" />
<div class="wrap100 content manage_group">

    <!--left begin-->
    <div id="divLeft" class="fl left">
		<div id= "tree1" class ="tree" ></div>  
		<div id="divMenu" class="leftSub" style="display: none;z-index:99">
	         <a id="btnAddDir" href="javascript:void();">新增</a>
	         <a id="btnModifyDir" href="javascript:void();">修改</a>
	         <a id="btnDelDir" href="javascript:void();">删除</a>
         </div>
    </div>
    <!--left end-->

    <!--l_close begin-->
    <div class="fl l_close"> <a href="#"><img src="${ctx}/sms/statics/pages/images/configManage/left.png" /></a> </div>
    <!--l_close end-->

    <!--right begin-->
    <div class="fl right">

        <div class="wrap100 tmshop">
            <div class="r_list">

                <!--分类信息 begin-->
                
                <div class="listTable">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th width="13%" class="r">分类名称：</th>
                            <td width="18%">
                                <input name="input" class="inputW160" id="dirName"/>
                            </td>
                            <th class="r">建立时间 ：</th>
                            <td><input name="input2" class="inputW160" id="createTime"/></td>
                            <th class="r">建立人 ：</th>
                            <td><input name="input2" class="inputW160" id="createStaffName"/></td>
                        </tr>
                        <tr>
                            <th class="r">状态 ：</th>
                            <td><input type="radio" checked="checked" name="dirStatus" value="0"/>启用 <input type="radio" name="dirStatus" value="1"/>停用</td>
                            <th class="r">分类描述 ：</th>
                            <td colspan="3"><input name="input3" class="inputW160" id="remark"/></td>
                        </tr>
                        <tr>
                            <th class="r n_b_b">&nbsp;</th>
                            <td class="n_b_b">&nbsp;</td>
                            <th class="r n_b_b">&nbsp;</th>
                            <th colspan="3" class="r n_b_b">
                            	<a href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary" id="btnShowDir">
                            		展示管理
								</a>
                            </th>
                        </tr>
                    </table>
                </div>
                <!--分类信息 end-->
                <!--规则信息 begin-->
                
                	
                    
                <div class="listTable2">
                	<div style="margin-top:2px;margin-bottom:2px;">
	                	<a id="btnViewRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary">
	                    	<span class="icon-search"></span>查 看
	                    </a>
	                    <a id="btnAddRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary">
	                    	<span class="icon-plus-sign"></span>新 增
	                    </a>
	                    <a id="btnModifyRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-primary">
	                    	<span class="icon-edit"></span>修  改
	                    </a>
	                    <a id="btnDisableRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-danger">
	                    	<span class="icon-lock"></span>停  用
	                    </a>
	                    <a id="btnEnableRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-success">
	                    	<span class="icon-unlock"></span>启  用 
	                    </a>
	                    <a id="btnDelRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-danger">
	                    	<span class="icon-trash"></span>删  除
	                    </a>
	                    <a id="btnIllegalRule" href="javascript:void(0)" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-reset btn btn-sm btn-danger">
	                    	<span class="icon-trash"></span>违规详情配置
	                    </a>
                    </div>
					<table id="tableRule" width="100%" border="0" cellspacing="0" cellpadding="0">
		            </table>
		            <div id="divRule_pager"></div>
                </div>
                <!--规则信息 end-->
            </div>
        </div>
    </div>
</div>

</body>
</html>