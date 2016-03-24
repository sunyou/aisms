<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>单次分项占比</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/date/skin/WdatePicker.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script> 
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/singleitemaccount/singleitemaccount.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
      .ui-jqgrid-btable .ui-widget-content.ui-state-highlight {
       background-color: #c4efc9
      }
    </style>
        
</head>
<body>
<div class="wrap100 quickrecharge"> 
	
	<div class="q_r_list">
	
	<!--查询条件 begin-->
        <div class="listTable">
            <input type="hidden" id="currentLocId" value="${cookie_locId }"/>
            <input type="hidden" id="AUDIT_REPORT_BUTTON" value="${AUDIT_REPORT_BUTTON }"/>
            <input type="hidden" id="pacsViewPath" value="${pacsViewPath }"/>
            <form id="searchForm" action="#">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th class="r" width="6%">出院时间 ：</th>
                        <td width="13%" colspan="2">
                            <label><input name="date1" type="radio" value="day" checked="checked"/>日 </label> 
							<label><input name="date1" type="radio" value="month" />月 </label> 
							<label><input name="date1" type="radio" value="year" />年 </label> 
                            <input id="dateTime" name="dateTime" class="inputW120" onfocus="formatDate()"/>
                        </td>                        
                        <th width="6%" class="r">行政区划：</th>
                        <td width="13%">
                            <select id="area" name="area" style="width:160px;"  multiply="true" >                               
 							   <option value="-1">请选择</option>
                               <option>秦都区</option>
                               <option>渭城区</option>
                               <option>旬邑县</option>
                               <option>礼泉县</option>
                               <option>乾县</option> 
                               <option>兴平市</option> 
                               <option>武功县</option> 
                            </select> 
                        </td> 
                        <th width="6%" class="r">机构类别：</th>
                        <td width="13%">
                            <select id="level" name="level" style="width:160px;"  multiply="true" >                               
 							   <option value="-1">请选择</option>
                               <option>三级医院</option>
                               <option>二级医院</option>
                               <option>一级医院</option> 
                            </select> 
                        </td> 
                    </tr>
                    <tr>
                        <th width="6%" class="r">机构名称：</th>
                        <td width="13%" colspan="2">
                            <select id="hospitalId" name="hospitalId" style="width:160px;"   >                               
 							   <option value="-1">请选择</option>
                               <option>二一五医院</option>
                               <option>中心医院</option>
                               <option>陕中附院</option> 
                               <option>旬邑县人民医院</option>
                               <option>长武县人民医院</option>
                               <option>西兰社区卫生服务中心</option> 
                               <option>大王镇卫生院</option>
                               <option>西橡医院</option>
                               <option>老百姓大药房</option> 
                            </select> 
                        </td> 
                        <th class="r" width="6%">患者姓名 ：</th>
                        <td width="13%"  >
                            <input type="input" id="patientName" name="patientName" class="inputW160 form-control">
                        </td>
                        <th class="r" width="6%">患者身份证号：</th>
                        <td width="13%"  >
                            <input type="input" id="patientCardId" name="patientCardId"  class="inputW160 form-control">
                        </td>
                      </tr>
                      <tr>
                        <th class="r" width="6%">医生姓名：</th>
                        <td width="13%"  colspan="2">
                            <input type="input" id="doctorName" name="doctorName" class="inputW160 form-control">
                        </td>
                        <th class="r" width="6%">医生身份证号：</th>
                        <td width="13%"  >
                            <input type="input" id="doctorCardId" name="doctorCardId" class="inputW160 form-control">
                        </td>
                        <th class="r" width="6%">规则名称 ：</th>
                        <td width="13%"  >
                            <select id="ruleId" name="ruleId" style="width:160px;" >
                                <option value="-1">请选择</option>
                                <option value="-1">规则1</option>
                                <option value="-1">规则2</option>
                                <option value="-1">规则3</option> 
                            </select> 
                        </td> 
                      </tr>
                      <tr>
                       <th class="r" width="6%"></th>                        
                       <td class="r n_b_b" colspan="5">
                       </td>                      
  					   <td>
  					   	<a href="javascript:void(0)" onclick="reloadGrid()" class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span class="icon-search"></span>查询</a> 
                       <a href="javascript:void(0)" onclick="com.ai.bdx.util.reset('searchForm');" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span class="icon-retweet"></span>重 置</a>
  					   </td>
                      </tr>
                </table>
            </form>
             
        </div>
        <!--查询条件 end-->
			<div>
            	<table id="singleitemlist" width="100%" border="0" cellspacing="0" cellpadding="0">
               
            	</table>
            	<div id="singleitemlist_pager"></div>
        	</div>
        </div>
</div> 

</body>
</html>
