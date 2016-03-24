<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/ace/plugins/easyui/default/easyui.css"/>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/date/skin/WdatePicker.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script> 
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/configManage/basePage.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
      .ui-jqgrid-btable .ui-widget-content.ui-state-highlight {
       background-color: #c4efc9
      }
    </style>
        
</head>
<body>
<input type="hidden" id="dirId" value="${dirId }" />
<div class="wrap100 quickrecharge">
		<div class="q_r_list" id="hospitalDiv">	
		<!--查询条件 begin-->
	        <div class="listTable">
	            <input type="hidden" id="currentLocId" value="${cookie_locId }"/>
	            <input type="hidden" id="AUDIT_REPORT_BUTTON" value="${AUDIT_REPORT_BUTTON }"/>
	            <input type="hidden" id="pacsViewPath" value="${pacsViewPath }"/>
	            <form id="searchForm" action="#">
	                <table id="tableQuery" width="100%" border="0" cellspacing="0" cellpadding="0">                 
                        <tr>
	                       <td colspan="6"></td>
	                       <td colspan="2">
	                       	<a href="javascript:void(0)" onclick="reloadGrid()" class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span class="icon-search"></span>查询</a> 
	                       	<a href="javascript:void(0)" onclick="reset()" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span class="icon-retweet"></span>重 置</a>
	                       </td>                      
	                    </tr>
	                </table>
	            </form>
	             
	        </div>
	        <!--查询条件 end-->
				<div>
	            	<table id="tableList" width="100%" border="0" cellspacing="0" cellpadding="0">
	            	</table>
	            	<div id="divPager"></div>
	        	</div>
       </div>	
    
</div> 

</body>
</html>