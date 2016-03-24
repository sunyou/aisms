<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
    <%@ include file="/common/meta.jsp" %>
    <title>抗菌药物滥用</title>
    <link href="${ctx}/sms/statics/common/css/css.css" rel="stylesheet" type="text/css"/> 
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/ace/plugins/easyui/default/easyui.css"/>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/jquery-easyui/themes/default/easyui.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/jquery.easyui.min.js"></script>
    
    <link type="text/css" rel="stylesheet" href="${ctx}/sms/statics/common/js/date/skin/WdatePicker.css"/>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/date/WdatePicker.js"></script> 
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/jquery.jqGrid.min.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/ace/plugins/jqGrid/grid.locale-cn.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/pages/js/rationalDrugUse/antibacterials.js"></script>
    <script type="text/javascript" src="${ctx}/sms/statics/common/js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <style type="text/css">
      .ui-jqgrid-btable .ui-widget-content.ui-state-highlight {
       background-color: #c4efc9
      }
    </style>
        
</head>
<body>
<div class="wrap100 quickrecharge">
	<div class="tabbable" style=" margin-top:10px">
       <ul class="nav nav-tabs padding-12 tab-color-blue background-blue" id="myTab4">
           <li class="active">
               <a data-toggle="tab" href="#orgDiv" aria-expanded="true">机构</a>
           </li>

           <li class="">
               <a data-toggle="tab" href="#hospitalDiv" aria-expanded="false">个人</a>
           </li> 
       </ul>
         
      <div class="tab-content">       
		<div class="q_r_list tab-pane active" id="orgDiv" >	
		<!--查询条件 begin-->
	        <div class="listTable">
	            <input type="hidden" id="currentLocId" value="${cookie_locId }"/>
	            <input type="hidden" id="AUDIT_REPORT_BUTTON" value="${AUDIT_REPORT_BUTTON }"/>
	            <input type="hidden" id="pacsViewPath" value="${pacsViewPath }"/>
	            <form id="searchForm" action="#">
	                <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th class="r" width="6%">时间 ：</th>
	                        <td width="13%" colspan="2">
	                            <label><input name="date1" type="radio" value="1" onchange="changeDate(1)"/>日 </label> 
								<label><input name="date1" type="radio" value="2" onchange="changeDate(2)"/>月 </label> 
								<label><input name="date1" type="radio" value="3" onchange="changeDate(3)"/>年 </label> 
	                            <select id="year" name="year" style="width:120px;display:none;"  multiply="true" >                               
	                               <option>2015</option>
	                               <option>2014</option>
	                               <option>2013</option>
	                               <option>2012</option>
	                               <option>2011</option>
	                               <option>2010</option>
	                               <option>2009</option>
	                               <option>2008</option>
	                               <option>2007</option>
	                               <option>2006</option>
	                               <option>2005</option>
	                               <option>2004</option>
	                               <option>2003</option>
	                               <option>2002</option>
	                            </select> 
	                            <select id="month" name="locId" style="width:120px;display:none;"  multiply="true" >                               
	 							   <option>1</option>
	                               <option>2</option>
	                               <option>3</option>
	                               <option>4</option>
	                               <option>5</option>
	                               <option>6</option>
	                               <option>7</option>
	                               <option>8</option>
	                               <option>9</option>
	                               <option>10</option>
	                               <option>11</option>
	                               <option>12</option> 
	                            </select>  
	                            <input id="dateTime" name="dateTime" class="inputW120" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	                        </td>                        
	                        <th width="6%" class="r">行政区划：</th>
	                        <td width="13%">
	                            <select id="area" name="area" style="width:160px;"  multiply="true" >                               
	 							   <option>请选择</option>
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
	 							   <option>请选择</option>
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
	 							   <option>请选择</option>
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
	                        <th class="r" width="6%">规则名称 ：</th>
	                        <td width="13%"  >
	                            <select id="ruleId" name="ruleId" style="width:160px;" >
	                                <option value="-1">请选择</option>
	                                <option value="-1">规则1</option>
	                                <option value="-1">规则2</option>
	                                <option value="-1">规则3</option> 
	                            </select> 
	                        </td> 
	                       <th class="r" width="6%"></th>                        
	                       <td class="r n_b_b" >
	                       <a href="javascript:void(0)" onclick="reloadGrid()" class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span class="icon-search"></span>查询</a> 
	                         
	                       <a href="javascript:void(0)" onclick="reset()" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span class="icon-retweet"></span>重 置</a>
	  
	                       </td>                      
	                    </tr>
	                </table>
	            </form>
	             
	        </div>
	        <!--查询条件 end-->
				<div>
	            	<table id="anlist" width="100%" border="0" cellspacing="0" cellpadding="0">
	               
	            	</table>
	            	<div id="anlist_pager"></div>
	        	</div>
	     </div>
	 
		<div class="q_r_list tab-pane" id="hospitalDiv">	
		<!--查询条件 begin-->
	        <div class="listTable">
	            <input type="hidden" id="currentLocId" value="${cookie_locId }"/>
	            <input type="hidden" id="AUDIT_REPORT_BUTTON" value="${AUDIT_REPORT_BUTTON }"/>
	            <input type="hidden" id="pacsViewPath" value="${pacsViewPath }"/>
	            <form id="searchForm2" action="#">
	                <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                        <th class="r" width="6%">时间 ：</th>
	                        <td width="13%" colspan="2">
	                            <label><input name="date1" type="radio" value="1" onchange="changeDate(1)"/>日 </label> 
								<label><input name="date1" type="radio" value="2" onchange="changeDate(2)"/>月 </label> 
								<label><input name="date1" type="radio" value="3" onchange="changeDate(3)"/>年 </label> 
	                            <select id="year" name="year" style="width:120px;display:none;"  multiply="true" >                               
	                               <option>2015</option>
	                               <option>2014</option>
	                               <option>2013</option>
	                               <option>2012</option>
	                               <option>2011</option>
	                               <option>2010</option>
	                               <option>2009</option>
	                               <option>2008</option>
	                               <option>2007</option>
	                               <option>2006</option>
	                               <option>2005</option>
	                               <option>2004</option>
	                               <option>2003</option>
	                               <option>2002</option>
	                            </select> 
	                            <select id="month" name="locId" style="width:120px;display:none;"  multiply="true" >                               
	 							   <option>1</option>
	                               <option>2</option>
	                               <option>3</option>
	                               <option>4</option>
	                               <option>5</option>
	                               <option>6</option>
	                               <option>7</option>
	                               <option>8</option>
	                               <option>9</option>
	                               <option>10</option>
	                               <option>11</option>
	                               <option>12</option> 
	                            </select>  
	                            <input id="dateTime" name="dateTime" class="inputW120" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	                        </td>                        
	                        <th width="6%" class="r">行政区划：</th>
	                        <td width="13%">
	                            <select id="area" name="area" style="width:160px;"  multiply="true" >                               
	 							   <option>请选择</option>
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
	 							   <option>请选择</option>
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
	 							   <option>请选择</option>
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
	                        <th class="r" width="6%">医生姓名 ：</th>
	                        <td width="13%"  >
	                              <input id="dateTime" name="dateTime" class="inputW160" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	                        </td> 
	                      <th class="r" width="6%">医生身份证号 ：</th>
	                        <td width="13%"  >
	                              <input id="dateTime" name="dateTime" class="inputW160" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"/>
	                        </td>                     
	                    </tr>
	                    <tr>                        
	                        <th class="r" width="6%">规则名称 ：</th>
	                        <td width="13%"  colspan="2">
	                            <select id="ruleId" name="ruleId" style="width:160px;" >
	                                <option value="-1">请选择</option>
	                                <option value="-1">规则1</option>
	                                <option value="-1">规则2</option>
	                                <option value="-1">规则3</option> 
	                            </select> 
	                        </td>
	                       <th></th><td></td>  
	                       <th class="r" width="6%"></th>                        
	                       <td class="r n_b_b" colspan="1">
	                       <a href="javascript:void(0)" onclick="reloadGrid()" class="fm-button ui-state-default ui-corner-all fm-button-icon-right ui-reset btn btn-sm btn-success"><span class="icon-search"></span>查询</a> 
	                         
	                       <a href="javascript:void(0)" onclick="reset()" class="fm-button ui-state-default ui-corner-all fm-button-icon-left ui-search btn btn-sm btn-gray"><span class="icon-retweet"></span>重 置</a>
	  
	                       </td>                      
	                    </tr>
	                </table>
	            </form>
	             
	        </div>
	        <!--查询条件 end-->
				<div>
	            	<table id="anlistHispital" width="100%" border="0" cellspacing="0" cellpadding="0">
	               
	            	</table>
	            	<div id="anlistHispital_pager"></div>
	        	</div>
       </div>	
   </div>   
</div> 

</body>
</html>
